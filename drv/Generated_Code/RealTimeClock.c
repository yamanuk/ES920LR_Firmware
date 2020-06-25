/* ###################################################################
**     THIS COMPONENT MODULE IS GENERATED BY THE TOOL. DO NOT MODIFY IT.
**     Filename    : RealTimeClock.c
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Component   : RTC_LDD
**     Version     : Component 01.163, Driver 01.06, CPU db: 3.00.000
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2014-10-10, 12:09, # CodeGen: 152
**     Abstract    :
**         This component implements a real time clock (RTC). Actual date may also be
**         obtained and an alarm function is included.
**     Settings    :
**          Component name                                 : RealTimeClock
**          Device                                         : RTC
**          Input clock frequency [s]                      : 1 sec
**          Clock source                                   : ERCLK32K
**            Clock frequency [kHz]                        : 32.768 kHz 32.768 kHz
**          Interrupt service/event                        : Enabled
**            Interrupt                                    : INT_RTC
**            Interrupt priority                           : medium priority
**            Interrupt                                    : INT_RTC_Seconds
**            Interrupt priority                           : medium priority
**          Min year                                       : 2000
**          Max year                                       : 2099
**          Initialization                                 :
**            Auto Initialization                          : no
**            Event mask                                   :
**              OnAlarm                                    : Enabled
**              OnSecond                                   : Disabled
**              OnTimeOverflow                             : Disabled
**              OnTimeInvalid                              : Disabled
**            Time and date settings                       :
**              Time                                       : 12:00:01 am
**              Date                                       : 2000-01-01
**            Alarm settings                               : Enabled
**              Alarm time                                 : 12:00:00 am
**              Alarm date                                 : 2000-01-01
**            Compensation settings                        :
**              Compensation period [s]                    : 0
**              Compensation value [clock cycles]          : 0
**     Contents    :
**         Init    - LDD_TDeviceData * RealTimeClock_Init(LDD_TUserData *UserDataPtr, bool SoftInit);
**         Enable  - LDD_TError RealTimeClock_Enable(LDD_TDeviceData *DeviceDataPtr);
**         Disable - LDD_TError RealTimeClock_Disable(LDD_TDeviceData *DeviceDataPtr);
**         GetTime - void RealTimeClock_GetTime(LDD_TDeviceData *DeviceDataPtr, LDD_RTC_TTime...
**         SetTime - LDD_TError RealTimeClock_SetTime(LDD_TDeviceData *DeviceDataPtr,...
**
**     Copyright : 1997 - 2013 Freescale Semiconductor, Inc. All Rights Reserved.
**     SOURCE DISTRIBUTION PERMISSIBLE as directed in End User License Agreement.
**
**     http      : www.freescale.com
**     mail      : support@freescale.com
** ###################################################################*/
/*!
** @file RealTimeClock.c
** @version 01.06
** @brief
**         This component implements a real time clock (RTC). Actual date may also be
**         obtained and an alarm function is included.
*/
/*!
**  @addtogroup RealTimeClock_module RealTimeClock module documentation
**  @{
*/

/* MODULE RealTimeClock. */

#include "Events.h"
#include "RealTimeClock.h"
/* MQX Lite include files */
#include "mqxlite.h"
#include "mqxlite_prv.h"
#include "RTC_PDD.h"

#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
  bool                       EnUser;             /* User state variable */
  LDD_TUserData           *UserDataPtr;          /* Device mode user device data structure */
  LDD_RTOS_TISRVectorSettings SavedISRSettings_RTC_ISR; /* {MQXLite RTOS Adapter} Saved settings of allocated interrupt vector */
} RealTimeClock_TDeviceData, *RealTimeClock_TDeviceDataPtr; /* Device data structure type */

/* {MQXLite RTOS Adapter} Static object used for simulation of dynamic driver memory allocation */
static RealTimeClock_TDeviceData DevDataPtr__DEFAULT_RTOS_ALLOC;
/* Table of month length (in days) */
static const uint8_t ULY[] = {0U,31U,28U,31U,30U,31U,30U,31U,31U,30U,31U,30U,31U}; /* Non-leap-year */
static const uint8_t  LY[] = {0U,31U,29U,31U,30U,31U,30U,31U,31U,30U,31U,30U,31U}; /* Leap-year */
/* Number of days from begin of the year */
static const uint16_t MONTH_DAYS[] = {0U,0U,31U,59U,90U,120U,151U,181U,212U,243U,273U,304U,334U}; /* Leap-year */

/*
** ===================================================================
**     Method      :  RealTimeClock_Init (component RTC_LDD)
*/
/*!
**     @brief
**         Initializes the device. There are two modes of
**         initialization.
**         1) RTC device is NOT battery backed up. (SoftInit = FALSE)
**         All registers (interrupts, counters, clock routing �) that
**         influence RTC behavior are initialized.
**         Note: This initialization mode doesn't preserve time and
**         date settings.
**         2) RTC device IS battery backed up.
**         (SoftInit = TRUE). Only registers that are not backed up are
**         initialized (Interrupt priority �). RTC device is running,
**         time and date a preserved, RTC interrupts (events) are
**         preserved too.
**         Allocates memory for the device data structure.
**         This method can be called only once. Before the second call
**         of Init() the Deinit() must be called first.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer will be
**                           passed as an event or callback parameter.
**     @param
**         SoftInit        - If set to "[true]" only
**                           registers that are not battery backup are
**                           initialized (E.g. Interrupt priority in
**                           interrupt controller � )
**                           If set to "[false]" all registers are
**                           initialized.
**     @return
**                         - Pointer to the dynamically allocated private
**                           structure or NULL if there was an error.
*/
/* ===================================================================*/
LDD_TDeviceData * RealTimeClock_Init(LDD_TUserData *UserDataPtr, bool SoftInit)
{
  RealTimeClock_TDeviceData *DevDataPtr;

  /* Allocate RTC device structure */
  /* {MQXLite RTOS Adapter} Driver memory allocation: Dynamic allocation is simulated by a pointer to the static object */
  DevDataPtr = &DevDataPtr__DEFAULT_RTOS_ALLOC;
  DevDataPtr->UserDataPtr = UserDataPtr; /* Store the user data */
  /* Allocate interrupt vector(s) */
  /* {MQXLite RTOS Adapter} Save old and set new interrupt vector (function handler and ISR parameter) */
  /* Note: Exception handler for interrupt is not saved, because it is not modified */
  DevDataPtr->SavedISRSettings_RTC_ISR.isrData = _int_get_isr_data(LDD_ivIndex_INT_RTC);
  DevDataPtr->SavedISRSettings_RTC_ISR.isrFunction = _int_install_isr(LDD_ivIndex_INT_RTC, RealTimeClock_Interrupt, DevDataPtr);
  /* Registration of the device structure */
  PE_LDD_RegisterDeviceStructure(PE_LDD_COMPONENT_RealTimeClock_ID,DevDataPtr);
  DevDataPtr->EnUser = TRUE;           /* Initialize user state variable */
  /* Enable module clock */
  /* SIM_SCGC6: RTC=1 */
  SIM_SCGC6 |= SIM_SCGC6_RTC_MASK;
  if (!SoftInit) {
    RTC_SR = 0x00U;                    /* Disable counter */
    RTC_TPR = RTC_TPR_TPR(0x00);       /* Set prescaler register */
    RTC_TSR = RTC_TSR_TSR(0x02);       /* Set second register - 2000-01-01 0:0:1 */
    RTC_TAR = RTC_TAR_TAR(0x00);       /* Set alarm register - 2000-01-01 0:0:0 */
    RTC_TCR = RTC_TCR_CIC(0x00) |
              RTC_TCR_TCV(0x00) |
              RTC_TCR_CIR(0x00) |
              RTC_TCR_TCR(0x00);       /* Set compensation */
    RTC_SR = RTC_SR_TCE_MASK;          /* Enable counter */
  }
  /* Enable interrupt */
  /* RTC_IER: TAIE=1,TOIE=0,TIIE=0 */
  RTC_IER = RTC_IER_TAIE_MASK;         /* Enable interrupts */
  /* NVIC_IPR5: PRI_20=0x80 */
  NVIC_IPR5 = (uint32_t)((NVIC_IPR5 & (uint32_t)~(uint32_t)(
               NVIC_IP_PRI_20(0x7F)
              )) | (uint32_t)(
               NVIC_IP_PRI_20(0x80)
              ));
  /* NVIC_ISER: SETENA|=0x00100000 */
  NVIC_ISER |= NVIC_ISER_SETENA(0x00100000);
  return DevDataPtr;
}

/*
** ===================================================================
**     Method      :  RealTimeClock_Enable (component RTC_LDD)
*/
/*!
**     @brief
**         Enables the real-time clock module (Typically sets the
**         module enable bit). All other HW settings are preserved. RTC
**         module can be disabled by the [Disable] method and
**         reinitialized by the [Init] method.
**     @param
**         DeviceDataPtr   - Pointer to device data
**                           structure pointer returned by [Init] method.
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
*/
/* ===================================================================*/
LDD_TError RealTimeClock_Enable(LDD_TDeviceData *DeviceDataPtr)
{
  RealTimeClock_TDeviceDataPtr DevDataPtr = (RealTimeClock_TDeviceDataPtr)DeviceDataPtr;

  DevDataPtr->EnUser = TRUE;
  RTC_PDD_EnableCounter(RTC_BASE_PTR, PDD_ENABLE);
  return ERR_OK;
}

/*
** ===================================================================
**     Method      :  RealTimeClock_Disable (component RTC_LDD)
*/
/*!
**     @brief
**         Disables the real-time clock module. All other HW settings
**         are preserved. RTC module can be enabled by [Enable] method.
**     @param
**         DeviceDataPtr   - Pointer to device data
**                           structure pointer returned by [Init] method.
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
*/
/* ===================================================================*/
LDD_TError RealTimeClock_Disable(LDD_TDeviceData *DeviceDataPtr)
{
  RealTimeClock_TDeviceDataPtr DevDataPtr = (RealTimeClock_TDeviceDataPtr)DeviceDataPtr;

  DevDataPtr->EnUser = FALSE;
  RTC_PDD_EnableCounter(RTC_BASE_PTR, PDD_DISABLE);
  return ERR_OK;
}

/*
** ===================================================================
**     Method      :  RealTimeClock_GetTime (component RTC_LDD)
*/
/*!
**     @brief
**         Returns actual time and date.
**         Note: Fields not supported by HW are calculated in software.
**     @param
**         DeviceDataPtr   - Pointer to device data
**                           structure pointer returned by [Init] method.
**     @param
**         TimePtr         - Pointer to the time structure to
**                           fill with current time.
*/
/* ===================================================================*/
void RealTimeClock_GetTime(LDD_TDeviceData *DeviceDataPtr, LDD_RTC_TTime *TimePtr)
{
  uint32_t x;
  uint32_t Seconds, Days;

  (void)DeviceDataPtr;                 /* Parameter is not used, suppress unused argument warning */
  Seconds = RTC_PDD_ReadTimeSecondsReg(RTC_BASE_PTR); /* Seconds since 2000-01-01 */
  Seconds--;
  Days = Seconds / 86400U;             /* Days */
  Seconds = Seconds % 86400U;          /* Seconds left */
  TimePtr->Hour = Seconds / 3600U;     /* Hours */
  Seconds = Seconds % 3600u;           /* Seconds left */
  TimePtr->Minute = Seconds / 60U;     /* Minutes */
  TimePtr->Second = Seconds % 60U;     /* Seconds */
  TimePtr->DayOfWeek = (Days + 6U) % 7U; /* Day of week */
  TimePtr->Year = (4U * (Days / ((4U * 365U) + 1U))) + 2000U; /* Year */
  Days = Days % ((4U * 365U) + 1U);
  if (Days == ((0U * 365U) + 59U)) { /* 59 */
    TimePtr->Day = 29U;
    TimePtr->Month = 2U;
    return;
  } else if (Days > ((0U * 365U) + 59U)) {
    Days--;
  } else {
  }
  x =  Days / 365U;
  TimePtr->Year += x;
  Days -= x * 365U;
  for (x=1U; x <= 12U; x++) {
    if (Days < ULY[x]) {
      TimePtr->Month = x;
      break;
    } else {
      Days -= ULY[x];
    }
  }
  TimePtr->Day = Days + 1U;
}

/*
** ===================================================================
**     Method      :  RealTimeClock_SetTime (component RTC_LDD)
*/
/*!
**     @brief
**         Sets new time and date.
**         Note: All LDD_RTC_TTime structure members must be correctly
**         filled in.
**     @param
**         DeviceDataPtr   - Pointer to device data
**                           structure pointer returned by [Init] method.
**     @param
**         TimePtr         - Pointer to the time structure with
**                           new time to set.
**     @return
**                         - Error code, possible codes:
**                           - ERR_OK - OK.
**                           - ERR_DISABLED - Component is disabled.
**                           - ERR_SPEED - Component does not work in
**                           the active clock configuration.
**                           - ERR_RANGE - Parameter out of range.
*/
/* ===================================================================*/
LDD_TError RealTimeClock_SetTime(LDD_TDeviceData *DeviceDataPtr, LDD_RTC_TTime *TimePtr)
{
  uint32_t Seconds;
  RealTimeClock_TDeviceDataPtr DevDataPtr = (RealTimeClock_TDeviceDataPtr)DeviceDataPtr;

  /* Device state test - this test can be disabled by setting the "Ignore enable test"
     property to the "yes" value in the "Configuration inspector" */
  if (!DevDataPtr->EnUser) {           /* Is the device disabled by user? */
    return ERR_DISABLED;               /* If yes then error */
  }
  if ((TimePtr->Year < 2000U) || (TimePtr->Year > 2099U) || (TimePtr->Month > 12U) || (TimePtr->Month == 0U) || (TimePtr->Day > 31U) || (TimePtr->Day == 0U)) { /* Test correctness of given parameters */
    return ERR_RANGE;                  /* If not correct then error */
  }
  if (TimePtr->Year & 3U) {            /* Is given year non-leap-one? */
    if (ULY[TimePtr->Month] < TimePtr->Day) { /* Does the obtained number of days exceed number of days in the appropriate month & year? */
      return ERR_RANGE;                /* If yes (incorrect date inserted) then error */
    }
  } else {                             /* Is given year leap-one? */
    if (LY[TimePtr->Month] < TimePtr->Day) { /* Does the obtained number of days exceed number of days in the appropriate month & year? */
      return ERR_RANGE;                /* If yes (incorrect date inserted) then error */
    }
  }
  Seconds = ((TimePtr->Year - 2000U) * 365U) + (((TimePtr->Year - 2000U) + 3U) / 4U); /* Compute number of days from 2000 till given year */
  Seconds += MONTH_DAYS[TimePtr->Month]; /* Add number of days till given month */
  Seconds += TimePtr->Day;             /* Add days in given month */
  if ((TimePtr->Year & 3U) || (TimePtr->Month <= 2U)) { /* For non-leap year or month <= 2, decrement day counter */
    Seconds--;
  }
  Seconds = (Seconds * 86400U) + (TimePtr->Hour * 3600U) + (TimePtr->Minute * 60U) + TimePtr->Second;
  Seconds++;
  RTC_PDD_EnableCounter(RTC_BASE_PTR, PDD_DISABLE); /* Disable counter */
  RTC_PDD_WriteTimePrescalerReg(RTC_BASE_PTR, 0x00U); /* Clear prescaler */
  RTC_PDD_WriteTimeSecondsReg(RTC_BASE_PTR, Seconds); /* Set seconds counter */
  RTC_PDD_EnableCounter(RTC_BASE_PTR, PDD_ENABLE); /* Enable counter */
  return ERR_OK;
}

/*
** ===================================================================
**     Method      :  RealTimeClock_Interrupt (component RTC_LDD)
**
**     Description :
**         RTC interrupt handler
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
void RealTimeClock_Interrupt(LDD_RTOS_TISRParameter _isrParameter)
{
  /* {MQXLite RTOS Adapter} ISR parameter is passed as parameter from RTOS interrupt dispatcher */
  RealTimeClock_TDeviceDataPtr DevDataPtr = (RealTimeClock_TDeviceDataPtr)_isrParameter;
  uint32_t Status = RTC_PDD_ReadStatusReg(RTC_BASE_PTR);

  if ((Status & RTC_PDD_TIF_INT) != 0x00U) { /* Timer invalid (Vbat POR or RTC SW reset)? */
    /* Restart RTC module */
    RTC_PDD_EnableCounter(RTC_BASE_PTR, PDD_DISABLE); /* Disable counter */
    RTC_PDD_WriteTimePrescalerReg(RTC_BASE_PTR, 0x00U); /* Reset prescaler */
    RTC_PDD_WriteTimeSecondsReg(RTC_BASE_PTR, 0x02UL); /* Set init. time - 2000-01-01 0:0:1 (clears flag)*/
  } else if ((Status & RTC_PDD_TOF_INT) != 0x00u) { /* Timer overflow ? */
    /* Restart RTC module */
    RTC_PDD_EnableCounter(RTC_BASE_PTR, PDD_DISABLE); /* Disable counter */
    RTC_PDD_WriteTimePrescalerReg(RTC_BASE_PTR, 0x00U); /* Reset prescaler */
    RTC_PDD_WriteTimeSecondsReg(RTC_BASE_PTR, 0x02UL); /* Set init. time - 2000-01-01 0:0:1 (clears flag)*/
  } else {                             /* Alarm interrupt */
    RTC_PDD_WriteTimeAlarmReg(RTC_BASE_PTR, RTC_PDD_ReadTimeAlarmReg(RTC_BASE_PTR)); /* Clear alarm interrupt flag */
    RealTimeClock_OnAlarm(DevDataPtr->UserDataPtr);
  }
}

/*
** ===================================================================
**     Method      :  RealTimeClock_SetClockConfiguration (component RTC_LDD)
**
**     Description :
**         This method changes the clock configuration. During a clock
**         configuration change the component changes it's setting
**         immediately upon a request.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
void RealTimeClock_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration)
{
  (void)DeviceDataPtr;                 /* Parameter is not used, suppress unused argument warning */
  (void)ClockConfiguration;            /* Parameter is not used, suppress unused argument warning */
}

/* END RealTimeClock. */

#ifdef __cplusplus
}  /* extern "C" */
#endif

/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.3 [05.09]
**     for the Freescale Kinetis series of microcontrollers.
**
** ###################################################################
*/