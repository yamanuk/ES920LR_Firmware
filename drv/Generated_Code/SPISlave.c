/* ###################################################################
**     THIS COMPONENT MODULE IS GENERATED BY THE TOOL. DO NOT MODIFY IT.
**     Filename    : SPISlave.c
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Component   : SPISlave_LDD
**     Version     : Component 01.047, Driver 01.02, CPU db: 3.00.000
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2014-10-10, 12:09, # CodeGen: 152
**     Abstract    :
**         This component "SPISlave_LDD" implements SLAVE part of synchronous
**         serial master-slave communication.
**     Settings    :
**          Component name                                 : SPISlave
**          Device                                         : SPI0
**          Interrupt service/event                        : Enabled
**            Input interrupt                              : INT_SPI0
**            Input interrupt priority                     : medium priority
**            Output interrupt                             : INT_SPI0
**            Output interrupt priority                    : medium priority
**          Settings                                       :
**            Input pin                                    : Enabled
**              Pin                                        : CMP0_IN0/PTC6/LLWU_P10/SPI0_MOSI/EXTRG_IN/I2S0_RX_BCLK/SPI0_MISO/I2S0_MCLK
**              Pin signal                                 :
**            Output pin                                   : Enabled
**              Pin                                        : CMP0_IN1/PTC7/SPI0_MISO/audioUSB_SOF_OUT/I2S0_RX_FS/SPI0_MOSI
**              Pin signal                                 :
**            Clock pin                                    :
**              Pin                                        : PTC5/LLWU_P9/SPI0_SCK/LPTMR0_ALT2/I2S0_RXD0/CMP0_OUT
**              Pin signal                                 :
**            Slave select                                 :
**              Pin                                        : PTC4/LLWU_P8/SPI0_PCS0/UART1_TX/TPM0_CH3/I2S0_MCLK
**              Pin signal                                 :
**              Active level                               : Low
**            Attribute set                                :
**              Width                                      : 8 bits
**              MSB first                                  : yes
**              Clock polarity                             : High
**              Clock phase                                : Capture on leading edge
**              Parity                                     : None
**            HW input buffer size                         : 1
**            HW input watermark                           : 1
**            Receiver DMA                                 : Disabled
**            HW output buffer size                        : 1
**            HW output watermark                          : 1
**            Transmitter DMA                              : Disabled
**          Initialization                                 :
**            Enabled in init. code                        : yes
**            Auto initialization                          : no
**            Event mask                                   :
**              OnBlockSent                                : Enabled
**              OnBlockReceived                            : Enabled
**              OnError                                    : Disabled
**     Contents    :
**         Init                    - LDD_TDeviceData* SPISlave_Init(LDD_TUserData *UserDataPtr);
**         SendBlock               - LDD_TError SPISlave_SendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData...
**         ReceiveBlock            - LDD_TError SPISlave_ReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData...
**         CancelBlockTransmission - LDD_TError SPISlave_CancelBlockTransmission(LDD_TDeviceData *DeviceDataPtr);
**         ConnectPin              - LDD_TError SPISlave_ConnectPin(LDD_TDeviceData *DeviceDataPtr, LDD_TPinMask...
**
**     Copyright : 1997 - 2013 Freescale Semiconductor, Inc. All Rights Reserved.
**     SOURCE DISTRIBUTION PERMISSIBLE as directed in End User License Agreement.
**
**     http      : www.freescale.com
**     mail      : support@freescale.com
** ###################################################################*/
/*!
** @file SPISlave.c
** @version 01.02
** @brief
**         This component "SPISlave_LDD" implements SLAVE part of synchronous
**         serial master-slave communication.
*/
/*!
**  @addtogroup SPISlave_module SPISlave module documentation
**  @{
*/

/* MODULE SPISlave. */
/*lint -save  -e926 -e927 -e928 -e929 Disable MISRA rule (11.4) checking. */

#include "Events.h"
#include "SPISlave.h"
/* MQX Lite include files */
#include "mqxlite.h"
#include "mqxlite_prv.h"

#ifdef __cplusplus
extern "C" {
#endif

#define AVAILABLE_EVENTS_MASK (LDD_SPISLAVE_ON_BLOCK_RECEIVED | LDD_SPISLAVE_ON_BLOCK_SENT)

/* These constants contain pins masks */
#define SPISlave_AVAILABLE_PIN_MASK (LDD_SPISLAVE_INPUT_PIN | LDD_SPISLAVE_OUTPUT_PIN | LDD_SPISLAVE_CLK_PIN | LDD_SPISLAVE_SS_PIN)

typedef struct {
  LDD_SPISLAVE_TError ErrFlag;         /* Error flags */
  uint16_t InpRecvDataNum;             /* The counter of received characters */
  uint8_t *InpDataPtr;                 /* The buffer pointer for received characters */
  uint16_t InpDataNumReq;              /* The counter of characters to receive by ReceiveBlock() */
  uint16_t OutSentDataNum;             /* The counter of sent characters */
  uint8_t *OutDataPtr;                 /* The buffer pointer for data to be transmitted */
  uint16_t OutDataNumReq;              /* The counter of characters to be send by SendBlock() */
  LDD_RTOS_TISRVectorSettings SavedISRSettings_Interrupt; /* {MQXLite RTOS Adapter} Saved settings of allocated interrupt vector */
  LDD_TUserData *UserData;             /* User device data structure */
} SPISlave_TDeviceData;                /* Device data structure type */

typedef SPISlave_TDeviceData* SPISlave_TDeviceDataPtr; /* Pointer to the device data structure */

/* {MQXLite RTOS Adapter} Static object used for simulation of dynamic driver memory allocation */
static SPISlave_TDeviceData DeviceDataPrv__DEFAULT_RTOS_ALLOC;
/* Internal method prototypes */

/*
** ===================================================================
**     Method      :  SPISlave_Init (component SPISlave_LDD)
*/
/*!
**     @brief
**         Initializes the device. Allocates memory for the device data
**         structure, allocates interrupt vectors and sets interrupt
**         priority, sets pin routing, sets timing, etc.
**         If the "Enable in init. code" is set to "yes" value then the
**         device is also enabled(see the description of the Enable()
**         method). In this case the Enable() method is not necessary
**         and needn't to be generated.
**         This method can be called only once. Before the second call
**         of Init() the Deinit() must be called first.
**     @param
**         UserDataPtr     - Pointer to the user or
**                           RTOS specific data. This pointer will be
**                           passed as an event or callback parameter.
**     @return
**                         - Device data structure pointer.
*/
/* ===================================================================*/
LDD_TDeviceData* SPISlave_Init(LDD_TUserData *UserDataPtr)
{
  /* Allocate LDD device structure */
  SPISlave_TDeviceDataPtr DeviceDataPrv;

  /* {MQXLite RTOS Adapter} Driver memory allocation: Dynamic allocation is simulated by a pointer to the static object */
  DeviceDataPrv = &DeviceDataPrv__DEFAULT_RTOS_ALLOC;
  DeviceDataPrv->UserData = UserDataPtr; /* Store the RTOS device structure */
  /* Interrupt vector(s) allocation */
  /* {MQXLite RTOS Adapter} Save old and set new interrupt vector (function handler and ISR parameter) */
  /* Note: Exception handler for interrupt is not saved, because it is not modified */
  DeviceDataPrv->SavedISRSettings_Interrupt.isrData = _int_get_isr_data(LDD_ivIndex_INT_SPI0);
  DeviceDataPrv->SavedISRSettings_Interrupt.isrFunction = _int_install_isr(LDD_ivIndex_INT_SPI0, SPISlave_Interrupt, DeviceDataPrv);
  DeviceDataPrv->ErrFlag = 0x00U;      /* Clear error flags */
  /* Clear the receive counters and pointer */
  DeviceDataPrv->InpRecvDataNum = 0x00U; /* Clear the counter of received characters */
  DeviceDataPrv->InpDataNumReq = 0x00U; /* Clear the counter of characters to receive by ReceiveBlock() */
  DeviceDataPrv->InpDataPtr = NULL;    /* Clear the buffer pointer for received characters */
  /* Clear the transmit counters and pointer */
  DeviceDataPrv->OutSentDataNum = 0x00U; /* Clear the counter of sent characters */
  DeviceDataPrv->OutDataNumReq = 0x00U; /* Clear the counter of characters to be send by SendBlock() */
  DeviceDataPrv->OutDataPtr = NULL;    /* Clear the buffer pointer for data to be transmitted */
  /* SIM_SCGC4: SPI0=1 */
  SIM_SCGC4 |= SIM_SCGC4_SPI0_MASK;
  /* SPI0_C1: SPIE=0,SPE=0,SPTIE=0,MSTR=0,CPOL=0,CPHA=1,SSOE=0,LSBFE=0 */
  SPI0_C1 = SPI_C1_CPHA_MASK;          /* Clear control register */
  /* Interrupt vector(s) priority setting */
  /* NVIC_IPR2: PRI_10=0x80 */
  NVIC_IPR2 = (uint32_t)((NVIC_IPR2 & (uint32_t)~(uint32_t)(
               NVIC_IP_PRI_10(0x7F)
              )) | (uint32_t)(
               NVIC_IP_PRI_10(0x80)
              ));
  /* NVIC_ISER: SETENA|=0x0400 */
  NVIC_ISER |= NVIC_ISER_SETENA(0x0400);
  /* PORTC_PCR6: ISF=0,MUX=2 */
  PORTC_PCR6 = (uint32_t)((PORTC_PCR6 & (uint32_t)~(uint32_t)(
                PORT_PCR_ISF_MASK |
                PORT_PCR_MUX(0x05)
               )) | (uint32_t)(
                PORT_PCR_MUX(0x02)
               ));
  /* PORTC_PCR7: ISF=0,MUX=2 */
  PORTC_PCR7 = (uint32_t)((PORTC_PCR7 & (uint32_t)~(uint32_t)(
                PORT_PCR_ISF_MASK |
                PORT_PCR_MUX(0x05)
               )) | (uint32_t)(
                PORT_PCR_MUX(0x02)
               ));
  /* PORTC_PCR5: ISF=0,MUX=2 */
  PORTC_PCR5 = (uint32_t)((PORTC_PCR5 & (uint32_t)~(uint32_t)(
                PORT_PCR_ISF_MASK |
                PORT_PCR_MUX(0x05)
               )) | (uint32_t)(
                PORT_PCR_MUX(0x02)
               ));
  /* PORTC_PCR4: ISF=0,MUX=2 */
  PORTC_PCR4 = (uint32_t)((PORTC_PCR4 & (uint32_t)~(uint32_t)(
                PORT_PCR_ISF_MASK |
                PORT_PCR_MUX(0x05)
               )) | (uint32_t)(
                PORT_PCR_MUX(0x02)
               ));
  /* SPI0_C1: SPIE=0,SPE=0,SPTIE=0,MSTR=0,CPOL=1,CPHA=0,SSOE=0,LSBFE=0 */
  SPI0_C1 = SPI_C1_CPOL_MASK;          /* Set Configuration register */
  /* SPI0_C2: SPMIE=0,SPIMODE=0,TXDMAE=0,MODFEN=0,BIDIROE=0,RXDMAE=0,SPISWAI=0,SPC0=0 */
  SPI0_C2 = 0x00U;                     /* Set Configuration register */
  /* SPI0_BR: ??=0,SPPR=0,SPR=0 */
  SPI0_BR = (SPI_BR_SPPR(0x00) | SPI_BR_SPR(0x00)); /* Set baud rate register */
  /* SPI0_C1: SPE=1 */
  SPI0_C1 |= SPI_C1_SPE_MASK;          /* Enable device */
  /* Registration of the device structure */
  PE_LDD_RegisterDeviceStructure(PE_LDD_COMPONENT_SPISlave_ID,DeviceDataPrv);
  return ((LDD_TDeviceData *)DeviceDataPrv); /* Return pointer to the data data structure */
}

/*
** ===================================================================
**     Method      :  SPISlave_ReceiveBlock (component SPISlave_LDD)
*/
/*!
**     @brief
**         This method specifies the number of data to receive. The
**         method returns ERR_BUSY until the specified number of
**         characters is received. The method <CancelBlockReception>
**         can be used to cancel a running receive operation.
**     @param
**         DeviceDataPtr   - Device data structure
**                           pointer returned by <Init> method.
**     @param
**         BufferPtr       - Pointer to A buffer where
**                           received characters will be stored.
**     @param
**         Size            - Size of the block
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
**                           ERR_DISABLED - Component is disabled
**                           ERR_BUSY - The previous receive request is
**                           pending
*/
/* ===================================================================*/
LDD_TError SPISlave_ReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size)
{
  if (((SPISlave_TDeviceDataPtr)DeviceDataPtr)->InpDataNumReq != 0x00U) { /* Is the previous receive operation pending? */
    return ERR_BUSY;                   /* If yes then error */
  }
  /* {MQXLite RTOS Adapter} Critical section begin (RTOS function call is defined by MQXLite RTOS Adapter property) */
  _int_disable();
  ((SPISlave_TDeviceDataPtr)DeviceDataPtr)->InpDataPtr = (uint8_t*)BufferPtr; /* Store a pointer to the input data. */
  ((SPISlave_TDeviceDataPtr)DeviceDataPtr)->InpDataNumReq = Size; /* Store a number of characters to be received. */
  ((SPISlave_TDeviceDataPtr)DeviceDataPtr)->InpRecvDataNum = 0x00U; /* Set number of received characters to zero. */
  if ((SPI_PDD_ReadStatusReg(SPI0_BASE_PTR) & SPI_PDD_RX_BUFFER_FULL) != 0U) {
    (void)SPI_PDD_ReadData8bit(SPI0_BASE_PTR); /* Dummy read of the data register */
  }
  SPI_PDD_EnableInterruptMask(SPI0_BASE_PTR, SPI_PDD_RX_BUFFER_FULL_OR_FAULT); /* Enable Rx buffer full interrupt */
  /* {MQXLite RTOS Adapter} Critical section ends (RTOS function call is defined by MQXLite RTOS Adapter property) */
  _int_enable();
  return ERR_OK;                       /* OK */
}

/*
** ===================================================================
**     Method      :  SPISlave_SendBlock (component SPISlave_LDD)
*/
/*!
**     @brief
**         This method sends a block of characters. The method returns
**         ERR_BUSY when the previous block transmission is not
**         completed. The method <CancelBlockTransmission> can be used
**         to cancel a transmit operation.
**     @param
**         DeviceDataPtr   - Device data structure
**                           pointer returned by <Init> method.
**     @param
**         BufferPtr       - Pointer to the block of data
**                           to send.
**     @param
**         Size            - Number of characters in the buffer.
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
**                           ERR_DISABLED - Component is disabled
**                           ERR_BUSY - The previous transmit request is
**                           pending
*/
/* ===================================================================*/
LDD_TError SPISlave_SendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size)
{
  if (((SPISlave_TDeviceDataPtr)DeviceDataPtr)->OutDataNumReq != 0x00U) { /* Is the previous transmit operation pending? */
    return ERR_BUSY;                   /* If yes then error */
  }
  /* {MQXLite RTOS Adapter} Critical section begin (RTOS function call is defined by MQXLite RTOS Adapter property) */
  _int_disable();
  ((SPISlave_TDeviceDataPtr)DeviceDataPtr)->OutDataPtr = (uint8_t*)BufferPtr; /* Set a pointer to the output data. */
  ((SPISlave_TDeviceDataPtr)DeviceDataPtr)->OutDataNumReq = Size; /* Set the counter of characters to be sent. */
  ((SPISlave_TDeviceDataPtr)DeviceDataPtr)->OutSentDataNum = 0x00U; /* Clear the counter of sent characters. */
  SPI_PDD_EnableInterruptMask(SPI0_BASE_PTR, SPI_PDD_TX_BUFFER_EMPTY); /* Enable Tx buffer empty interrupt */
  /* {MQXLite RTOS Adapter} Critical section ends (RTOS function call is defined by MQXLite RTOS Adapter property) */
  _int_enable();
  return ERR_OK;                       /* OK */
}

/*
** ===================================================================
**     Method      :  SPISlave_CancelBlockTransmission (component SPISlave_LDD)
*/
/*!
**     @brief
**         Immediately cancels running transmit process. Unsent data
**         will never been sent. This method is available only if the
**         SendBlock method is enabled.
**     @param
**         DeviceDataPtr   - Device data structure
**                           pointer returned by <Init> method.
**     @return
**                         - Error code, possible codes:
**                           ERR_OK - OK
**                           ERR_DISABLED - Component is disabled
*/
/* ===================================================================*/
LDD_TError SPISlave_CancelBlockTransmission(LDD_TDeviceData *DeviceDataPtr)
{
  SPISlave_TDeviceDataPtr DeviceDataPrv = (SPISlave_TDeviceDataPtr)DeviceDataPtr;

  /* {MQXLite RTOS Adapter} Critical section begin (RTOS function call is defined by MQXLite RTOS Adapter property) */
  _int_disable();
  DeviceDataPrv->OutDataNumReq = 0x00U; /* Clear the counter of requested outgoing characters. */
  /* {MQXLite RTOS Adapter} Critical section ends (RTOS function call is defined by MQXLite RTOS Adapter property) */
  _int_enable();
  return ERR_OK;                       /* OK */
}

/*
** ===================================================================
**     Method      :  SPISlave_ConnectPin (component SPISlave_LDD)
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
**         PinMask         - Mask for the requested pins. The
**                           peripheral pins are reconnected according
**                           to this mask.
**                           Possible parameters:
**                           LDD_SPISLAVE_INPUT_PIN - Input pin
**                           LDD_SPISLAVE_OUTPUT_PIN - Output pin
**                           LDD_SPISLAVE_CLK_PIN - Clock pin
**                           LDD_SPISLAVE_SS_PIN - Chip select pin
**     @return
**                         - Error code, possible values:
**                           ERR_OK - OK
**                           ERR_PARAM_MASK - Invalid pin mask
*/
/* ===================================================================*/
LDD_TError SPISlave_ConnectPin(LDD_TDeviceData *DeviceDataPtr, LDD_TPinMask PinMask)
{
  (void)DeviceDataPtr;                 /* Parameter is not used, suppress unused argument warning */
  /* Pin mask test - this test can be disabled by setting the "Ignore range checking"
     property to the "yes" value in the "Configuration inspector" */
  if ((PinMask & ((LDD_TPinMask)~((LDD_TPinMask)SPISlave_AVAILABLE_PIN_MASK))) != 0U) {
    return ERR_PARAM_MASK;
  }
  if (PinMask & LDD_SPISLAVE_INPUT_PIN) {
    clrSetReg32Bits(PORTC_PCR6, 0x01000500U, 0x0200U); /* MUX=0x02U */
  }
  if (PinMask & LDD_SPISLAVE_OUTPUT_PIN) {
    clrSetReg32Bits(PORTC_PCR7, 0x01000500U, 0x0200U); /* MUX=0x02U */
  }
  if (PinMask & LDD_SPISLAVE_CLK_PIN) {
    clrSetReg32Bits(PORTC_PCR5, 0x01000500U, 0x0200U); /* MUX=0x02U */
  }
  if (PinMask & LDD_SPISLAVE_SS_PIN) {
    clrSetReg32Bits(PORTC_PCR4, 0x01000500U, 0x0200U); /* MUX=0x02U */
  }
  return ERR_OK;
}

/*
** ===================================================================
**     Method      :  SPISlave_Interrupt (component SPISlave_LDD)
**
**     Description :
**         The ISR function handling the device receive/transmit
**         interrupt.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
void SPISlave_Interrupt(LDD_RTOS_TISRParameter _isrParameter)
{
  /* {MQXLite RTOS Adapter} ISR parameter is passed as parameter from RTOS interrupt dispatcher */
  SPISlave_TDeviceDataPtr DeviceDataPrv = (SPISlave_TDeviceDataPtr)_isrParameter;
  uint8_t StatReg = SPI_PDD_ReadStatusReg(SPI0_BASE_PTR); /* Read status register */

  (void)DeviceDataPrv;                 /* Supress unused variable warning if needed */
  if ((StatReg & SPI_PDD_RX_BUFFER_FULL) != 0U) { /* Is any char in HW Rx buffer? */
    if (DeviceDataPrv->InpDataNumReq != 0x00U) { /* Is the receive block operation pending? */
      *(DeviceDataPrv->InpDataPtr++) = SPI_PDD_ReadData8bit(SPI0_BASE_PTR); /* Put a character to the receive buffer and increment pointer to receive buffer */
      DeviceDataPrv->InpRecvDataNum++; /* Increment received char. counter */
      if (DeviceDataPrv->InpRecvDataNum == DeviceDataPrv->InpDataNumReq) { /* Is the requested number of characters received? */
        SPI_PDD_DisableInterruptMask(SPI0_BASE_PTR, SPI_PDD_RX_BUFFER_FULL_OR_FAULT); /* Disable Rx buffer full interrupt */
        DeviceDataPrv->InpDataNumReq = 0x00U; /* If yes then clear number of requested characters to be received. */
        SPISlave_OnBlockReceived(DeviceDataPrv->UserData);
      }
    }
  }
  if ((StatReg & SPI_PDD_TX_BUFFER_EMPTYG) != 0U) { /* Is HW Tx buffer empty? */
    if (DeviceDataPrv->OutSentDataNum < DeviceDataPrv->OutDataNumReq) { /* Is number of sent characters less than the number of requested incoming characters? */
      SPI_PDD_WriteData8Bit(SPI0_BASE_PTR, (*((uint8_t *)DeviceDataPrv->OutDataPtr++))); /* Put a character with command to the transmit register and increment pointer to the transmitt buffer */
      DeviceDataPrv->OutSentDataNum++; /* Increment the counter of sent characters. */
      if (DeviceDataPrv->OutSentDataNum == DeviceDataPrv->OutDataNumReq) {
        DeviceDataPrv->OutDataNumReq = 0x00U; /* Clear the counter of characters to be send by SendBlock() */
        SPISlave_OnBlockSent(DeviceDataPrv->UserData);
      }
    } else {
      SPI_PDD_DisableInterruptMask(SPI0_BASE_PTR, SPI_PDD_TX_BUFFER_EMPTY); /* Disable TX interrupt */
    }
  }
}

/*lint -restore Enable MISRA rule (11.4) checking. */
/* END SPISlave. */

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