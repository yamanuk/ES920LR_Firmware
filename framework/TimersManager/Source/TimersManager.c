/*!
* Copyright (c) 2014, Freescale Semiconductor, Inc.
* All rights reserved.
*
* \file TimersManager.c
* TIMER implementation file for the ARM CORTEX-M4 processor
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* o Redistributions of source code must retain the above copyright notice, this list
*   of conditions and the following disclaimer.
*
* o Redistributions in binary form must reproduce the above copyright notice, this
*   list of conditions and the following disclaimer in the documentation and/or
*   other materials provided with the distribution.
*
* o Neither the name of Freescale Semiconductor, Inc. nor the names of its
*   contributors may be used to endorse or promote products derived from this
*   software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
* ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
* ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include "EmbeddedTypes.h"
#include "TimersManagerInternal.h"
#include "cmsis_os.h"
#include "Panic.h"
#if gTMR_Enabled_d
#include "StackTimer.h"
#endif
#if gPrecision_Timers_Enabled_d
#include "PrecisionTimer.h"
#endif
#if gTimestamp_Enabled_d
#include "RealTimeClock.h"
#include "RTC_PDD.h"
#endif
#if gTMR_PIT_Timestamp_Enabled_d
#include "PitTimeStamp.h"
#endif
#include "TimersManager.h"

/*****************************************************************************
******************************************************************************
* Private macros
******************************************************************************
*****************************************************************************/
#define mTmrDummyEvent_c (1<<0)

/*****************************************************************************
 *****************************************************************************
 * Private memory definitions
 *****************************************************************************
 *****************************************************************************/

#if gTMR_Enabled_d

/*
 * NAME: previousTimeInTicks
 * DESCRIPTION: The previous time in ticks when the counter register was read
 * VALUES: 0..65535
 */
static tmrTimerTicks16_t previousTimeInTicks;

/*
 * NAME: mMaxToCountDown_c
 * DESCRIPTION:  Count to maximum (0xffff - 10*1ms(in ticks)), to be sure that
 * the currentTimeInTicks will never roll over previousTimeInTicks in the
 * TMR_Thread(); A thread have to be executed at most in 1ms.
 * VALUES: 0..65535
 */
static uint16_t mMaxToCountDown_c;

/*
 * NAME: mTicksFor1ms
 * DESCRIPTION:  Ticks for 1ms. The TMR_Thread()event will not be issued faster than 1ms
 * VALUES: uint32_t range
 */
static uint32_t mTicksFor1ms;

/*
 * NAME: mCounterFreqHz
 * DESCRIPTION:  The counter frequency in hz.
 * VALUES: see definition
 */
static uint32_t mCounterFreqHz;

/*
 * NAME: maTmrTimerTable
 * DESCRIPTION:  Main timer table. All allocated timers are stored here.
 *               A timer's ID is it's index in this table.
 * VALUES: see definition
 */
static tmrTimerTableEntry_t maTmrTimerTable[gTmrTotalTimers_c];

/*
 * NAME: maTmrTimerStatusTable
 * DESCRIPTION: timer status stable. Making the single-byte-per-timer status
 *              table a separate array saves a bit of code space.
 *              If an entry is == 0, the timer is not allocated.
 * VALUES: see definition
 */
static tmrStatus_t maTmrTimerStatusTable[gTmrTotalTimers_c];

/*
 * NAME: numberOfActiveTimers
 * DESCRIPTION: Number of Active timers (without low power capability)
 *              the MCU can not enter low power if numberOfActiveTimers!=0
 * VALUES: 0..255
 */
static uint8_t numberOfActiveTimers = 0;

/*
 * NAME: numberOfLowPowerActiveTimers
 * DESCRIPTION: Number of low power active timer.
 *              The MCU can enter in low power if more low power timers are active
 * VALUES:
 */
static uint8_t numberOfLowPowerActiveTimers = 0;

#if 0
/*
 * NAME: PE_LDD_DeviceDataList
 * DESCRIPTION: Array of initialized device structures of LDD components.
 * VALUES:
 */
LDD_TDeviceData *PE_LDD_DeviceDataList[] = {NULL};
#endif

#define IncrementActiveTimerNumber(type)  (((type) & gTmrLowPowerTimer_c) \
                                          ?(++numberOfLowPowerActiveTimers) \
                                          :(++numberOfActiveTimers) )
#define DecrementActiveTimerNumber(type)  (((type) & gTmrLowPowerTimer_c) \
                                          ?(--numberOfLowPowerActiveTimers) \
                                          :(--numberOfActiveTimers) )

/*
 * NAME: timerHardwareIsRunning
 * DESCRIPTION: Flag if the hardware timer is running or not
 * VALUES: TRUE/FALSE
 */
static bool_t timerHardwareIsRunning = FALSE;

/*
 * NAME: gTimerHandle
 * DESCRIPTION: Hardware timer handle
 * VALUES:
 */
static LDD_TDeviceData *gTimerHandle;

/*
 * NAME: StackTimer_OnChannel0_Notify_fptr
 * DESCRIPTION: Function pointer for timer callback. Gets called from PEx Events.c
 * VALUES:
 */
extern void (*StackTimer_OnChannel0_Notify_fptr)(LDD_TUserData*);

/*
 * NAME:
 * DESCRIPTION: Defines the timer thread
 * VALUES:
 */
#if defined(__GNUC__)
osThreadLink_t osThreadLink_TMR_Thread[1] = {0};
uint8_t osThread_TMR_Thread_stack[(gTmrTaskStackSize_c)*(1)];
uint8_t osThread_TMR_Thread_signal[36*(1)];
osThreadDef_t os_thread_def_TMR_Thread = { TMR_Thread,
                                           osPriorityRealtime,
                                           1,
                                           gTmrTaskStackSize_c,
                                           osThread_TMR_Thread_stack,
                                           osThread_TMR_Thread_signal,
                                           osThreadLink_TMR_Thread,
                                           "TMR_Thread"};
#else
osThreadDef( TMR_Thread, osPriorityRealtime, 1, gTmrTaskStackSize_c );
#endif

/*
 * NAME:
 * DESCRIPTION: The OS threadId for TMR task.
 * VALUES:
 */
static osThreadId mTimerThreadId;

#endif /*gTMR_Enabled_d*/

#if gPrecision_Timers_Enabled_d

/*
 * NAME: globalTimeTicks
 * DESCRIPTION: 64bit timer extension.
 * VALUES:
 */
static volatile tmrTimerTicks64_t globalTimeTicks;

/*
 * NAME: gPrecisionTimerHandle
 * DESCRIPTION: Hardware timer handle for precision timer
 * VALUES:
 */
static LDD_TDeviceData *gPrecisionTimerHandle;

/*
 * NAME: gPrecisionTimerTickus
 * DESCRIPTION: Period of the hardware timer tick for precision timer
 * VALUES:
 */
static uint32_t gPrecisionTimerTickus;

/*
 * NAME: gPrecisionTimerTickusReal
 * DESCRIPTION: Period of the hardware timer tick for precision timer
 * VALUES:
 */
static float gPrecisionTimerTickusReal;

/*
 * NAME: gPrecisionTimerPeriodTicks
 * DESCRIPTION: Period in ticks of the precision timer
 * VALUES:
 */
static uint32_t gPrecisionTimerPeriodTicks;

/*
 * NAME: PrecisionTimer_OnCounterRestart_fptr
 * DESCRIPTION: Function pointer for pit timer callback. Gets called from PEx Events.c
 * VALUES:
 */
extern void (*PrecisionTimer_OnCounterRestart_fptr)(LDD_TUserData*);

#endif

#if gTimestamp_Enabled_d

/*
 * NAME: gRTCHandle
 * DESCRIPTION: Hardware timer handle for RTC
 * VALUES:
 */
static LDD_TDeviceData *gRTCHandle;

/*
 * NAME: RealTimeClock_OnAlarm_fptr
 * DESCRIPTION: Function pointer for RTC timer callback. Gets called from PEx Events.c
 * VALUES:
 */
extern void (*RealTimeClock_OnAlarm_fptr)(LDD_TUserData*);

/*
 * NAME: gRTCTimeOffset
 * DESCRIPTION: Holds time offset in microseconds, used to calculate the date
 * VALUES:
 */
static volatile uint64_t gRTCTimeOffset;

/*
 * NAME: gRTCPrescalerOffset
 * DESCRIPTION: Holds time prescaler offset in ticks, used to calculate the date
 * VALUES:
 */
static volatile uint16_t gRTCPrescalerOffset;

/*
 * NAME: gRTCAlarmCallback
 * DESCRIPTION: Callback for the alarm.
 * VALUES:
 */
static pfTmrCallBack_t gRTCAlarmCallback;

/*
 * NAME: gRTCAlarmCallbackParam
 * DESCRIPTION: Parameter for the alarm callback.
 * VALUES:
 */
static void *gRTCAlarmCallbackParam;

#endif /*gTimestamp_Enabled_d*/


#if gTMR_PIT_Timestamp_Enabled_d
static LDD_TDeviceData *gPITHandle;
#if (defined(MCU_MKL26Z4) || defined(MCU_MKL46Z4))
static uint32_t mPIT_TimestampHigh;
#endif
#endif
/*****************************************************************************
 *****************************************************************************
 * Private prototypes
 *****************************************************************************
 *****************************************************************************/

#if gTMR_Enabled_d

/*---------------------------------------------------------------------------
 * NAME: TMR_GetTimerStatus
 * DESCRIPTION: RETURNs the timer status
 * PARAMETERS:  IN: timerID - the timer ID
 * RETURN: see definition of tmrStatus_t
 * NOTES: none
 *---------------------------------------------------------------------------*/
static tmrStatus_t TMR_GetTimerStatus
(
    tmrTimerID_t timerID
);

/*---------------------------------------------------------------------------
 * NAME: TMR_SetTimerStatus
 * DESCRIPTION: Set the timer status
 * PARAMETERS:  IN: timerID - the timer ID
 *             IN: status - the status of the timer
 * RETURN: None
 * NOTES: none
 *---------------------------------------------------------------------------*/
static void TMR_SetTimerStatus
(
    tmrTimerID_t timerID,
    tmrStatus_t status
);

/*---------------------------------------------------------------------------
 * NAME: TMR_GetTimerType
 * DESCRIPTION: RETURNs the timer type
 * PARAMETERS:  IN: timerID - the timer ID
 * RETURN: see definition of tmrTimerType_t
 * NOTES: none
 *---------------------------------------------------------------------------*/
static tmrTimerType_t TMR_GetTimerType
(
    tmrTimerID_t timerID
);

/*---------------------------------------------------------------------------
 * NAME: TMR_SetTimerType
 * DESCRIPTION: Set the timer type
 * PARAMETERS:  IN: timerID - the timer ID
 *              IN: type - timer type
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
static void TMR_SetTimerType
(
    tmrTimerID_t timerID,
    tmrTimerType_t type
);

/*---------------------------------------------------------------------------
 * NAME: TmrTicksFromMilliseconds
 * DESCRIPTION: Convert milliseconds to ticks
 * PARAMETERS:  IN: milliseconds
 * RETURN: tmrTimerTicks32_t - ticks number
 * NOTES: none
 *---------------------------------------------------------------------------*/
tmrTimerTicks32_t TmrTicksFromMilliseconds
(
    tmrTimeInMilliseconds_t milliseconds
);

/*---------------------------------------------------------------------------
 * NAME: StackTimer_Interrupt_Wrapper
 * DESCRIPTION: Interrupt wrapper for driver ISR.
 * PARAMETERS:  IN: Dummy parameter.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void StackTimer_Interrupt_Wrapper
(
    void *param
);

/*---------------------------------------------------------------------------
 * NAME: StackTimer_OnChannel0_Notify
 * DESCRIPTION: Event function called by driver ISR on channel match in interrupt context.
 * PARAMETERS:  IN: User data; unused.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void StackTimer_OnChannel0_Notify
(
    LDD_TUserData *UserDataPtr
);

/*---------------------------------------------------------------------------
 * NAME: StackTimer_OnCounterRestart
 * DESCRIPTION: Event function called by driver ISR on timer overflow in interrupt context.
 * PARAMETERS:  IN: User data; unused.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void StackTimer_OnCounterRestart
(
    LDD_TUserData *UserDataPtr
);

#endif /*gTMR_Enabled_d*/

#if gPrecision_Timers_Enabled_d

/*---------------------------------------------------------------------------
 * NAME: TMR_PrecisionTimerOverflowNotify
 * DESCRIPTION: Event function called by driver ISR on timer overflow in interrupt context.
 * PARAMETERS:  IN: User data; unused.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void TMR_PrecisionTimerOverflowNotify
(
    LDD_TUserData *UserDataPtr
);

#endif /*gPrecision_Timers_Enabled_d*/

#if gTimestamp_Enabled_d

/*---------------------------------------------------------------------------
 * NAME: TMR_RTCAlarmNotify
 * DESCRIPTION: Event function called by driver ISR on RTC alarm in interrupt context.
 * PARAMETERS:  IN: User data; unused.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void TMR_RTCAlarmNotify
(
    LDD_TUserData *UserDataPtr
);

#endif /*gTimestamp_Enabled_d*/

/*****************************************************************************
******************************************************************************
* Private functions
******************************************************************************
*****************************************************************************/

#if gTMR_Enabled_d

/*---------------------------------------------------------------------------
* NAME: TMR_GetTimerStatus
* DESCRIPTION: Returns the timer status
* PARAMETERS:  IN: timerID - the timer ID
* RETURN: see definition of tmrStatus_t
* NOTES: none
*---------------------------------------------------------------------------*/
static tmrStatus_t TMR_GetTimerStatus
(
    tmrTimerID_t timerID
)
{
    return maTmrTimerStatusTable[timerID] & mTimerStatusMask_c;
}

/*---------------------------------------------------------------------------
* NAME: TMR_SetTimerStatus
* DESCRIPTION: Set the timer status
* PARAMETERS:  IN: timerID - the timer ID
*              IN: status - the status of the timer
* RETURN: None
* NOTES: none
*---------------------------------------------------------------------------*/
static void TMR_SetTimerStatus
(
    tmrTimerID_t timerID,
    tmrStatus_t status
)
{
    maTmrTimerStatusTable[timerID] = (maTmrTimerStatusTable[timerID] & ~mTimerStatusMask_c) | status;
}

/*---------------------------------------------------------------------------
* NAME: TMR_GetTimerType
* DESCRIPTION: Returns the timer type
* PARAMETERS:  IN: timerID - the timer ID
* RETURN: see definition of tmrTimerType_t
* NOTES: none
*---------------------------------------------------------------------------*/
static tmrTimerType_t TMR_GetTimerType
(
    tmrTimerID_t timerID
)
{
    return maTmrTimerStatusTable[timerID] & mTimerType_c;
}

/*---------------------------------------------------------------------------
* NAME: TMR_SetTimerType
* DESCRIPTION: Set the timer type
* PARAMETERS:  IN: timerID - the timer ID
*              IN: type - timer type
* RETURN: none
* NOTES: none
*---------------------------------------------------------------------------*/
static void TMR_SetTimerType
(
    tmrTimerID_t timerID,
    tmrTimerType_t type
)
{
    maTmrTimerStatusTable[timerID] = (maTmrTimerStatusTable[timerID] & ~mTimerType_c) | type;
}

#endif /*gTMR_Enabled_d*/

#if gTimestamp_Enabled_d

/*---------------------------------------------------------------------------
 * NAME: TMR_RTCAlarmNotify
 * DESCRIPTION: Event function called by driver ISR on RTC alarm in interrupt context.
 * PARAMETERS:  IN: User data; unused.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void TMR_RTCAlarmNotify
(
    LDD_TUserData *UserDataPtr
)
{
  (void)UserDataPtr;

  RTC_PDD_DisableAlarmInterrupt((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
  if( gRTCAlarmCallback != NULL )
  {
    gRTCAlarmCallback(gRTCAlarmCallbackParam);
  }
}

#endif /*gTimestamp_Enabled_d*/

#if (gTMR_PIT_Timestamp_Enabled_d)
#if (defined(MCU_MKL26Z4) || defined(MCU_MKL46Z4))
static void TMR_PIT_ISR(void)
{
  PIT_PDD_ClearInterruptFlag(PIT_BASE_PTR, PIT_PDD_CHANNEL_1);
  mPIT_TimestampHigh--;
}
#endif
#endif

/*****************************************************************************
******************************************************************************
* Public functions
******************************************************************************
*****************************************************************************/

#if gTMR_Enabled_d

/*---------------------------------------------------------------------------
 * NAME: TmrTicksFromMilliseconds
 * DESCRIPTION: Convert milliseconds to ticks
 * PARAMETERS:  IN: milliseconds
 * RETURN: tmrTimerTicks32_t - ticks number
 * NOTES: none
 *---------------------------------------------------------------------------*/
tmrTimerTicks32_t TmrTicksFromMilliseconds
(
    tmrTimeInMilliseconds_t milliseconds
)
{
  return (uint64_t) milliseconds * mCounterFreqHz / 1000;
}

/*---------------------------------------------------------------------------
 * NAME: TMR_Init
 * DESCRIPTION: initialize the timer module
 * PARAMETERS: -
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_Init
(
    void
)
{
    gTimerHandle = StackTimer_Init(NULL);
    mCounterFreqHz = (uint32_t)((StackTimer_GetInputFrequency(gTimerHandle))); /* /compensation for PEx FRDIV bug is done in BSP*/

    StackTimer_OnChannel0_Notify_fptr = StackTimer_OnChannel0_Notify;

    /* Count to maximum (0xffff - 10*1ms(in ticks)), to be sure that the currentTimeInTicks
    will never roll over previousTimeInTicks in the TMR_Thread() */
    mMaxToCountDown_c = 0xFFFF - TmrTicksFromMilliseconds(10);
    /* The TMR_Thread()event will not be issued faster than 1ms*/
    mTicksFor1ms = TmrTicksFromMilliseconds(1);

    mTimerThreadId = osThreadCreate(osThread(TMR_Thread), NULL);

    if( mTimerThreadId == NULL )
    {
      panic( 0, (uint32_t)TMR_Init, 0, 0 );
    }
}

/*---------------------------------------------------------------------------
 * NAME: TMR_NotifyClkChanged
 * DESCRIPTION: This function is called when the clock is changed
 * PARAMETERS: IN: clkKhz (uint32_t) - new clock
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_NotifyClkChanged
(
    uint32_t clkKhz
)
{
//#warning Remove gFTMxSC_PrescaleCount_c dependence. This impacts LPM.
    //mCounterFreqHz = clkKhz/(1<<gFTMxSC_PrescaleCount_c); /*TODO: remove gFTMxSC_PrescaleCount_c dependence*/
    /* Clock was changed, so calculate again  mMaxToCountDown_c.
    Count to maximum (0xffff - 10*1ms(in ticks)), to be sure that the currentTimeInTicks
    will never roll over previousTimeInTicks in the TMR_Thread() */
    mMaxToCountDown_c = 0xFFFF - TmrTicksFromMilliseconds(10);
    /* The TMR_Thread()event will not be issued faster than 1ms*/
    mTicksFor1ms = TmrTicksFromMilliseconds(1);
}

/*---------------------------------------------------------------------------
 * NAME: TMR_AllocateTimer
 * DESCRIPTION: allocate a timer
 * PARAMETERS: -
 * RETURN: timer ID
 *---------------------------------------------------------------------------*/

tmrTimerID_t TMR_AllocateTimer
(
    void
)
{
    uint32_t i;

    for (i = 0; i < NumberOfElements(maTmrTimerTable); ++i)
    {
        if (!TMR_IsTimerAllocated(i))
        {
            TMR_SetTimerStatus(i, mTmrStatusInactive_c);
            return i;
        }
   }

   return gTmrInvalidTimerID_c;
}

/*---------------------------------------------------------------------------
 * NAME: TMR_AreAllTimersOff
 * DESCRIPTION: Check if all timers except the LP timers are OFF.
 * PARAMETERS: -
 * RETURN: TRUE if there are no active non-low power timers, FALSE otherwise
 *---------------------------------------------------------------------------*/
bool_t TMR_AreAllTimersOff
(
    void
)
{
    return !numberOfActiveTimers;
}

/*---------------------------------------------------------------------------
 * NAME: TMR_FreeTimer
 * DESCRIPTION: Free a timer
 * PARAMETERS:  IN: timerID - the ID of the timer
 * RETURN: -
 * NOTES: Safe to call even if the timer is running.
 *        Harmless if the timer is already free.
 *---------------------------------------------------------------------------*/
void TMR_FreeTimer
(
    tmrTimerID_t timerID
)
{
    TMR_StopTimer(timerID);
    TMR_MarkTimerFree(timerID);
}

#if 0
/*---------------------------------------------------------------------------
 * NAME: StackTimer_Interrupt_Wrapper
 * DESCRIPTION: Interrupt wrapper for driver ISR.
 * PARAMETERS:  IN: Dummy parameter.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void StackTimer_Interrupt_Wrapper(void *param)
{
  (void)param;
  StackTimer_Interrupt();
}
#endif

/*---------------------------------------------------------------------------
 * NAME: StackTimer_OnChannel0_Notify
 * DESCRIPTION: Event function called by driver ISR on channel match in interrupt context.
 * PARAMETERS:  IN: User data; unused.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void StackTimer_OnChannel0_Notify(LDD_TUserData *UserDataPtr)
{
  (void)UserDataPtr;
  osSignalSet( mTimerThreadId, mTmrDummyEvent_c );
}

#if 0
/*---------------------------------------------------------------------------
 * NAME: StackTimer_OnCounterRestart
 * DESCRIPTION: Event function called by driver ISR on timer overflow in interrupt context.
 * PARAMETERS:  IN: User data; unused.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void StackTimer_OnCounterRestart(LDD_TUserData *UserDataPtr)
{
  (void)UserDataPtr;
}
#endif

/*---------------------------------------------------------------------------
 * NAME: TMR_IsTimerActive
 * DESCRIPTION: Check if a specified timer is active
 * PARAMETERS: IN: timerID - the ID of the timer
 * RETURN: TRUE if the timer (specified by the timerID) is active,
 *         FALSE otherwise
 *---------------------------------------------------------------------------*/
bool_t TMR_IsTimerActive
(
    tmrTimerID_t timerID
)
{
    return TMR_GetTimerStatus(timerID) == mTmrStatusActive_c;
}

/*---------------------------------------------------------------------------
 * NAME: TMR_IsTimerReady
 * DESCRIPTION: Check if a specified timer is ready
 * PARAMETERS: IN: timerID - the ID of the timer
 * RETURN: TRUE if the timer (specified by the timerID) is ready,
 *         FALSE otherwise
 *---------------------------------------------------------------------------*/
bool_t TMR_IsTimerReady
(
    tmrTimerID_t timerID
)
{
    return TMR_GetTimerStatus(timerID) == mTmrStatusReady_c;
}

/*---------------------------------------------------------------------------
 * NAME: TMR_GetRemainingTime
 * DESCRIPTION: Returns the remaining time until timeout, for the specified
 *              timer
 * PARAMETERS: IN: timerID - the ID of the timer
 * RETURN: remaining time in milliseconds until next timer timeout
 *---------------------------------------------------------------------------*/
uint32_t TMR_GetRemainingTime
(
    tmrTimerID_t tmrID
)
{
  tmrTimerTicks32_t remainingTime, currentTime, elapsedRemainingTicks;
  unsigned int saveInt;

  if(gTmrInvalidTimerID_c == tmrID)
    return 0;

  if(maTmrTimerTable[tmrID].remainingTicks == 0)
    return 0;

  saveInt = TmrIntDisableAll();

  FTMReadCNTRegister(currentTime);

  if(currentTime < maTmrTimerTable[tmrID].timestamp)
  {
    currentTime = currentTime + 0xFFFF;
  }

  elapsedRemainingTicks = currentTime - maTmrTimerTable[tmrID].timestamp;

  if(elapsedRemainingTicks > maTmrTimerTable[tmrID].remainingTicks)
  {
    TmrIntRestoreAll(saveInt);
    return 1;
  }

  remainingTime = ((uint64_t)(maTmrTimerTable[tmrID].remainingTicks - elapsedRemainingTicks) * 1000 + mCounterFreqHz - 1) / mCounterFreqHz;

  TmrIntRestoreAll(saveInt);
  return remainingTime;
}


/*---------------------------------------------------------------------------
 * NAME: TMR_StartTimer (BeeStack or application)
 * DESCRIPTION: Start a specified timer
 * PARAMETERS: IN: timerId - the ID of the timer
 *             IN: timerType - the type of the timer
 *             IN: timeInMilliseconds - time expressed in millisecond units
 *             IN: pfTmrCallBack - callback function
 *             IN: param - parameter to callback function
 * RETURN: -
 * NOTES: When the timer expires, the callback function is called in
 *        non-interrupt context. If the timer is already running when
 *        this function is called, it will be stopped and restarted.
 *---------------------------------------------------------------------------*/
void TMR_StartTimer
(
    tmrTimerID_t timerID,
    tmrTimerType_t timerType,
    tmrTimeInMilliseconds_t timeInMilliseconds,
    void (*pfTimerCallBack)(void *),
    void *param
)
{
    tmrTimerTicks32_t intervalInTicks;

    /* check if timer is not allocated or if it has an invalid ID (fix@ENGR223389) */
    if (!TMR_IsTimerAllocated(timerID) || (gTmrInvalidTimerID_c == timerID))
      return;

    /* Stopping an already stopped timer is harmless. */
    TMR_StopTimer(timerID);

    intervalInTicks = TmrTicksFromMilliseconds(timeInMilliseconds);
    if (!intervalInTicks)
    {
        intervalInTicks = 1;
    }

    TMR_SetTimerType(timerID, timerType);
    maTmrTimerTable[timerID].intervalInTicks = intervalInTicks;
    maTmrTimerTable[timerID].remainingTicks = intervalInTicks;
    FTMReadCNTRegister(maTmrTimerTable[timerID].timestamp);
    maTmrTimerTable[timerID].pfCallBack = pfTimerCallBack;
    maTmrTimerTable[timerID].param = param;

    /* Enable timer, the timer thread will do the rest of the work. */
    TMR_EnableTimer(timerID);
}

/*---------------------------------------------------------------------------
 * NAME: TMR_StartLowPowerTimer
 * DESCRIPTION: Start a low power timer. When the timer goes off, call the
 *              callback function in non-interrupt context.
 *              If the timer is running when this function is called, it will
 *              be stopped and restarted.
 *              Start the timer with the following timer types:
 *                          - gTmrLowPowerMinuteTimer_c
 *                          - gTmrLowPowerSecondTimer_c
 *                          - gTmrLowPowerSingleShotMillisTimer_c
 *                          - gTmrLowPowerIntervalMillisTimer_c
 *              The MCU can enter in low power if there are only active low
 *              power timers.
 * PARAMETERS: IN: timerId - the ID of the timer
 *             IN: timerType - the type of the timer
 *             IN: timeIn - time in ticks
 *             IN: pfTmrCallBack - callback function
 *             IN: param - parameter to callback function
 * RETURN: type/DESCRIPTION
 *---------------------------------------------------------------------------*/
void TMR_StartLowPowerTimer
(
    tmrTimerID_t timerId,
    tmrTimerType_t timerType,
    uint32_t timeIn,
    void (*pfTmrCallBack)(void *),
    void *param
)
{
#if(gTMR_EnableLowPowerTimers_d)
    TMR_StartTimer(timerId, timerType | gTmrLowPowerTimer_c, timeIn, pfTmrCallBack, param);
#else
    timerId = timerId;
    timerType = timerType;
    timeIn = timeIn;
    pfTmrCallBack = pfTmrCallBack;
    argument = argument;
#endif
}

/*---------------------------------------------------------------------------
 * NAME: TMR_StartMinuteTimer
 * DESCRIPTION: Starts a minutes timer
 * PARAMETERS:  IN: timerId - the ID of the timer
 *              IN: timeInMinutes - time expressed in minutes
 *              IN: pfTmrCallBack - callback function
 *              IN: param - parameter to callback function
 * RETURN: None
 * NOTES: Customized form of TMR_StartTimer(). This is a single shot timer.
 *        There are no interval minute timers.
 *---------------------------------------------------------------------------*/
 #if gTMR_EnableMinutesSecondsTimers_d
void TMR_StartMinuteTimer
(
    tmrTimerID_t timerId,
    tmrTimeInMinutes_t timeInMinutes,
    void (*pfTmrCallBack)(void *),
    void *param
)
{
    TMR_StartTimer(timerId, gTmrMinuteTimer_c, TmrMinutes(timeInMinutes), pfTmrCallBack, param);
}
#endif

/*---------------------------------------------------------------------------
 * NAME: TMR_StartSecondTimer
 * DESCRIPTION: Starts a seconds timer
 * PARAMETERS:  IN: timerId - the ID of the timer
 *              IN: timeInSeconds - time expressed in seconds
 *              IN: pfTmrCallBack - callback function
 * RETURN: None
 * NOTES: Customized form of TMR_StartTimer(). This is a single shot timer.
 *        There are no interval seconds timers.
 *---------------------------------------------------------------------------*/
 #if gTMR_EnableMinutesSecondsTimers_d
void TMR_StartSecondTimer
(
    tmrTimerID_t timerId,
    tmrTimeInSeconds_t timeInSeconds,
    void (*pfTmrCallBack)(void *),
    void *argument
)
{
    TMR_StartTimer(timerId, gTmrSecondTimer_c, TmrSeconds(timeInSeconds), pfTmrCallBack, argument);
}
#endif

/*---------------------------------------------------------------------------
 * NAME: TMR_StartIntervalTimer
 * DESCRIPTION: Starts an interval count timer
 * PARAMETERS:  IN: timerId - the ID of the timer
 *              IN: timeInMilliseconds - time expressed in milliseconds
 *              IN: pfTmrCallBack - callback function
 *              IN: param - parameter to callback function
 * RETURN: None
 * NOTES: Customized form of TMR_StartTimer()
 *---------------------------------------------------------------------------*/
void TMR_StartIntervalTimer
(
    tmrTimerID_t timerID,
    tmrTimeInMilliseconds_t timeInMilliseconds,
    void (*pfTimerCallBack)(void *),
    void *param
)
{
    TMR_StartTimer(timerID, gTmrIntervalTimer_c, timeInMilliseconds, pfTimerCallBack, param);
}

/*---------------------------------------------------------------------------
 * NAME: TMR_StartSingleShotTimer
 * DESCRIPTION: Starts an single-shot timer
 * PARAMETERS:  IN: timerId - the ID of the timer
 *              IN: timeInMilliseconds - time expressed in milliseconds
 *              IN: pfTmrCallBack - callback function
 *              IN: param - parameter to callback function
 * RETURN: None
 * NOTES: Customized form of TMR_StartTimer()
 *---------------------------------------------------------------------------*/
void TMR_StartSingleShotTimer
(
    tmrTimerID_t timerID,
    tmrTimeInMilliseconds_t timeInMilliseconds,
    void (*pfTimerCallBack)(void *),
    void *param
)
{
    TMR_StartTimer(timerID, gTmrSingleShotTimer_c, timeInMilliseconds, pfTimerCallBack, param);
}

/*---------------------------------------------------------------------------
 * NAME: TMR_StopTimer
 * DESCRIPTION: Stop a timer
 * PARAMETERS:  IN: timerID - the ID of the timer
 * RETURN: None
 * NOTES: Associated timer callback function is not called, even if the timer
 *        expires. Does not frees the timer. Safe to call anytime, regardless
 *        of the state of the timer.
 *---------------------------------------------------------------------------*/
void TMR_StopTimer
(
    tmrTimerID_t timerID
)
{
    tmrStatus_t status;
    unsigned int saveInt;

    saveInt = TmrIntDisableAll();
    status = TMR_GetTimerStatus(timerID);

    if ( (status == mTmrStatusActive_c) || (status == mTmrStatusReady_c) )
    {
        TMR_SetTimerStatus(timerID, mTmrStatusInactive_c);
        DecrementActiveTimerNumber(TMR_GetTimerType(timerID));
        /* if no sw active timers are enabled, */
        /* call the TMR_Thread() to countdown the ticks and stop the hw timer*/
        if (!numberOfActiveTimers && !numberOfLowPowerActiveTimers)
            osSignalSet( mTimerThreadId, mTmrDummyEvent_c );
    }

    TmrIntRestoreAll(saveInt);
}

/*---------------------------------------------------------------------------
 * NAME: TMR_Thread
 * DESCRIPTION: Timer thread.
 *              Called by the kernel when the timer ISR posts a timer event.
 * PARAMETERS:  IN: events - timer events mask
 * RETURN: None
 * NOTES: none
 *---------------------------------------------------------------------------*/
void TMR_Thread
(
    void const *param
)
{
    tmrTimerTicks16_t nextInterruptTime;
    pfTmrCallBack_t pfCallBack;
    tmrTimerTicks16_t currentTimeInTicks;
    tmrTimerStatus_t status;
    tmrTimerTicks16_t ticksSinceLastHere, ticksdiff;
    uint8_t timerID;
    unsigned int saveInt;
    tmrTimerType_t timerType;

    (void)param;

    while(1)
    {
        osSignalWait( 0, osWaitForever );

        saveInt = TmrIntDisableAll();

        FTMReadCNTRegister(currentTimeInTicks);

        TmrIntRestoreAll(saveInt);

        /* calculate difference between current and previous.  */
        ticksSinceLastHere = (currentTimeInTicks - previousTimeInTicks);
        /* remember for next time */
        previousTimeInTicks = currentTimeInTicks;

        for (timerID = 0; timerID < NumberOfElements(maTmrTimerTable); ++timerID)
        {
            saveInt = TmrIntDisableAll();
            status = TMR_GetTimerStatus(timerID);
            /* If TMR_StartTimer() has been called for this timer, start it's count */
            /* down as of now. */
            if (status == mTmrStatusReady_c)
            {
                TMR_SetTimerStatus(timerID, mTmrStatusActive_c);
                TmrIntRestoreAll(saveInt);
                continue;
            }
            TmrIntRestoreAll(saveInt);

            /* Ignore any timer that is not active. */
            if (status != mTmrStatusActive_c)
            {
                continue;
            }

            /* This timer is active. Decrement it's countdown.. */
            if (maTmrTimerTable[timerID].remainingTicks > ticksSinceLastHere)
            {
                saveInt = TmrIntDisableAll();
                maTmrTimerTable[timerID].remainingTicks -= ticksSinceLastHere;
                FTMReadCNTRegister(maTmrTimerTable[timerID].timestamp);
                TmrIntRestoreAll(saveInt);
                continue;
            }

            timerType = TMR_GetTimerType(timerID);
            /* If this is an interval timer, restart it. Otherwise, mark it as inactive. */
            if ( (timerType & gTmrSingleShotTimer_c) ||
                 (timerType & gTmrSetMinuteTimer_c)  ||
                 (timerType & gTmrSetSecondTimer_c)  )
            {
                maTmrTimerTable[timerID].remainingTicks = 0;
                TMR_StopTimer(timerID);
            }
            else
            {
                saveInt = TmrIntDisableAll();
                maTmrTimerTable[timerID].remainingTicks = maTmrTimerTable[timerID].intervalInTicks;
                FTMReadCNTRegister(maTmrTimerTable[timerID].timestamp);
                TmrIntRestoreAll(saveInt);
            }
            /* This timer has expired. */
            pfCallBack = maTmrTimerTable[timerID].pfCallBack;
            /*Call callback if it is not NULL
            This is done after the timer got updated,
            in case the timer gets stopped or restarted in the callback*/
            if (pfCallBack)
            {
                pfCallBack(maTmrTimerTable[timerID].param);
            }
        }  /* for (timerID = 0; timerID < ... */

        /* Find the shortest active timer. */
        nextInterruptTime = mMaxToCountDown_c;

        for (timerID = 0; timerID < NumberOfElements(maTmrTimerTable); ++timerID)
        {
            if (TMR_GetTimerStatus(timerID) == mTmrStatusActive_c)
            {
                if (nextInterruptTime > maTmrTimerTable[timerID].remainingTicks)
                {
                    nextInterruptTime = maTmrTimerTable[timerID].remainingTicks;
                }
            }
        }

        saveInt = TmrIntDisableAll();

        /* Check to be sure that the timer was not programmed in the past for different source clocks.
         * The interrupts are now disabled.
         */
        FTMReadCNTRegister(ticksdiff);

        /* Number of ticks to be here */
        ticksdiff = (uint16_t)(ticksdiff - currentTimeInTicks);

        /* Next ticks to count already expired?? */
        if(ticksdiff >= nextInterruptTime)
        {
            /* Is assumed that a thread has to be executed in 1ms...
        so if the ticks already expired enter in TMR_Thread() after 1ms*/
            nextInterruptTime = ticksdiff + mTicksFor1ms;
        }
        else
        {
            /* Time reference is 1ms, so be sure that won't be loaded
               in Cmp Reg. less that 1ms in ticks */
            if((nextInterruptTime - ticksdiff) < mTicksFor1ms)
            {
                nextInterruptTime = ticksdiff + mTicksFor1ms;
            }
        }
        /* Update the compare register */
        nextInterruptTime += currentTimeInTicks;
        if(numberOfActiveTimers || numberOfLowPowerActiveTimers) /*not about to stop*/
        {
          /*Causes a bug with flex timers if CxV is set before hw timer switches off*/
          StackTimer_SetOffsetTicks(gTimerHandle, gTMR_FTM_CNx, nextInterruptTime);
        }
        TmrIntRestoreAll(saveInt);

        if (!numberOfActiveTimers && !numberOfLowPowerActiveTimers)
        {
            FTMStopTimerHardware();
            timerHardwareIsRunning = FALSE;
        }
        else if (!timerHardwareIsRunning)
        {
            FTMStartTimerHardware();
            timerHardwareIsRunning = TRUE;
        }
    }
}

/*---------------------------------------------------------------------------
 * NAME: TMR_EnableTimer
 * DESCRIPTION: Enable the specified timer
 * PARAMETERS:  IN: tmrID - the timer ID
 * RETURN: None
 * NOTES: none
 *---------------------------------------------------------------------------*/
void TMR_EnableTimer
(
    tmrTimerID_t tmrID
)
{
    unsigned int saveInt;
    saveInt = TmrIntDisableAll();

    if (TMR_GetTimerStatus(tmrID) == mTmrStatusInactive_c)
    {
        IncrementActiveTimerNumber(TMR_GetTimerType(tmrID));
        TMR_SetTimerStatus(tmrID, mTmrStatusReady_c);
        osSignalSet( mTimerThreadId, mTmrDummyEvent_c );
    }

    TmrIntRestoreAll(saveInt);
}

/*---------------------------------------------------------------------------
 * NAME: TMR_NotCountedMillisTimeBeforeSleep
 * DESCRIPTION: This function is called by Low Power module;
 * Also this function stops the hardware timer.
 * PARAMETERS:  none
 * RETURN: uint32 - time in millisecond that wasn't counted before
 *        entering in sleep
 * NOTES: none
 *---------------------------------------------------------------------------*/
uint16_t TMR_NotCountedTicksBeforeSleep
(
    void
)
{
#if (gTMR_EnableLowPowerTimers_d)
    uint16_t currentTimeInTicks;

    if (!numberOfLowPowerActiveTimers)
        return 0;

    FTMReadCNTRegister(currentTimeInTicks);
    FTMStopTimerHardware();
    timerHardwareIsRunning = FALSE;

    /* The hw timer is stopped but keep timerHardwareIsRunning = TRUE...*/
    /* The Lpm timers are considered as being in running mode, so that  */
    /* not to start the hw timer if a TMR event occurs (this shouldn't happen) */

    return  (uint16_t)(currentTimeInTicks - previousTimeInTicks);
#else
    return 0;
#endif
}

/*---------------------------------------------------------------------------
 * NAME: TMR_SyncLpmTimers
 * DESCRIPTION: This function is called by the Low Power module
 * each time the MCU wakes up.
 * PARAMETERS:  sleep duration in milliseconds
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void TMR_SyncLpmTimers
(
    uint32_t sleepDurationTmrTicks
)
{
#if (gTMR_EnableLowPowerTimers_d)
    uint32_t  timerID;
    tmrTimerType_t timerType;

    /* Check if there are low power active timer */
    if (!numberOfLowPowerActiveTimers)
        return;

    /* For each timer, detect the timer type and count down the spent duration in sleep */
    for (timerID = 0; timerID < NumberOfElements(maTmrTimerTable); ++timerID)
    {

        /* Detect the timer type and count down the spent duration in sleep */
        timerType = TMR_GetTimerType(timerID);

        /* Sync. only the low power timers that are active */
        if ( (TMR_GetTimerStatus(timerID) == mTmrStatusActive_c)
                && (IsLowPowerTimer(timerType)) )
        {
            /* Timer expired when MCU was in sleep mode??? */
            if( maTmrTimerTable[timerID].remainingTicks > sleepDurationTmrTicks)
            {
                maTmrTimerTable[timerID].remainingTicks -= sleepDurationTmrTicks;

            }
            else
            {
                maTmrTimerTable[timerID].remainingTicks = 0;
            }

        }

    }/* end for (timerID = 0;.... */

    FTMStartTimerHardware();
    FTMReadCNTRegister(previousTimeInTicks);

#else
    sleepDurationTmrTicks = sleepDurationTmrTicks;
#endif /* #if (gTMR_EnableLowPowerTimers_d) */
}
/*---------------------------------------------------------------------------
 * NAME: TMR_MakeTMRThreadReady
 * DESCRIPTION: This function is called by the Low Power module
 * each time the MCU wakes up after low power timers synchronisation.
 * PARAMETERS:
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void TMR_MakeTMRThreadReady
(
 void
)
{
#if (gTMR_EnableLowPowerTimers_d)

    osSignalSet( mTimerThreadId, mTmrDummyEvent_c );

#endif /* #if (gTMR_EnableLowPowerTimers_d) */
}

/*---------------------------------------------------------------------------
 * NAME: TMR_GetTimerFreq
 * DESCRIPTION:
 * PARAMETERS: -
 * RETURN: -
 *---------------------------------------------------------------------------*/
uint32_t TMR_GetTimerFreq
(
    void
)
{
  return mCounterFreqHz ;
}
#endif /*gTMR_Enabled_d*/

#if gPrecision_Timers_Enabled_d

/*---------------------------------------------------------------------------
 * NAME: TMR_PrecisionTimerInit
 * DESCRIPTION: initialize the precision timer module
 * PARAMETERS: -
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_PrecisionTimerInit()
{
  globalTimeTicks = 0;

  gPrecisionTimerHandle = PrecisionTimer_Init(NULL);

  PrecisionTimer_OnCounterRestart_fptr = TMR_PrecisionTimerOverflowNotify;

  if(PrecisionTimer_Enable(gPrecisionTimerHandle) != ERR_OK)
  {
    panic( 0, (uint32_t)TMR_Init, 0, 0 );
  }

  gPrecisionTimerTickus = 1000000U / PrecisionTimer_GetInputFrequency(gPrecisionTimerHandle);
  gPrecisionTimerTickusReal = 1000000.0F / PrecisionTimer_GetInputFrequencyReal(gPrecisionTimerHandle);
  PrecisionTimer_GetPeriodTicks(gPrecisionTimerHandle, (uint32_t*)&gPrecisionTimerPeriodTicks);

  (void)gPrecisionTimerTickus;
  (void)gPrecisionTimerTickusReal;
  (void)gPrecisionTimerPeriodTicks;
}

/*---------------------------------------------------------------------------
 * NAME: TMR_GetAbsoluteTimeus
 * DESCRIPTION: Gets the absolute time in microseconds.
 * PARAMETERS:  None
 * RETURN: Time in microseconds
 * NOTES:
 *---------------------------------------------------------------------------*/
uint64_t TMR_GetAbsoluteTimeus()
{
  uint64_t globalTime;
  uint64_t ticks;

  osInterruptDisable();
  ticks = gPrecisionTimerPeriodTicks - PrecisionTimer_GetCounterValue(gPrecisionTimerHandle) + globalTimeTicks;
  globalTime = (uint64_t)(ticks * gPrecisionTimerTickusReal);
  osInterruptEnable();

  return globalTime;
}

/*---------------------------------------------------------------------------
 * NAME: TMR_PrecisionTimerOverflowNotify
 * DESCRIPTION: Event function called by driver ISR on timer overflow in interrupt context.
 * PARAMETERS:  IN: User data; unused.
 * RETURN: none
 * NOTES: none
 *---------------------------------------------------------------------------*/
void TMR_PrecisionTimerOverflowNotify(LDD_TUserData *UserDataPtr)
{
  uint32_t period;

  (void)UserDataPtr;

  /* I assume here that int_kernel_isr calls the ISR with interrupts disabled*/
  PrecisionTimer_GetPeriodTicks(gPrecisionTimerHandle, &period);
  globalTimeTicks += period;
}

#endif /*gPrecision_Timers_Enabled_d*/

/*---------------------------------------------------------------------------
 * NAME: TMR_RTCIsOscStarted
 * DESCRIPTION: returns the state of the RTC oscillator
 * PARAMETERS: -
 * RETURN: -
 *---------------------------------------------------------------------------*/
bool_t TMR_RTCIsOscStarted()
{
  return TRUE;
}
#if gTimestamp_Enabled_d

/*---------------------------------------------------------------------------
 * NAME: TMR_RTCInit
 * DESCRIPTION: initialize the RTC part of the timer module
 * PARAMETERS: -
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_RTCInit()
{
  static uint8_t gRTCInitFlag = FALSE;

  if(gRTCInitFlag == TRUE)
  {
    return; /*already inited*/
  }

  osInterruptDisable();

  gRTCInitFlag = TRUE;

  gRTCHandle = RealTimeClock_Init(NULL, TRUE);
  RealTimeClock_Disable(gRTCHandle);

  RealTimeClock_OnAlarm_fptr = TMR_RTCAlarmNotify;

  gRTCTimeOffset = 0;
  gRTCPrescalerOffset = 0;
  gRTCAlarmCallback = NULL;
  gRTCAlarmCallbackParam = NULL;

  RTC_PDD_DisableAlarmInterrupt((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
  RTC_PDD_WriteTimeSecondsReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, 0x00 + 0x01);
  RTC_PDD_WriteTimePrescalerReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, 0x00);

  if(RealTimeClock_Enable(gRTCHandle) != ERR_OK)
  {
    panic( 0, (uint32_t)TMR_RTCInit, 0, 0 );
  }

  osInterruptEnable();
}

/*---------------------------------------------------------------------------
 * NAME: TMR_RTCGetTimestamp
 * DESCRIPTION: Returns the absolute time at the moment of the call.
 * PARAMETERS: -
 * RETURN: Absolute time at the moment of the call in microseconds.
 *---------------------------------------------------------------------------*/
uint64_t TMR_RTCGetTimestamp()
{
  uint32_t seconds1, seconds2, prescaler0, prescaler1, prescaler2;
  uint64_t useconds, offset, prescalerOffset;

  osInterruptDisable();
  offset = gRTCTimeOffset;
  prescalerOffset = gRTCPrescalerOffset;

  prescaler0 = RTC_PDD_ReadTimePrescalerReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
  seconds1 = RTC_PDD_ReadTimeSecondsReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
  prescaler1 = RTC_PDD_ReadTimePrescalerReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
  seconds2 = RTC_PDD_ReadTimeSecondsReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
  prescaler2 = RTC_PDD_ReadTimePrescalerReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);

  osInterruptEnable();

  prescaler0 &= 0x7fff;
  seconds1 -= 1;
  prescaler1 &= 0x7fff;
  seconds2 -= 1;
  prescaler2 &= 0x7fff;

  if(seconds1 != seconds2)
  {
    seconds1 = seconds2;
    prescaler1 = prescaler2;
  }
  else
  {
    if(prescaler1 != prescaler2)
    {
      prescaler1 = prescaler0;
    }
  }

  useconds = ((prescaler1 + prescalerOffset + ((uint64_t)seconds1<<15))*15625)>>9;

  return useconds + offset;
}

/*---------------------------------------------------------------------------
 * NAME: TMR_RTCSetTime
 * DESCRIPTION: Sets the absolute time.
 * PARAMETERS: Time in microseconds.
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_RTCSetTime(uint64_t microseconds)
{
  uint64_t initialAlarm;

  osInterruptDisable();
  RealTimeClock_Disable(gRTCHandle);

  initialAlarm = gRTCTimeOffset;
  initialAlarm = RTC_PDD_ReadTimeAlarmReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS) + (initialAlarm/1000000L);
  gRTCTimeOffset = microseconds;

  RTC_PDD_WriteTimeSecondsReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, 0x00 + 0x01);
  RTC_PDD_WriteTimePrescalerReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, 0x00);

  if( (initialAlarm * 1000000L) <= microseconds )
  {
    RTC_PDD_DisableAlarmInterrupt((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
    if( gRTCAlarmCallback != NULL )
    {
      gRTCAlarmCallback(gRTCAlarmCallbackParam);
    }
  }
  else
  {
    RTC_PDD_WriteTimeAlarmReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, initialAlarm - (microseconds/1000000L));
  }

  RealTimeClock_Enable(gRTCHandle);
  osInterruptEnable();
}

/*---------------------------------------------------------------------------
 * NAME: TMR_RTCSetAlarm
 * DESCRIPTION: Sets the alarm absolute time in seconds.
 * PARAMETERS: Time in seconds for the alarm. Callback function pointer. Parameter for callback.
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_RTCSetAlarm(uint64_t seconds, pfTmrCallBack_t callback, void *param)
{
  osInterruptDisable();

  gRTCAlarmCallback = callback;
  gRTCAlarmCallbackParam = param;
  seconds = seconds - (gRTCTimeOffset/1000000L);
  RTC_PDD_WriteTimeAlarmReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, (uint32_t)seconds);
  RTC_PDD_EnableAlarmInterrupt((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);

  osInterruptEnable();
}

/*---------------------------------------------------------------------------
 * NAME: TMR_RTCSetAlarmRelative
 * DESCRIPTION: Sets the alarm relative time in seconds.
 * PARAMETERS: Time in seconds for the alarm. Callback function pointer. Parameter for callback.
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_RTCSetAlarmRelative(uint32_t seconds, pfTmrCallBack_t callback, void *param)
{
  uint32_t rtcSeconds, rtcPrescaler;

  if(seconds == 0)
  {
    callback(param);
    return;
  }

  osInterruptDisable();

  RealTimeClock_Disable(gRTCHandle);
  rtcSeconds = RTC_PDD_ReadTimeSecondsReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
  rtcPrescaler = RTC_PDD_ReadTimePrescalerReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);
  RTC_PDD_WriteTimePrescalerReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, 0x00);
  /*If bit prescaler 14 transitions from 1 to 0 the seconds reg get incremented.
    Rewrite seconds register to prevent this.*/
  RTC_PDD_WriteTimeSecondsReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, rtcSeconds);
  RealTimeClock_Enable(gRTCHandle);
  rtcPrescaler &= 0x7fff;

  gRTCPrescalerOffset += rtcPrescaler;

  if(gRTCPrescalerOffset & 0x8000)
  {
    rtcSeconds++;
    RealTimeClock_Disable(gRTCHandle);
    RTC_PDD_WriteTimeSecondsReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, rtcSeconds);
    RealTimeClock_Enable(gRTCHandle);
    gRTCPrescalerOffset = gRTCPrescalerOffset & 0x7FFF;
  }

  gRTCAlarmCallback = callback;
  gRTCAlarmCallbackParam = param;
  RTC_PDD_WriteTimeAlarmReg((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS, seconds + rtcSeconds - 1);
  RTC_PDD_EnableAlarmInterrupt((RTC_MemMapPtr)RealTimeClock_PRPH_BASE_ADDRESS);

  osInterruptEnable();
}


#endif /*gTimestamp_Enabled_d*/
#if gTMR_PIT_Timestamp_Enabled_d
#ifdef MCU_MK21D5
/*---------------------------------------------------------------------------
 * NAME: TMR_PITInit
 * DESCRIPTION: initialize the PIT part of the timer module
 * PARAMETERS: -
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_PITInit()
{
  static uint8_t gPITInitFlag = FALSE;
  uint32_t pitFreq;
  if(gPITInitFlag == TRUE)
  {
    return; /*already inited*/
  }

  osInterruptDisable();

  gPITInitFlag = TRUE;

  gPITHandle = PitTimeStamp_Init(NULL);
  PitTimeStamp_Disable(gPITHandle);
  pitFreq = PitTimeStamp_GetInputFrequency(gPITHandle);
  PIT_PDD_WriteLoadReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_0, pitFreq/1000000 -1);
  PIT_TCTRL_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_0) = 0;
  PIT_TCTRL_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_1) = 0;
  PIT_PDD_WriteLoadReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_1, 0xFFFFFFFF);
  PIT_TCTRL_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_1) = PIT_TCTRL_CHN_MASK | PIT_TCTRL_TEN_MASK;
  PIT_TCTRL_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_2) = 0;
  PIT_PDD_WriteLoadReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_2, 0xFFFFFFFF);
  PIT_TCTRL_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_2) = PIT_TCTRL_CHN_MASK | PIT_TCTRL_TEN_MASK;
  PitTimeStamp_Enable(gPITHandle);

  osInterruptEnable();
}

/*---------------------------------------------------------------------------
 * NAME: TMR_PITGetTimestamp
 * DESCRIPTION: Returns the absolute time at the moment of the call.
 * PARAMETERS: -
 * RETURN: Absolute time at the moment of the call in microseconds.
 *---------------------------------------------------------------------------*/
uint64_t TMR_PITGetTimestamp()
{
  uint32_t pit2_0, pit2_1 , pit1_0, pit1_1;
  uint64_t useconds;
  osInterruptDisable();
  pit1_0 = PIT_PDD_ReadTimerValueReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_1);
  pit2_0 = PIT_PDD_ReadTimerValueReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_2);
  pit1_1 = PIT_PDD_ReadTimerValueReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_1);
  pit2_1 = PIT_PDD_ReadTimerValueReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_2);
  osInterruptEnable();
  if( pit1_1 <= pit1_0)
  {
    useconds = pit2_0;
  }
  else
  {
    useconds = pit2_1;
  }
  useconds <<= 32;
  useconds += pit1_1;
  useconds = ~useconds ;
#if gTMR_PIT_FreqMultipleOfMHZ_d == FALSE
  {
    uint32 pitFreq;
    uint32 pitLoadVal;
    pitFreq = PitTimeStamp_GetInputFrequency(gPITHandle);
    pitLoadVal = PIT_PDD_ReadLoadReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_0) + 1;
    pitLoadVal *= 1000000;
    if( pitFreq != pitLoadVal)
    {
      /*
      To adjust the value to useconds the following formula is used.
      useconds = (useconds*pitLoadVal)/pitFreq;
      Because this formula causes overflow the useconds/pitFreq is split in its Integer  and Fractional part.
      */
      uint64_t uSecAdjust1 , uSecAdjust2;
      uSecAdjust1  = useconds/pitFreq;
      uSecAdjust2  = useconds%pitFreq;
      uSecAdjust1 *= pitLoadVal;
      uSecAdjust2 *= pitLoadVal;
      uSecAdjust2 /= pitFreq;
      useconds = uSecAdjust1 + uSecAdjust2;
    }
  }
#endif//gTMR_PIT_FreqMultipleOfMHZ_d
  return useconds;
}
#endif
#if (defined(MCU_MKL26Z4) || defined(MCU_MKL46Z4))
/*---------------------------------------------------------------------------
 * NAME: TMR_PITInit
 * DESCRIPTION: initialize the PIT part of the timer module
 * PARAMETERS: -
 * RETURN: -
 *---------------------------------------------------------------------------*/
void TMR_PITInit()
{
  static uint8_t gPITInitFlag = FALSE;
  uint32_t pitFreq;
  if(gPITInitFlag == TRUE)
  {
    return; /*already inited*/
  }

  osInterruptDisable();

  gPITInitFlag = TRUE;
  mPIT_TimestampHigh = (uint32_t)-1;
  gPITHandle = PitTimeStamp_Init((LDD_TUserData *)TMR_PIT_ISR);
  PitTimeStamp_Disable(gPITHandle);
  pitFreq = PitTimeStamp_GetInputFrequency(gPITHandle);
  PIT_PDD_WriteLoadReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_0, pitFreq/1000000 -1);
  PIT_TCTRL_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_0) = 0;
  PIT_TCTRL_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_1) = 0;
  PIT_PDD_WriteLoadReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_1, 0xFFFFFFFF);
  PIT_TCTRL_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_1) = PIT_TCTRL_CHN_MASK | PIT_TCTRL_TIE_MASK | PIT_TCTRL_TEN_MASK;
  PIT_TFLG_REG(PIT_BASE_PTR,PIT_PDD_CHANNEL_1) = PIT_TFLG_TIF_MASK;
  PitTimeStamp_Enable(gPITHandle);

  osInterruptEnable();
}

/*---------------------------------------------------------------------------
 * NAME: TMR_PITGetTimestamp
 * DESCRIPTION: Returns the absolute time at the moment of the call.
 * PARAMETERS: -
 * RETURN: Absolute time at the moment of the call in microseconds.
 *---------------------------------------------------------------------------*/
uint64_t TMR_PITGetTimestamp()
{
  uint32_t  pit2, pit1_0, pit1_1, pitIF;
  uint64_t useconds;

  osInterruptDisable();

  pit2 = mPIT_TimestampHigh;
  pit1_0 = PIT_PDD_ReadTimerValueReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_1);
  pitIF = PIT_PDD_GetInterruptFlag(PIT_BASE_PTR, PIT_PDD_CHANNEL_1);
  pit1_1 = PIT_PDD_ReadTimerValueReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_1);

  osInterruptEnable();

  if(pitIF)
  {
    useconds = pit2-1;
  }
  else
  {
    useconds = pit2;
  }
  useconds <<= 32;
  if(pitIF)
  {
    useconds += pit1_1;
  }
  else
  {
    useconds += pit1_0;
  }
  useconds = ~useconds ;
#if gTMR_PIT_FreqMultipleOfMHZ_d == FALSE
  {
    uint32 pitFreq;
    uint32 pitLoadVal;
    pitFreq = PitTimeStamp_GetInputFrequency(gPITHandle);
    pitLoadVal = PIT_PDD_ReadLoadReg(PIT_BASE_PTR, PIT_PDD_CHANNEL_0) + 1;
    pitLoadVal *= 1000000;
    if( pitFreq != pitLoadVal)
    {
      /*
      To adjust the value to useconds the following formula is used.
      useconds = (useconds*pitLoadVal)/pitFreq;
      Because this formula causes overflow the useconds/pitFreq is split in its Integer  and Fractional part.
      */
      uint64_t uSecAdjust1 , uSecAdjust2;
      uSecAdjust1  = useconds/pitFreq;
      uSecAdjust2  = useconds%pitFreq;
      uSecAdjust1 *= pitLoadVal;
      uSecAdjust2 *= pitLoadVal;
      uSecAdjust2 /= pitFreq;
      useconds = uSecAdjust1 + uSecAdjust2;
    }
  }
#endif//gTMR_PIT_FreqMultipleOfMHZ_d
  return useconds;
}

#endif

#endif//gTMR_PIT_Timestamp_Enabled_d
/*****************************************************************************
 *                               <<< EOF >>>                                 *
 *****************************************************************************/
