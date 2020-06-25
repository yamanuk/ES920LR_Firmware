/* ###################################################################
**     THIS COMPONENT MODULE IS GENERATED BY THE TOOL. DO NOT MODIFY IT.
**     Filename    : UARTB.h
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Component   : Serial_LDD
**     Version     : Component 01.173, Driver 01.12, CPU db: 3.00.000
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2014-10-10, 12:09, # CodeGen: 152
**     Abstract    :
**         This component "Serial_LDD" implements an asynchronous serial
**         communication. The component supports different settings of
**         parity, word width, stop-bit and communication speed,
**         user can select interrupt or polling handler.
**         Communication speed can be changed also in runtime.
**         The component requires one on-chip asynchronous serial communication channel.
**     Settings    :
**          Component name                                 : UARTB
**          Device                                         : UART1
**          Interrupt service/event                        : Enabled
**            Interrupt RxD                                : INT_UART1
**            Interrupt RxD priority                       : medium priority
**            Interrupt TxD                                : INT_UART1
**            Interrupt TxD priority                       : medium priority
**            Interrupt Error                              : INT_UART1
**            Interrupt Error priority                     : medium priority
**          Settings                                       :
**            Data width                                   : 8 bits
**            Parity                                       : None
**            Stop bits                                    : 1
**            Loop mode                                    : Normal
**            Baud rate                                    : 1200 baud
**            Wakeup condition                             : Idle line wakeup
**            Stop in wait mode                            : no
**            Idle line mode                               : Starts after start bit
**            Transmitter output                           : Not inverted
**            Receiver input                               : Not inverted
**            Break generation length                      : 10/11 bits
**            Receiver                                     : Enabled
**              RxD                                        : PTE1/SPI1_MOSI/UART1_RX/SPI1_MISO/I2C1_SCL
**              RxD pin signal                             :
**            Transmitter                                  : Enabled
**              TxD                                        : PTE0/SPI1_MISO/UART1_TX/RTC_CLKOUT/CMP0_OUT/I2C1_SDA
**              TxD pin signal                             :
**            Flow control                                 : None
**          Initialization                                 :
**            Enabled in init. code                        : yes
**            Auto initialization                          : yes
**            Event mask                                   :
**              OnBlockSent                                : Enabled
**              OnBlockReceived                            : Enabled
**              OnTxComplete                               : Disabled
**              OnError                                    : Disabled
**              OnBreak                                    : Disabled
**          CPU clock/configuration selection              :
**            Clock configuration 0                        : This component disabled
**            Clock configuration 1                        : This component enabled
**            Clock configuration 2                        : This component disabled
**            Clock configuration 3                        : This component disabled
**            Clock configuration 4                        : This component disabled
**            Clock configuration 5                        : This component disabled
**            Clock configuration 6                        : This component disabled
**            Clock configuration 7                        : This component disabled
**     Contents    :
**         Init           - LDD_TDeviceData* UARTB_Init(LDD_TUserData *UserDataPtr);
**         SendBlock      - LDD_TError UARTB_SendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData...
**         ReceiveBlock   - LDD_TError UARTB_ReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData...
**         SelectBaudRate - LDD_TError UARTB_SelectBaudRate(LDD_TDeviceData *DeviceDataPtr,...
**         ConnectPin     - LDD_TError UARTB_ConnectPin(LDD_TDeviceData *DeviceDataPtr, LDD_TPinMask...
**
**     Copyright : 1997 - 2013 Freescale Semiconductor, Inc. All Rights Reserved.
**     SOURCE DISTRIBUTION PERMISSIBLE as directed in End User License Agreement.
**
**     http      : www.freescale.com
**     mail      : support@freescale.com
** ###################################################################*/
/*!
** @file UARTB.h
** @version 01.12
** @brief
**         This component "Serial_LDD" implements an asynchronous serial
**         communication. The component supports different settings of
**         parity, word width, stop-bit and communication speed,
**         user can select interrupt or polling handler.
**         Communication speed can be changed also in runtime.
**         The component requires one on-chip asynchronous serial communication channel.
*/
/*!
**  @addtogroup UARTB_module UARTB module documentation
**  @{
*/

#ifndef __UARTB_H
#define __UARTB_H

/* MODULE UARTB. */

#define UARTB_BM_1200BAUD         0u   /* Baud rate constant for switch to the baud rate mode 0 */
#define UARTB_BM_2400BAUD         1u   /* Baud rate constant for switch to the baud rate mode 1 */
#define UARTB_BM_4800BAUD         2u   /* Baud rate constant for switch to the baud rate mode 2 */
#define UARTB_BM_9600BAUD         3u   /* Baud rate constant for switch to the baud rate mode 3 */
#define UARTB_BM_19200BAUD        4u   /* Baud rate constant for switch to the baud rate mode 4 */
#define UARTB_BM_38400BAUD        5u   /* Baud rate constant for switch to the baud rate mode 5 */
#define UARTB_BM_57600BAUD        6u   /* Baud rate constant for switch to the baud rate mode 6 */
#define UARTB_BM_115200BAUD       7u   /* Baud rate constant for switch to the baud rate mode 7 */


#include "Cpu.h"

#ifdef __cplusplus
extern "C" {
#endif


/*! Peripheral base address of a device allocated by the component. This constant can be used directly in PDD macros. */
#define UARTB_PRPH_BASE_ADDRESS  0x4006B000U

/*! Device data structure pointer used when auto initialization property is enabled. This constant can be passed as a first parameter to all component's methods. */
#define UARTB_DeviceData  ((LDD_TDeviceData *)PE_LDD_GetDeviceStructure(PE_LDD_COMPONENT_UARTB_ID))

/* Methods configuration constants - generated for all enabled component's methods */
#define UARTB_Init_METHOD_ENABLED      /*!< Init method of the component UARTB is enabled (generated) */
#define UARTB_SendBlock_METHOD_ENABLED /*!< SendBlock method of the component UARTB is enabled (generated) */
#define UARTB_ReceiveBlock_METHOD_ENABLED /*!< ReceiveBlock method of the component UARTB is enabled (generated) */
#define UARTB_SelectBaudRate_METHOD_ENABLED /*!< SelectBaudRate method of the component UARTB is enabled (generated) */
#define UARTB_ConnectPin_METHOD_ENABLED /*!< ConnectPin method of the component UARTB is enabled (generated) */

/* Events configuration constants - generated for all enabled component's events */
#define UARTB_OnBlockReceived_EVENT_ENABLED /*!< OnBlockReceived event of the component UARTB is enabled (generated) */
#define UARTB_OnBlockSent_EVENT_ENABLED /*!< OnBlockSent event of the component UARTB is enabled (generated) */

#define ENABLED_TX_INT        0x01U    /*!< TX interrupt enabled      */
#define BREAK_DETECTED        0x02U    /*!< Break detected            */
#define TX_COMPLETED          0x04U    /*!< Transmission completed    */
#define ENABLE_TX_COMPLETE    0x10U    /*!< Enable/Disable of TX complete detection. Used in the polling mode only */

/*! Device data structure type */
typedef struct {
  uint16_t SerFlag;                    /*!< Flags for serial communication */
  LDD_SERIAL_TBaudMode BaudMode;       /*!< Baud rate mode */
  bool EnMode;                         /*!< Enable/Disable device in clock configuration */
  uint16_t BaudDivisorSpeed1;          /*!< Baudrate prescaler in speed 1 mode */
  uint16_t InpRecvDataNum;             /*!< The counter of received characters */
  uint8_t *InpDataPtr;                 /*!< The buffer pointer for received characters */
  uint16_t InpDataNumReq;              /*!< The counter of characters to receive by ReceiveBlock() */
  uint16_t OutSentDataNum;             /*!< The counter of sent characters */
  uint8_t *OutDataPtr;                 /*!< The buffer pointer for data to be transmitted */
  uint16_t OutDataNumReq;              /*!< The counter of characters to be send by SendBlock() */
  LDD_RTOS_TISRVectorSettings SavedISRSettings; /* {MQXLite RTOS Adapter} Saved settings of allocated interrupt vector */
  LDD_TUserData *UserDataPtr;          /*!< Pointer to user data */
} UARTB_TDeviceData;

typedef UARTB_TDeviceData *UARTB_TDeviceDataPtr ; /*!< Pointer to the device data structure. */

/*
** ===================================================================
**     Method      :  UARTB_Init (component Serial_LDD)
*/
/*!
**     @brief
**         Initializes the device. Allocates memory for the device data
**         structure, allocates interrupt vectors and sets interrupt
**         priority, sets pin routing, sets timing, etc. If the "Enable
**         in init. code" is set to "yes" value then the device is also
**         enabled(see the description of the Enable() method). In this
**         case the Enable() method is not necessary and needn't to be
**         generated.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer will be
**                           passed as an event or callback parameter.
**     @return
**                         - Device data structure pointer.
*/
/* ===================================================================*/
LDD_TDeviceData* UARTB_Init(LDD_TUserData *UserDataPtr);

/*
** ===================================================================
**     Method      :  UARTB_ReceiveBlock (component Serial_LDD)
*/
/*!
**     @brief
**         Specifies the number of data to receive. The method returns
**         ERR_BUSY until the specified number of characters is
**         received. Method <CancelBlockReception> can be used to
**         cancel a running receive operation.
**     @param
**         DeviceDataPtr   - Device data structure
**                           pointer returned by <Init> method.
**     @param
**         BufferPtr       - Pointer to a buffer where
**                           received characters will be stored.
**     @param
**         Size            - Number of characters to receive
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
**                           ERR_SPEED - The component does not work in
**                           the active clock configuration.
**                           ERR_PARAM_SIZE - Parameter Size is out of
**                           expected range.
**                           ERR_DISABLED - The component or device is
**                           disabled.
**                           ERR_BUSY - The previous receive request is
**                           pending.
*/
/* ===================================================================*/
LDD_TError UARTB_ReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size);

/*
** ===================================================================
**     Method      :  UARTB_SendBlock (component Serial_LDD)
*/
/*!
**     @brief
**         Sends a block of characters. The method returns ERR_BUSY
**         when the previous block transmission is not completed.
**         Method <CancelBlockTransmission> can be used to cancel a
**         transmit operation. This method is available only if the
**         transmitter property is enabled.
**     @param
**         DeviceDataPtr   - Device data structure
**                           pointer returned by <Init> method.
**     @param
**         BufferPtr       - Pointer to a buffer from where
**                           data will be sent.
**     @param
**         Size            - Number of characters in the buffer.
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
**                           ERR_SPEED - The component does not work in
**                           the active clock configuration.
**                           ERR_PARAM_SIZE - Parameter Size is out of
**                           expected range.
**                           ERR_DISABLED - The component or device is
**                           disabled.
**                           ERR_BUSY - The previous transmit request is
**                           pending.
*/
/* ===================================================================*/
LDD_TError UARTB_SendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size);

/*
** ===================================================================
**     Method      :  UARTB_SelectBaudRate (component Serial_LDD)
*/
/*!
**     @brief
**         This method changes the channel communication speed (baud
**         rate). This method is enabled only if the user specifies a
**         list of possible period settings at design time (see <Timing
**         dialog box> - Runtime setting - from a list of values). Each
**         of these settings constitutes a _/mode/_ and Processor
**         Expert assigns them a _/mode identifier/_. The prescaler and
**         compare values corresponding to each mode are calculated in
**         design time. The user may switch modes at runtime by
**         referring to a mode identifier. No run-time calculations are
**         performed, all the calculations are performed at design time.
**     @param
**         DeviceDataPtr   - Device data structure
**                           pointer returned by <Init> method.
**     @param
**         Mode            - Timing mode to set
**                           Note: Special constant is generated in the
**                           components header file for each mode from
**                           the list of values.
**                           This constant can be directly passed to the
**                           parameter. Format of the constant is:
**                           <BeanName>_BM_<Timing> e.g.
**                           "as1_BM_9600BAUD" for baud rate set to 9600
**                           baud and component name "as1". See header
**                           file of the generated code for details.
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
**                           ERR_SPEED - The component does not work in
**                           the active clock configuration.
**                           ERR_DISABLED - The component or device is
**                           disabled.
**                           ERR_PARAM_MODE - Invalid ID of the baud
**                           rate mode.
*/
/* ===================================================================*/
LDD_TError UARTB_SelectBaudRate(LDD_TDeviceData *DeviceDataPtr, LDD_SERIAL_TBaudMode Mode);

/*
** ===================================================================
**     Method      :  UARTB_ConnectPin (component Serial_LDD)
*/
/*!
**     @brief
**         This method reconnects the requested pin associated with the
**         selected peripheral in this component. This method is only
**         available for CPU derivatives and peripherals that support
**         the runtime pin sharing with other internal on-chip
**         peripherals.
**     @param
**         DeviceDataPtr   - Device data structure
**                           pointer returned by <Init> method.
**     @param
**         PinMask         - Mask(s) for the requested pins.
**                           The peripheral pins are reconnected
**                           according to this mask.
**                           Possible parameters:
**                           LDD_SERIAL_RX_PIN - Receiver pin mask
**                           LDD_SERIAL_TX_PIN - Transmitter pin mask
**                           LDD_SERIAL_CTS_PIN - CTS pin mask
**                           LDD_SERIAL_RTS_PIN - RTS pin mask
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
**                           ERR_SPEED - The component does not work in
**                           the active clock configuration.
**                           ERR_PARAM_MASK - Invalid pin mask parameter.
*/
/* ===================================================================*/
LDD_TError UARTB_ConnectPin(LDD_TDeviceData *DeviceDataPtr, LDD_TPinMask PinMask);

/*
** ===================================================================
**     Method      :  UARTB_Interrupt (component Serial_LDD)
**
**     Description :
**         The ISR function handling the device receive/transmit
**         interrupt. Calls InterruptTX/InterruptRX methods.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
/* {MQXLite RTOS Adapter} ISR function prototype */
void UARTB_Interrupt(LDD_RTOS_TISRParameter _isrParameter);

/*
** ===================================================================
**     Method      :  UARTB_SetClockConfiguration (component Serial_LDD)
**
**     Description :
**         This method changes the clock configuration. During a clock
**         configuration change the component changes it's setting
**         immediately upon a request.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
void UARTB_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration);

/* END UARTB. */

#ifdef __cplusplus
}  /* extern "C" */
#endif

#endif
/* ifndef __UARTB_H */
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
