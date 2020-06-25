/* ###################################################################
**     Filename    : Events.c
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Component   : Events
**     Version     : Driver 01.00
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2013-05-22, 16:17, # CodeGen: 0
**     Abstract    :
**         This is user's event module.
**         Put your event handler code here.
**     Settings    :
**     Contents    :
**         UART_OnBlockReceived        - void UART_OnBlockReceived(LDD_TUserData *UserDataPtr);
**         UART_OnBlockSent            - void UART_OnBlockSent(LDD_TUserData *UserDataPtr);
**         StackTimer_OnCounterRestart - void StackTimer_OnCounterRestart(LDD_TUserData *UserDataPtr);
**         StackTimer_OnChannel0       - void StackTimer_OnChannel0(LDD_TUserData *UserDataPtr);
**         Cpu_OnReset                 - void Cpu_OnReset(uint16_t Reason);
**         Cpu_OnNMIINT0               - void Cpu_OnNMIINT0(void);
**
** ###################################################################*/
/*!
** @file Events.c
** @version 01.00
** @date 2013-05-22, 16:17, # CodeGen: 0
** @brief
**         This is user's event module.
**         Put your event handler code here.
*/
/*!
**  @addtogroup Events_module Events module documentation
**  @{
*/
/* MODULE Events */

#include "Cpu.h"
#include "Events.h"
#include "mqx_tasks.h"

#ifdef __cplusplus
extern "C" {
#endif

/* User includes (#include below this line is not maintained by Processor Expert) */
void (*StackTimer_OnChannel0_Notify_fptr)(LDD_TUserData*) = NULL;
void (*SerialManager_RxNotify_fptr)(LDD_TUserData*) = NULL;
void (*SerialManager_TxNotify_fptr)(LDD_TUserData*) = NULL;
void (*SerialManager_IICErrorNotify_fptr)(LDD_TUserData*) = NULL;
void (*DataAvailableCallback_fptr)(LDD_TUserData*) = NULL;
void (*PrecisionTimer_OnCounterRestart_fptr)(LDD_TUserData*) = NULL;
void (*RealTimeClock_OnAlarm_fptr)(LDD_TUserData*) = NULL;
extern void SX1276InitIo( void );

/*
** ===================================================================
**     Event       :  UARTA_OnBlockReceived (module Events)
**
**     Component   :  UARTA [Serial_LDD]
*/
/*!
**     @brief
**         This event is called when the requested number of data is
**         moved to the input buffer.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void UARTA_OnBlockReceived(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_RxNotify_fptr != NULL)
    {
        SerialManager_RxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  UARTA_OnBlockSent (module Events)
**
**     Component   :  UARTA [Serial_LDD]
*/
/*!
**     @brief
**         This event is called after the last character from the
**         output buffer is moved to the transmitter.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void UARTA_OnBlockSent(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_TxNotify_fptr != NULL)
    {
        SerialManager_TxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  StackTimer_OnCounterRestart (module Events)
**
**     Component   :  StackTimer [TimerUnit_LDD]
*/
/*!
**     @brief
**         Called if counter overflow/underflow or counter is
**         reinitialized by modulo or compare register matching.
**         OnCounterRestart event and Timer unit must be enabled. See
**         <SetEventMask> and <GetEventMask> methods. This event is
**         available only if a <Interrupt> is enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. The pointer passed as
**                           the parameter of Init method.
*/
/* ===================================================================*/
void StackTimer_OnCounterRestart(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
}

/*
** ===================================================================
**     Event       :  StackTimer_OnChannel0 (module Events)
**
**     Component   :  StackTimer [TimerUnit_LDD]
*/
/*!
**     @brief
**         Called if compare register match the counter registers or
**         capture register has a new content. OnChannel0 event and
**         Timer unit must be enabled. See <SetEventMask> and
**         <GetEventMask> methods. This event is available only if a
**         <Interrupt> is enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. The pointer passed as
**                           the parameter of Init method.
*/
/* ===================================================================*/
void StackTimer_OnChannel0(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(StackTimer_OnChannel0_Notify_fptr != NULL)
    {
        StackTimer_OnChannel0_Notify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  Cpu_OnReset (module Events)
**
**     Component   :  Cpu [MK22DN512MC5]
**     Description :
**         This software event is called after a reset.
**     Parameters  :
**         NAME            - DESCRIPTION
**         Reason          - Content of the reset status register.
**                           You can use predefined constants RSTSRC_*
**                           defined in generated PE_Const.h file to
**                           determine a reason of the last reset. See
**                           definition of these constants in this file
**                           for details.
**     Returns     : Nothing
** ===================================================================
*/
void Cpu_OnReset(uint16_t Reason)
{
    /* Write your code here ... */
    SX1276InitIo( );

    Cpu_SetClockConfiguration(CPU_CLOCK_CONFIG_0);

#ifdef __mqxlite_h__
    SystemTimer1_Enable(PE_LDD_DeviceDataList[PE_LDD_COMPONENT_SystemTimer1_ID]); /*PEx bug workaround ENGR00262511 */
#endif
}

/*
** ===================================================================
**     Event       :  UARTB_OnBlockReceived (module Events)
**
**     Component   :  UARTB [Serial_LDD]
*/
/*!
**     @brief
**         This event is called when the requested number of data is
**         moved to the input buffer.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void UARTB_OnBlockReceived(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_RxNotify_fptr != NULL)
    {
        SerialManager_RxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  UARTB_OnBlockSent (module Events)
**
**     Component   :  UARTB [Serial_LDD]
*/
/*!
**     @brief
**         This event is called after the last character from the
**         output buffer is moved to the transmitter.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void UARTB_OnBlockSent(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_TxNotify_fptr != NULL)
    {
        SerialManager_TxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  I2CDriver_OnMasterBlockSent (module Events)
**
**     Component   :  I2CDriver [I2CDriver_LDD]
*/
/*!
**     @brief
**         This event is called when I2CDriver in master mode finishes the
**         transmission of the data successfully. This event is not
**         available for the SLAVE mode and if MasterSendBlock is
**         disabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnMasterBlockSent(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_TxNotify_fptr != NULL)
    {
        SerialManager_TxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  I2CDriver_OnMasterBlockReceived (module Events)
**
**     Component   :  I2CDriver [I2CDriver_LDD]
*/
/*!
**     @brief
**         This event is called when I2CDriver is in master mode and finishes
**         the reception of the data successfully. This event is not
**         available for the SLAVE mode and if MasterReceiveBlock is
**         disabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnMasterBlockReceived(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_RxNotify_fptr != NULL)
    {
        SerialManager_RxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  I2CDriver_OnSlaveBlockSent (module Events)
**
**     Component   :  I2CDriver [I2CDriver_LDD]
*/
/*!
**     @brief
**         This event is called when I2CDriver in slave mode finishes the
**         transmission of the data successfully. This event is not
**         available for the MASTER mode and if SlaveSendBlock is
**         disabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnSlaveBlockSent(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_TxNotify_fptr != NULL)
    {
        SerialManager_TxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  I2CDriver_OnSlaveBlockReceived (module Events)
**
**     Component   :  I2CDriver [I2CDriver_LDD]
*/
/*!
**     @brief
**         This event is called when I2CDriver in slave mode finishes the
**         reception of the data successfully. This event is not
**         available for the MASTER mode and if SlaveReceiveBlock is
**         disabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnSlaveBlockReceived(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_RxNotify_fptr != NULL)
    {
        SerialManager_RxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  I2CDriver_OnError (module Events)
**
**     Component   :  I2CDriver [I2CDriver_LDD]
*/
/*!
**     @brief
**         This event is called when an error (e.g. Arbitration lost)
**         occurs. The errors can be read with GetError method.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnError(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_IICErrorNotify_fptr != NULL)
    {
        SerialManager_IICErrorNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  DataAvailablePin_OnPortEvent (module Events)
**
**     Component   :  DataAvailablePin [GPIO_LDD]
*/
/*!
**     @brief
**         Called if defined event on any pin of the port occured.
**         OnPortEvent event and GPIO interrupt must be enabled. See
**         SetPortEventMask() and GetPortEventMask() methods. This
**         event is enabled if <Interrupt service/event> is Enabled and
**         disabled if <Interrupt service/event> is Disabled.
**     @param
**         UserDataPtr     - Pointer to RTOS device
**                           data structure pointer.
*/
/* ===================================================================*/
void DataAvailablePin_OnPortEvent(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(DataAvailableCallback_fptr != NULL)
    {
        DataAvailableCallback_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  SPISlave_OnBlockSent (module Events)
**
**     Component   :  SPISlave [SPISlave_LDD]
*/
/*!
**     @brief
**         This event is called after the last character from the
**         output buffer is moved to the transmitter. This event is
**         available only if the SendBlock method is enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. The pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void SPISlave_OnBlockSent(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_TxNotify_fptr != NULL)
    {
        SerialManager_TxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  SPISlave_OnBlockReceived (module Events)
**
**     Component   :  SPISlave [SPISlave_LDD]
*/
/*!
**     @brief
**         This event is called when the requested number of data is
**         moved to the input buffer. This method is available only if
**         the ReceiveBlock method is enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. The pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void SPISlave_OnBlockReceived(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(SerialManager_RxNotify_fptr != NULL)
    {
        SerialManager_RxNotify_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  RealTimeClock_OnAlarm (module Events)
**
**     Component   :  RealTimeClock [RTC_LDD]
*/
/*!
**     @brief
**         Called if alarm date and time match the actual date and time,
**         OnAlarm event is enabled (see <SetEventMask> and
**         <GetEventMask> methods) and RTC device is enabled. This
**         event is available only if <Interrupt service/event> is
**         enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void RealTimeClock_OnAlarm(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(RealTimeClock_OnAlarm_fptr != NULL)
    {
        RealTimeClock_OnAlarm_fptr(UserDataPtr);
    }
}

/*
** ===================================================================
**     Event       :  PitTimeStamp_OnCounterRestart (module Events)
**
**     Component   :  PitTimeStamp [TimerUnit_LDD]
*/
/*!
**     @brief
**         Called if counter overflow/underflow or counter is
**         reinitialized by modulo or compare register matching.
**         OnCounterRestart event and Timer unit must be enabled. See
**         [SetEventMask] and [GetEventMask] methods. This event is
**         available only if a [Interrupt] is enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. The pointer passed as
**                           the parameter of Init method.
*/
/* ===================================================================*/
void PitTimeStamp_OnCounterRestart(LDD_TUserData *UserDataPtr)
{
    /* Write your code here ... */
    if(UserDataPtr != NULL)
    {
        ((void(*)(void))UserDataPtr)();
    }
}

/* END Events */

#ifdef __cplusplus
}  /* extern "C" */
#endif

/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.2 [05.06]
**     for the Freescale Kinetis series of microcontrollers.
**
** ###################################################################
*/
