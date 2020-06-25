/* ###################################################################
**     Filename    : Events.h
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Component   : Events
**     Version     : Driver 01.00
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2013-08-19, 12:34, # CodeGen: 3
**     Abstract    :
**         This is user's event module.
**         Put your event handler code here.
**     Settings    :
**     Contents    :
**         DataAvailablePin_OnPortEvent    - void DataAvailablePin_OnPortEvent(LDD_TUserData *UserDataPtr);
**         I2CDriver_OnMasterBlockSent     - void I2CDriver_OnMasterBlockSent(LDD_TUserData *UserDataPtr);
**         I2CDriver_OnMasterBlockReceived - void I2CDriver_OnMasterBlockReceived(LDD_TUserData *UserDataPtr);
**         I2CDriver_OnSlaveBlockSent      - void I2CDriver_OnSlaveBlockSent(LDD_TUserData *UserDataPtr);
**         I2CDriver_OnSlaveBlockReceived  - void I2CDriver_OnSlaveBlockReceived(LDD_TUserData *UserDataPtr);
**         I2CDriver_OnError               - void I2CDriver_OnError(LDD_TUserData *UserDataPtr);
**         SPISlave_OnBlockSent            - void SPISlave_OnBlockSent(LDD_TUserData *UserDataPtr);
**         SPISlave_OnBlockReceived        - void SPISlave_OnBlockReceived(LDD_TUserData *UserDataPtr);
**         UARTB_OnBlockReceived           - void UARTB_OnBlockReceived(LDD_TUserData *UserDataPtr);
**         UARTB_OnBlockSent               - void UARTB_OnBlockSent(LDD_TUserData *UserDataPtr);
**         UARTA_OnBlockReceived           - void UARTA_OnBlockReceived(LDD_TUserData *UserDataPtr);
**         UARTA_OnBlockSent               - void UARTA_OnBlockSent(LDD_TUserData *UserDataPtr);
**         StackTimer_OnCounterRestart     - void StackTimer_OnCounterRestart(LDD_TUserData *UserDataPtr);
**         StackTimer_OnChannel0           - void StackTimer_OnChannel0(LDD_TUserData *UserDataPtr);
**         Cpu_OnReset                     - void Cpu_OnReset(uint16_t Reason);
**
** ###################################################################*/
/*!
** @file Events.h
** @version 01.00
** @brief
**         This is user's event module.
**         Put your event handler code here.
*/
/*!
**  @addtogroup Events_module Events module documentation
**  @{
*/

#ifndef __Events_H
#define __Events_H
/* MODULE Events */

#include "PE_Types.h"
#include "PE_Error.h"
#include "PE_Const.h"
#include "IO_Map.h"
#include "MQXLite1.h"
#include "SystemTimer1.h"
#include "StackTimer.h"
#include "UARTA.h"
#include "UARTB.h"
#include "SPISlave.h"
#include "I2CDriver.h"
#include "DataAvailablePin.h"
#include "PitTimeStamp.h"
#include "LED1.h"
#include "LED2.h"
#include "RealTimeClock.h"

#ifdef __cplusplus
extern "C" {
#endif

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
**         SetEventMask() and GetEventMask() methods. This event is
**         enabled if [Interrupt service/event] is Enabled and disabled
**         if [Interrupt service/event] is Disabled.
**     @param
**         UserDataPtr     - Pointer to RTOS device
**                           data structure pointer.
*/
/* ===================================================================*/
void DataAvailablePin_OnPortEvent(LDD_TUserData *UserDataPtr);

/*
** ===================================================================
**     Event       :  I2CDriver_OnMasterBlockSent (module Events)
**
**     Component   :  I2CDriver [I2C_LDD]
*/
/*!
**     @brief
**         This event is called when I2C in master mode finishes the
**         transmission of the data successfully. This event is not
**         available for the SLAVE mode and if MasterSendBlock is
**         disabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnMasterBlockSent(LDD_TUserData *UserDataPtr);

/*
** ===================================================================
**     Event       :  I2CDriver_OnMasterBlockReceived (module Events)
**
**     Component   :  I2CDriver [I2C_LDD]
*/
/*!
**     @brief
**         This event is called when I2C is in master mode and finishes
**         the reception of the data successfully. This event is not
**         available for the SLAVE mode and if MasterReceiveBlock is
**         disabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnMasterBlockReceived(LDD_TUserData *UserDataPtr);

/*
** ===================================================================
**     Event       :  I2CDriver_OnSlaveBlockSent (module Events)
**
**     Component   :  I2CDriver [I2C_LDD]
*/
/*!
**     @brief
**         This event is called when I2C in slave mode finishes the
**         transmission of the data successfully. This event is not
**         available for the MASTER mode and if SlaveSendBlock is
**         disabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnSlaveBlockSent(LDD_TUserData *UserDataPtr);

/*
** ===================================================================
**     Event       :  I2CDriver_OnSlaveBlockReceived (module Events)
**
**     Component   :  I2CDriver [I2C_LDD]
*/
/*!
**     @brief
**         This event is called when I2C in slave mode finishes the
**         reception of the data successfully. This event is not
**         available for the MASTER mode and if SlaveReceiveBlock is
**         disabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void I2CDriver_OnSlaveBlockReceived(LDD_TUserData *UserDataPtr);

/*
** ===================================================================
**     Event       :  I2CDriver_OnError (module Events)
**
**     Component   :  I2CDriver [I2C_LDD]
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
void I2CDriver_OnError(LDD_TUserData *UserDataPtr);

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
void SPISlave_OnBlockSent(LDD_TUserData *UserDataPtr);

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
void SPISlave_OnBlockReceived(LDD_TUserData *UserDataPtr);

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
void UARTB_OnBlockReceived(LDD_TUserData *UserDataPtr);

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
void UARTB_OnBlockSent(LDD_TUserData *UserDataPtr);

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
void UARTA_OnBlockReceived(LDD_TUserData *UserDataPtr);

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
void UARTA_OnBlockSent(LDD_TUserData *UserDataPtr);

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
**         [SetEventMask] and [GetEventMask] methods. This event is
**         available only if a [Interrupt] is enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. The pointer passed as
**                           the parameter of Init method.
*/
/* ===================================================================*/
void StackTimer_OnCounterRestart(LDD_TUserData *UserDataPtr);

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
**         Timer unit must be enabled. See [SetEventMask] and
**         [GetEventMask] methods. This event is available only if a
**         [Interrupt] is enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. The pointer passed as
**                           the parameter of Init method.
*/
/* ===================================================================*/
void StackTimer_OnChannel0(LDD_TUserData *UserDataPtr);

/*
** ===================================================================
**     Event       :  Cpu_OnReset (module Events)
**
**     Component   :  Cpu [MK21DN512LK5]
*/
/*!
**     @brief
**         This software event is called after a reset.
**     @param
**         Reason          - Content of the reset status register.
**                           You can use predefined constants RSTSRC_*
**                           defined in generated PE_Const.h file to
**                           determine a reason of the last reset. See
**                           definition of these constants in this file
**                           for details.
*/
/* ===================================================================*/
void Cpu_OnReset(uint16_t Reason);

/*
** ===================================================================
**     Event       :  RealTimeClock_OnAlarm (module Events)
**
**     Component   :  RealTimeClock [RTC_LDD]
*/
/*!
**     @brief
**         Called if alarm date and time match the actual date and time,
**         OnAlarm event is enabled (see [SetEventMask] and
**         [GetEventMask] methods) and RTC device is enabled. This
**         event is available only if [Interrupt service/event] is
**         enabled.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer is passed
**                           as the parameter of Init method.
*/
/* ===================================================================*/
void RealTimeClock_OnAlarm(LDD_TUserData *UserDataPtr);

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
void PitTimeStamp_OnCounterRestart(LDD_TUserData *UserDataPtr);

/* END Events */

#ifdef __cplusplus
}  /* extern "C" */
#endif

#endif
/* ifndef __Events_H*/
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
