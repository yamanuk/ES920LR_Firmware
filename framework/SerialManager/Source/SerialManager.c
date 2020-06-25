/*!
* Copyright (c) 2014, Freescale Semiconductor, Inc.
* All rights reserved.
*
* \file SerialManager.c
* This is the source file for the Serial Manager.
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


/*! *********************************************************************************
*************************************************************************************
* Include
*************************************************************************************
********************************************************************************** */

#include "SerialManager.h"
#include "Panic.h"
#include "MemManager.h"
#include "Messaging.h"
#include "FunctionLib.h"

#if (gSerialMgrUseUartA_c)
#include "UARTA.h"
#endif
#if (gSerialMgrUseUartB_c)
#include "UARTB.h"
#endif
#if (gSerialMgrUseIIC_c)
#include "I2CDriver.h"
#endif
#if (gSerialMgrUseSPI_c)
#include "SPISlave.h"
#endif

#if (gSerialMgrUseIIC_c || gSerialMgrUseSPI_c)
#include "DataAvailablePin.h"
#endif

#include <string.h>


/*! *********************************************************************************
*************************************************************************************
* Private macros
*************************************************************************************
********************************************************************************** */
#define mSerial_IncIdx_d(idx, max) if( ++(idx) >= (max) )  (idx) = 0;

#define mSerial_DecIdx_d(idx, max) if( (idx) > 0 )  (idx)--;     \
                              else  (idx) = (max) - 1;

/*! *********************************************************************************
*************************************************************************************
* Private prototypes
*************************************************************************************
********************************************************************************** */
#if (gSerialManagerMaxInterfaces_c)
static void SerialManagerTask(void const *argument);
serialStatus_t Serial_WriteInternal (uint8_t InterfaceId);
uint16_t Serial_ReadInternal(uint8_t InterfaceId, uint8_t *pData, uint16_t dataSize);

void SerialManager_RxNotify(LDD_TUserData *UserDataPtr);
void SerialManager_TxNotify(LDD_TUserData *UserDataPtr);
#if (gSerialMgrUseIIC_c)
void SerialManager_IICErrorNotify( LDD_TUserData *pData );
#endif

static inline serialStatus_t Serial_WriteCommon( uint8_t InterfaceId,
                                  uint8_t *pBuf,
                                  uint16_t bufLen,
                                  pSerialCallBack_t cb,
                                  void *pTxParam,
                                  uint8_t extraFlags);
static void Serial_TxQueueMaintenance(serial_t *pSer);
#endif

/************************************************************************************
*************************************************************************************
* Private type definitions
*************************************************************************************
************************************************************************************/
/* Defines events recognized by the SerialManager's Task */
typedef enum{
    gSMGR_Rx_c     = (1<<0),
    gSMGR_TxDone_c = (1<<1),
    gSMGR_TxNew_c  = (1<<2)
}serialEventType_t;

/*! *********************************************************************************
*************************************************************************************
* Public memory declarations
*************************************************************************************
********************************************************************************** */
extern void (*SerialManager_RxNotify_fptr)(LDD_TUserData*);
extern void (*SerialManager_TxNotify_fptr)(LDD_TUserData*);
extern void (*SerialManager_IICErrorNotify_fptr)(LDD_TUserData*);

/*! *********************************************************************************
*************************************************************************************
* Private memory declarations
*************************************************************************************
********************************************************************************** */
#if gSerialManagerMaxInterfaces_c
#if defined(__GNUC__)
osThreadLink_t osThreadLink_SerialManagerTask[1] = {0};
uint8_t osThread_SerialManagerTask_stack[(gSerialTaskStackSize_c)*(1)];
uint8_t osThread_SerialManagerTask_signal[36*(1)];
osThreadDef_t os_thread_def_SerialManagerTask = { SerialManagerTask,
                                                  gSerialTaskPriority_c,
                                                  1,
                                                  gSerialTaskStackSize_c,
                                                  osThread_SerialManagerTask_stack,
                                                  osThread_SerialManagerTask_signal,
                                                  osThreadLink_SerialManagerTask,
                                                  "SerialManagerTask"};
#else
osThreadDef( SerialManagerTask, gSerialTaskPriority_c, 1, gSerialTaskStackSize_c );
#endif
osThreadId  gSerialManagerTaskId = NULL;
serial_t    mSerials[gSerialManagerMaxInterfaces_c];
#endif

/*! *********************************************************************************
*************************************************************************************
* Public functions
*************************************************************************************
********************************************************************************** */

/*! *********************************************************************************
* \brief   Creates the SerialManager's task and initializes internal data structures
*
********************************************************************************** */
void SerialManager_Init( void )
{
#if (gSerialManagerMaxInterfaces_c)
    /* Check if SMGR is already initialized */
    if( gSerialManagerTaskId )
        return;

#if (gSerialMgrUseIIC_c || gSerialMgrUseSPI_c)
    DataAvailablePin_Init(NULL);
#endif

    SerialManager_RxNotify_fptr = SerialManager_RxNotify;
    SerialManager_TxNotify_fptr = SerialManager_TxNotify;

    /* Fill the structure with zeros */
    FLib_MemSet( mSerials, 0x00, sizeof(mSerials) );

    gSerialManagerTaskId = osThreadCreate(osThread(SerialManagerTask), NULL);
#endif
}

/*! *********************************************************************************
* \brief   The main task of the Serial Manager
*
* \param[in] initialData unused
*
********************************************************************************** */
#if (gSerialManagerMaxInterfaces_c)
static void SerialManagerTask(void const *argument)
{
    uint16_t i;
    uint8_t ev;

    for( i = 0; i < gSerialManagerMaxInterfaces_c; i++ )
        mSerials[i].txCurrent = gSerialMgrInvalidIdx_c;

    while( 1 )
    {
        /* Wait for an event. The task will block here. */
        osSignalWait( 0, osWaitForever );

        for( i = 0; i < gSerialManagerMaxInterfaces_c; i++ )
        {
            osInterruptDisable();
            ev = mSerials[i].flags;
            mSerials[i].flags = 0;
            osInterruptEnable();

            if ( (ev & gSMGR_Rx_c) &&
                 (NULL != mSerials[i].rxCallback) )
            {
                mSerials[i].rxCallback( mSerials[i].pRxParam );
            }

            if( ev & gSMGR_TxDone_c )
            {
                Serial_TxQueueMaintenance(&mSerials[i]);
            }


            /* If the Serial is IDLE and there is data to tx */
            if(
                ( mSerials[i].txCurrent == gSerialMgrInvalidIdx_c ) &&
                ( mSerials[i].txQueue[mSerials[i].txOut].flags & gSerialMgrBufferInUse_c ) &&
                ( mSerials[i].txQueue[mSerials[i].txOut].dataSize )
              )
            {
                mSerials[i].txCurrent = mSerials[i].txOut;
                if ( gSerial_Success_c != Serial_WriteInternal( i ) )
                {
                    SerialManager_TxNotify( (LDD_TUserData *)i );
                }
            }

        }
    } /* while(1) */
}
#endif

/*! *********************************************************************************
* \brief   Initialize a communication interface.
*
* \param[in] pInterfaceId pointer to a location where the interface Id will be stored
* \param[in] interfaceType the tupe of the interface: UART/SPI/IIC/USB
* \param[in] channel the number of the HW module (ex: if UART1 is used, this value should be 1)
*
* \return The interface number if success or gSerialManagerInvalidInterface_c if an error occured.
*
********************************************************************************** */
serialStatus_t Serial_InitInterface( uint8_t *pInterfaceId,
                                     serialInterfaceType_t interfaceType,
                                     uint8_t channel )
{
#if gSerialManagerMaxInterfaces_c
    uint8_t i;

    *pInterfaceId = gSerialMgrInvalidIdx_c;

    for ( i=0; i<gSerialManagerMaxInterfaces_c; i++ )
    {
        if ( (mSerials[i].serialType == interfaceType) &&
            (mSerials[i].serialChannel == channel) )
        {
            /* The Interface is allready opened. */
            return gSerial_InterfaceInUse_c;
        }
        else if ( mSerials[i].serialType == gSerialMgrNone_c )
        {
            mSerials[i].serialChannel = channel;
            switch ( interfaceType )
            {
#if (gSerialMgrUseUartA_c || gSerialMgrUseUartB_c)
            case gSerialMgrUart_c:
                switch(mSerials[i].serialChannel)
                {
#if gSerialMgrUseUartA_c
                case 1:
                    mSerials[i].serialIf = UARTA_Init( (void*)i );
                    break;
#endif
#if gSerialMgrUseUartB_c
                case 2:
                    mSerials[i].serialIf = UARTB_Init( (void*)i );
                    UARTB_ConnectPin(NULL, LDD_SERIAL_RX_PIN | LDD_SERIAL_TX_PIN);
                    break;
#endif
                default:
                    return gSerial_InvalidInterface_c;
                }
                if (NULL == mSerials[i].serialIf)
                {
                    return gSerial_InternalError_c;
                }
                else
                {
                    /* init Rx process */
                    switch(mSerials[i].serialChannel)
                    {
#if gSerialMgrUseUartA_c
                    case 1:
                        UARTA_ReceiveBlock( mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1 );
                        break;
#endif
#if gSerialMgrUseUartB_c
                    case 2:
                        UARTB_ReceiveBlock( mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1 );
                        break;
#endif
                    default:
                        return gSerial_InvalidInterface_c;
                    }
                }
                break;
#endif
#if gSerialMgrUseUSB_c
            case gSerialMgrUSB_c:
                if( gSerial_Success_c != serialInitUsb( i ) )
                    return gSerial_InternalError_c;
                break;
#endif
#if gSerialMgrUseIIC_c
            case gSerialMgrIICMaster_c:
            case gSerialMgrIICSlave_c:
                switch(mSerials[i].serialChannel)
                {
                case 1:
                    mSerials[i].serialIf = I2CDriver_Init( (void*)i );
                    DataAvailablePin_Init(NULL);
                    SerialManager_IICErrorNotify_fptr = SerialManager_IICErrorNotify;
                    break;
                default:
                    return gSerial_InvalidInterface_c;
                }

                if (NULL == mSerials[i].serialIf)
                {
                    return gSerial_InternalError_c;
                }

                if(interfaceType == gSerialMgrIICSlave_c)
                {
                    switch(mSerials[i].serialChannel)
                    {
                    case 1:
                        DataAvailablePin_SetPortEventCondition(NULL, DataAvailablePin_DAP_MASK, LDD_GPIO_DISABLED);
                        DataAvailablePin_SetPortOutputDirection(NULL, DataAvailablePin_DAP_MASK, 0);
                        I2CDriver_SlaveReceiveBlock(mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1);
                        break;
                    default:
                        return gSerial_InvalidInterface_c;
                    }
                }
                else
                {
                    DataAvailablePin_SetPortEventCondition(NULL, DataAvailablePin_DAP_MASK, LDD_GPIO_RISING);
                    DataAvailablePin_SetPortInputDirection(NULL, DataAvailablePin_DAP_MASK);
                    I2CDriver_SelectSlaveDevice(mSerials[i].serialIf,
                                          LDD_I2C_ADDRTYPE_7BITS,
                                          gSerialMgrIICAddress_c);
                }
                break;
#endif
#if gSerialMgrUseSPI_c
            case gSerialMgrSPIMaster_c:
            case gSerialMgrSPISlave_c:
                switch(mSerials[i].serialChannel)
                {
                case 1:
                    mSerials[i].serialIf = SPISlave_Init( (void*)i );
                    SPISlave_ConnectPin(mSerials[i].serialIf,
                                        LDD_SPISLAVE_INPUT_PIN |
                                        LDD_SPISLAVE_OUTPUT_PIN |
                                        LDD_SPISLAVE_CLK_PIN |
                                        LDD_SPISLAVE_SS_PIN);
                    DataAvailablePin_Init(NULL);
                    break;
                default:
                    return gSerial_InvalidInterface_c;
                }

                if (NULL == mSerials[i].serialIf)
                {
                    return gSerial_InternalError_c;
                }

                if(interfaceType == gSerialMgrSPISlave_c)
                {
                    switch(mSerials[i].serialChannel)
                    {
                    case 1:
                        DataAvailablePin_SetPortEventCondition(NULL, DataAvailablePin_DAP_MASK, LDD_GPIO_DISABLED);
                        DataAvailablePin_SetPortOutputDirection(NULL, DataAvailablePin_DAP_MASK, 0);
                        SPISlave_ReceiveBlock(mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1);
                        break;
                    default:
                        return gSerial_InvalidInterface_c;
                    }
                }
                else
                {
                    DataAvailablePin_SetPortEventCondition(NULL, DataAvailablePin_DAP_MASK, LDD_GPIO_RISING);
                    DataAvailablePin_SetPortInputDirection(NULL, DataAvailablePin_DAP_MASK);
                }
                break;
#endif
            default:
                return gSerial_InvalidInterface_c;
            }

            mSerials[i].txSyncSem = osSemaphoreCreate(NULL, 0);
            if ( NULL == mSerials[i].txSyncSem )
                return gSerial_SemCreateError_c;

#if gSerialMgr_BlockSenderOnQueueFull_c
            mSerials[i].txQueueSem = osSemaphoreCreate(NULL, 0);
            if ( NULL == mSerials[i].txQueueSem )
                return gSerial_SemCreateError_c;
#endif

            mSerials[i].serialType = interfaceType;
            *pInterfaceId = i;
            return gSerial_Success_c;
        }
    }

    /* There are no more free interfaces. */
    return gSerial_MaxInterfacesReached_c;
#else
    (void)interfaceType;
    (void)channel;
    (void)pInterfaceId;
    return gSerial_Success_c;
#endif
}

/*! *********************************************************************************
* \brief   Transmit a data buffer asynchronously
*
* \param[in] InterfaceId the interface number
* \param[in] pBuf pointer to data location
* \param[in] bufLen the number of bytes to be sent
* \param[in] pSerialRxCallBack pointer to a function that will be called when
*            a new char is available
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_AsyncWrite( uint8_t InterfaceId,
                                  uint8_t *pBuf,
                                  uint16_t bufLen,
                                  pSerialCallBack_t cb,
                                  void *pTxParam )
{
#if gSerialManagerMaxInterfaces_c
    return Serial_WriteCommon(InterfaceId, pBuf, bufLen, cb, pTxParam, 0);
#else
    (void)InterfaceId;
    (void)pBuf;
    (void)bufLen;
    (void)cb;
    (void)pTxParam;
    return gSerial_Success_c;
#endif /* gSerialManagerMaxInterfaces_c */
}


/*! *********************************************************************************
* \brief Transmit a data buffer synchronously. The task will block until the Tx is done
*
* \param[in] pBuf pointer to data location
* \param[in] bufLen the number of bytes to be sent
* \param[in] InterfaceId the interface number
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_SyncWrite( uint8_t InterfaceId,
                                 uint8_t *pBuf,
                                 uint16_t bufLen )
{
    serialStatus_t status = gSerial_Success_c;
#if gSerialManagerMaxInterfaces_c
    uint8_t flags = gSerialMgrSyncTx_c;
    volatile serial_t *pSer = &mSerials[InterfaceId];

    /* If the calling task is SMGR do not block on semaphore */
    if( osThreadGetId() == gSerialManagerTaskId )
        flags = 0;

    status  = Serial_WriteCommon(InterfaceId, pBuf, bufLen, NULL, NULL, flags);

    if( gSerial_Success_c == status )
    {
        /* Wait until Tx finishes. The sem will be released by the SMGR task */
        if( flags & gSerialMgrSyncTx_c )
        {
            osSemaphoreWait( pSer->txSyncSem, osWaitForever );
        }
        else
        {
            while(pSer->txCurrent != gSerialMgrInvalidIdx_c);
        }
    }
#else
    (void)pBuf;
    (void)bufLen;
    (void)InterfaceId;
#endif /* gSerialManagerMaxInterfaces_c */
    return status;
}

/*! *********************************************************************************
* \brief   Returns a specified number of characters from the Rx buffer
*
* \param[in] InterfaceId the interface number
* \param[out] pData pointer to location where to store the characters
* \param[in] dataSize the number of characters to be read
* \param[out] bytesRead the number of characters read
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_Read( uint8_t InterfaceId,
                            uint8_t *pData,
                            uint16_t dataSize,
                            uint16_t *bytesRead )
{
#if (gSerialManagerMaxInterfaces_c)
#if gSerialMgr_ParamValidation_d
    if ( (InterfaceId >= gSerialManagerMaxInterfaces_c) ||
        (NULL == pData) || (NULL == bytesRead) || (0 == dataSize) )
        return gSerial_InvalidParameter_c;
#endif

    switch ( mSerials[InterfaceId].serialType )
    {
#if (gSerialMgrUseUartA_c || gSerialMgrUseUartB_c)
    case gSerialMgrUart_c:
        *bytesRead = Serial_ReadInternal( InterfaceId, pData, dataSize );
        return gSerial_Success_c;
        break;
#endif
#if gSerialMgrUseUSB_c
    case gSerialMgrUSB_c:
        *bytesRead = serialReadUsb( pData, dataSize, &mSerials[InterfaceId] );
        return gSerial_Success_c;
        break;
#endif
#if gSerialMgrUseIIC_c
    case gSerialMgrIICMaster_c:
        switch(mSerials[InterfaceId].serialChannel)
        {
        case 1:
             I2CDriver_MasterReceiveBlock(mSerials[InterfaceId].serialIf, pData, dataSize, LDD_I2C_SEND_STOP);
            *bytesRead = dataSize;
            return gSerial_Success_c;
            break;
        default:
            return gSerial_InvalidInterface_c;
        }
        break;
    case gSerialMgrIICSlave_c:
        *bytesRead = Serial_ReadInternal( InterfaceId, pData, dataSize );
        return gSerial_Success_c;
        break;
#endif
#if gSerialMgrUseSPI_c
    case gSerialMgrSPISlave_c:
        *bytesRead = Serial_ReadInternal( InterfaceId, pData, dataSize );
        return gSerial_Success_c;
        break;
#endif
    default:
        return gSerial_InvalidInterface_c;
    }
#else
    (void)InterfaceId;
    (void)pData;
    (void)dataSize;
    (void)bytesRead;
    return gSerial_InvalidInterface_c;
#endif
}

/*! *********************************************************************************
* \brief   Returns a the number of bytes available in the RX buffer
*
* \param[in] InterfaceId the interface number
* \param[out] bytesCount the number of bytes available
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_RxBufferByteCount( uint8_t InterfaceId, uint16_t *bytesCount )
{
#if (gSerialManagerMaxInterfaces_c)
#if gSerialMgr_ParamValidation_d
    if ( (InterfaceId >= gSerialManagerMaxInterfaces_c) ||
        (NULL == bytesCount) )
        return  gSerial_InvalidParameter_c;
#endif
    if( mSerials[InterfaceId].rxIn >= mSerials[InterfaceId].rxOut )
    {
        *bytesCount = mSerials[InterfaceId].rxIn - mSerials[InterfaceId].rxOut;
    }
    else
    {
        *bytesCount = gSerialMgrRxBufSize_c - mSerials[InterfaceId].rxOut + mSerials[InterfaceId].rxIn;
    }
#else
    (void)bytesCount;
    (void)InterfaceId;
#endif
    return gSerial_Success_c;
}

/*! *********************************************************************************
* \brief   Sets a pointer to a function that will be called when data is received
*
* \param[in] InterfaceId the interface number
* \param[in] pfCallBack pointer to the function to be called
* \param[in] pRxParam pointer to a parameter which will be passed to the CB function
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_SetRxCallBack( uint8_t InterfaceId, pSerialCallBack_t cb, void *pRxParam )
{
#if (gSerialManagerMaxInterfaces_c)
#if gSerialMgr_ParamValidation_d
    if ( InterfaceId >= gSerialManagerMaxInterfaces_c )
        return gSerial_InvalidParameter_c;
#endif
    mSerials[InterfaceId].rxCallback = cb;
    mSerials[InterfaceId].pRxParam = pRxParam;
#else
    (void)InterfaceId;
    (void)cb;
    (void)pRxParam;
#endif
    return gSerial_Success_c;
}

/*! *********************************************************************************
* \brief   Set the communication speed for an interface
*
* \param[in] baudRate communication speed
* \param[in] InterfaceId the interface number
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_SetBaudRate( uint8_t InterfaceId, uint32_t baudRate  )
{
#if gSerialManagerMaxInterfaces_c
#if gSerialMgr_ParamValidation_d
    if ( (InterfaceId >= gSerialManagerMaxInterfaces_c) ||
        (0 == baudRate) )
        return gSerial_InvalidParameter_c;
#endif
    switch ( mSerials[InterfaceId].serialType )
    {
#if (gSerialMgrUseUartA_c || gSerialMgrUseUartB_c)
    LDD_SERIAL_TBaudMode baudRateInternal;
    case gSerialMgrUart_c:
        switch ( baudRate )
        {
        case gUARTBaudRate1200_c:
            baudRateInternal = UARTA_BM_1200BAUD;
            break;
        case gUARTBaudRate2400_c:
            baudRateInternal = UARTA_BM_2400BAUD;
            break;
        case gUARTBaudRate4800_c:
            baudRateInternal = UARTA_BM_4800BAUD;
            break;
        case gUARTBaudRate9600_c:
            baudRateInternal = UARTA_BM_9600BAUD;
            break;
        case gUARTBaudRate19200_c:
            baudRateInternal = UARTA_BM_19200BAUD;
            break;
        case gUARTBaudRate38400_c:
            baudRateInternal = UARTA_BM_38400BAUD;
            break;
        case gUARTBaudRate57600_c:
            baudRateInternal = UARTA_BM_57600BAUD;
            break;
        case gUARTBaudRate115200_c:
            baudRateInternal = UARTA_BM_115200BAUD;
            break;
        case gUARTBaudRate230400_c:
            baudRateInternal = UARTA_BM_230400BAUD;
            break;
        default:
            return gSerial_InvalidParameter_c;
        }

        switch(mSerials[InterfaceId].serialChannel)
        {
#if gSerialMgrUseUartA_c
            case 1:
                if( ERR_OK != UARTA_SelectBaudRate( mSerials[InterfaceId].serialIf, baudRateInternal ) )
                    return gSerial_InternalError_c;
                break;
#endif
#if gSerialMgrUseUartB_c
            case 2:
                if( ERR_OK != UARTB_SelectBaudRate( mSerials[InterfaceId].serialIf, baudRateInternal ) )
                    return gSerial_InternalError_c;
                break;
#endif
            default:
                return gSerial_InvalidInterface_c;
        }
        break;
#endif
#if gSerialMgrUseIIC_c
    case gSerialMgrIICMaster_c:
    case gSerialMgrIICSlave_c:
        return gSerial_InvalidInterface_c;
        break;
#endif
#if gSerialMgrUseSPI_c
    case gSerialMgrSPIMaster_c:
    case gSerialMgrSPISlave_c:
        return gSerial_InvalidInterface_c;
        break;
#endif
#if gSerialMgrUseUSB_c
    case gSerialMgrUSB_c:
        /* Nothing to do here. */
        break;
#endif
    default:
        return gSerial_InvalidInterface_c;
    }
#endif
    return gSerial_Success_c;
}

/*! *********************************************************************************
* \brief   Prints a char to the serial interface
*
* \param[in] InterfaceId the interface number
* \param[in] data to be printed
* \param[in] allowToBlock specify if the task will wait for the tx to finish or not.
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_PrintBin( uint8_t InterfaceId, uint8_t *data, uint8_t len, serialBlock_t allowToBlock )
{
#if gSerialManagerMaxInterfaces_c
    if ( allowToBlock )
    {
        return Serial_SyncWrite( InterfaceId, data, len );
    }
    else
    {
        return Serial_AsyncWrite( InterfaceId, data, len, NULL, NULL );
    }
#else
    (void)data;
    (void)allowToBlock;
    (void)InterfaceId;
    return gSerial_Success_c;
#endif
}

/*! *********************************************************************************
* \brief   Prints a string to the serial interface
*
* \param[in] InterfaceId the interface number
* \param[in] pString pointer to the string to be printed
* \param[in] allowToBlock specify if the task will wait for the tx to finish or not.
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_Print( uint8_t InterfaceId, char* pString, serialBlock_t allowToBlock )
{
#if gSerialManagerMaxInterfaces_c
    if ( allowToBlock )
    {
        return Serial_SyncWrite( InterfaceId, (uint8_t*)pString, strlen(pString) );
    }
    else
    {
        return Serial_AsyncWrite( InterfaceId, (uint8_t*)pString, strlen(pString), NULL, NULL );
    }
#else
    (void)pString;
    (void)allowToBlock;
    (void)InterfaceId;
    return gSerial_Success_c;
#endif
}

/*! *********************************************************************************
* \brief   Prints an number in hedadecimal format to the serial interface
*
* \param[in] InterfaceId the interface number
* \param[in] hex pointer to the number to be printed
* \param[in] len the number ob bytes of the number
* \param[in] flags specify display options: comma, space, new line
*
* \return The status of the operation
*
* \remarks The task will waituntil the tx has finished
*
********************************************************************************** */
serialStatus_t Serial_PrintHex( uint8_t InterfaceId,
                                uint8_t *hex,
                                uint8_t len,
                                uint8_t flags )
{
#if (gSerialManagerMaxInterfaces_c)
    uint8_t i=0;
    serialStatus_t status;
    uint8_t hexString[6]; /* 2 bytes  - hexadecimal display
    1 byte   - separator ( comma)
    1 byte   - separator ( space)
    2 bytes  - new line (\n\r)  */

    if ( !(flags & gPrtHexBigEndian_c) )
        hex = hex + (len-1);

    while ( len )
    {
        /* start preparing the print of a new byte */
        i=0;
        hexString[i++] = HexToAscii( (*hex)>>4 );
        hexString[i++] = HexToAscii( *hex );

        if ( flags & gPrtHexCommas_c )
        {
            hexString[i++] = ',';
        }
        if ( flags & gPrtHexSpaces_c )
        {
            hexString[i++] = ' ';
        }
        hex = hex + (flags & gPrtHexBigEndian_c ? 1 : -1);
        len--;

        if ( (len == 0) && (flags & gPrtHexNewLine_c) )
        {
            hexString[i++] = '\n';
            hexString[i++] = '\r';
        }

        /* transmit formatted byte */
        status = Serial_SyncWrite( InterfaceId, (uint8_t*)hexString, (uint8_t)i) ;
        if ( gSerial_Success_c != status )
            return status;
    }
#else
    /* Avoid compiler warning */
    (void)hex;
    (void)len;
    (void)InterfaceId;
    (void)flags;
#endif
    return gSerial_Success_c;
}

/*! *********************************************************************************
* \brief   Prints an unsigned integer to the serial interface
*
* \param[in] InterfaceId the interface number
* \param[in] nr the number to be printed
*
* \return The status of the operation
*
* \remarks The task will waituntil the tx has finished
*
********************************************************************************** */
serialStatus_t Serial_PrintDec( uint8_t InterfaceId, uint32_t nr )
{
#if (gSerialManagerMaxInterfaces_c)
#define gDecStringLen_d 12
    uint8_t i = gDecStringLen_d-1;
    uint8_t decString[gDecStringLen_d];

    if ( nr == 0 )
    {
        decString[i] = '0';
    }
    else
    {
        while ( nr )
        {
            decString[i] = '0' + (uint8_t)(nr % 10);
            nr = nr / 10;
            i--;
        }
        i++;
    }

    /* transmit formatted byte */
    return Serial_SyncWrite( InterfaceId, (uint8_t*)&decString[i], gDecStringLen_d-i );
#else
    (void)nr;
    (void)InterfaceId;
    return gSerial_Success_c;
#endif
}


/*! *********************************************************************************
* \brief   Configures the enabled hardware modules of the given interface type as a wakeup source from STOP mode
*
* \param[in] interface type of the modules to configure
*
* \return  gSerial_Success_c if there is at least one module to configure
*          gSerial_InvalidInterface_c otherwise
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */

serialStatus_t Serial_EnableLowPowerWakeup( serialInterfaceType_t interfaceType )
{
    serialStatus_t status = gSerial_InvalidInterface_c;
#if gSerialManagerMaxInterfaces_c
    if(interfaceType == gSerialMgrUart_c)
    {
        UART_MemMapPtr uartMapPtr;
#if (gSerialMgrUseUartA_c)
        uartMapPtr = (UART_MemMapPtr)UARTA_PRPH_BASE_ADDRESS;
        UART_BDH_REG(uartMapPtr)   &= ~(UART_BDH_RXEDGIE_MASK);
        // clear RXEDGIF
        UART_S2_REG(uartMapPtr)   = UART_S2_REG(uartMapPtr) & (~UART_S2_LBKDIF_MASK);
        // enable Rx Active edge interrupt
        UART_BDH_REG(uartMapPtr)   |= UART_BDH_RXEDGIE_MASK;
        status = gSerial_Success_c;
#endif

#if (gSerialMgrUseUartB_c)
        uartMapPtr = (UART_MemMapPtr)UARTB_PRPH_BASE_ADDRESS;
        UART_BDH_REG(uartMapPtr)   &= ~(UART_BDH_RXEDGIE_MASK);
        // clear RXEDGIF
        UART_S2_REG(uartMapPtr)   = UART_S2_REG(uartMapPtr) & (~UART_S2_LBKDIF_MASK);
        // enable Rx Active edge interrupt
        UART_BDH_REG(uartMapPtr)   |= UART_BDH_RXEDGIE_MASK;
        status = gSerial_Success_c;
#endif
    }
#else
    (void)interfaceType;
#endif
    return status;
}

/*! *********************************************************************************
* \brief   Configures the enabled hardware modules of the given interface type as modules without wakeup capabilities
*
* \param[in] interface type of the modules to configure
*
* \return  gSerial_Success_c if there is at least one module to configure
*          gSerial_InvalidInterface_c otherwise
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */

serialStatus_t Serial_DisableLowPowerWakeup( serialInterfaceType_t interfaceType)
{
    serialStatus_t status = gSerial_InvalidInterface_c;
#if gSerialManagerMaxInterfaces_c
    if(interfaceType == gSerialMgrUart_c)
    {
        UART_MemMapPtr uartMapPtr;
#if (gSerialMgrUseUartA_c)
        uartMapPtr = (UART_MemMapPtr)UARTA_PRPH_BASE_ADDRESS;
        UART_BDH_REG(uartMapPtr)  &= ~(UART_BDH_RXEDGIE_MASK);
        UART_S2_REG(uartMapPtr)   = UART_S2_REG(uartMapPtr) & (~UART_S2_LBKDIF_MASK);
        status = gSerial_Success_c;
#endif

#if (gSerialMgrUseUartB_c)
        uartMapPtr = (UART_MemMapPtr)UARTB_PRPH_BASE_ADDRESS;
        UART_BDH_REG(uartMapPtr)  &= ~(UART_BDH_RXEDGIE_MASK);
        UART_S2_REG(uartMapPtr)   = UART_S2_REG(uartMapPtr) & (~UART_S2_LBKDIF_MASK);
        status = gSerial_Success_c;
#endif
    }
#else
    (void)interfaceType;
#endif
    return status;
}

/*! *********************************************************************************
* \brief   Decides whether a enabled hardware module of the given interface type woke up the CPU from STOP mode.
*
* \param[in] interface type of the modules to be evaluated as wakeup source.
*
* \return  TRUE if a module of the given interface type was the wakeup source
*          FALSE otherwise
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */

bool_t Serial_IsWakeUpSource( serialInterfaceType_t interfaceType)
{
    bool_t status = FALSE;
#if gSerialManagerMaxInterfaces_c
    if(interfaceType == gSerialMgrUart_c)
    {
        UART_MemMapPtr uartMapPtr;
#if (gSerialMgrUseUartA_c)
        uartMapPtr = (UART_MemMapPtr)UARTA_PRPH_BASE_ADDRESS;
        if( (UART_S2_REG(uartMapPtr) & UART_S2_RXEDGIF_MASK ) == UART_S2_RXEDGIF_MASK )
        {
            status = TRUE;
        }
#endif

#if (gSerialMgrUseUartB_c)
        uartMapPtr = (UART_MemMapPtr)UARTB_PRPH_BASE_ADDRESS;
        if( (UART_S2_REG(uartMapPtr) & UART_S2_RXEDGIF_MASK ) == UART_S2_RXEDGIF_MASK )
        {
            status = TRUE;
        }
#endif
    }
#else
    (void)interfaceType;
#endif
    return status;
}


/*! *********************************************************************************
*************************************************************************************
* Private functions
*************************************************************************************
********************************************************************************* */
#if (gSerialManagerMaxInterfaces_c)
/*! *********************************************************************************
* \brief Transmit a data buffer to the specified interface.
*
* \param[in] InterfaceId the interface number
*
* \return The status of the operation
*
********************************************************************************** */
serialStatus_t Serial_WriteInternal( uint8_t InterfaceId )
{
    serial_t *pSer = &mSerials[InterfaceId];
    uint16_t idx = pSer->txCurrent;
    LDD_TError status = 0;

    (void)status;

    switch ( mSerials[InterfaceId].serialType )
    {
#if (gSerialMgrUseUartA_c || gSerialMgrUseUartB_c)
    case gSerialMgrUart_c:
        switch(mSerials[InterfaceId].serialChannel)
        {
#if gSerialMgrUseUartA_c
            case 1:
                status = UARTA_SendBlock( pSer->serialIf,
                                          pSer->txQueue[idx].pData,
                                          pSer->txQueue[idx].dataSize );
                break;
#endif
#if gSerialMgrUseUartB_c
            case 2:
                status = UARTB_SendBlock( pSer->serialIf,
                                          pSer->txQueue[idx].pData,
                                          pSer->txQueue[idx].dataSize );
                break;
#endif
            default:
                return gSerial_InvalidInterface_c;
        }
        if ( status == ERR_OK  )
        {
            return gSerial_Success_c;
        }
        else
        {
            return gSerial_InternalError_c;
        }
        break;
#endif

#if gSerialMgrUseUSB_c
    case gSerialMgrUSB_c:
        return serialWriteUsb( pSer->txQueue[idx].pData,
                               pSer->txQueue[idx].dataSize,
                               pSer );
        break;
#endif

#if gSerialMgrUseIIC_c
    case gSerialMgrIICMaster_c:
        switch(mSerials[InterfaceId].serialChannel)
        {
        case 1:
            status = I2CDriver_MasterSendBlock( pSer->serialIf,
                                                pSer->txQueue[idx].pData,
                                                pSer->txQueue[idx].dataSize,
                                                LDD_I2C_SEND_STOP);
            break;
        default:
            return gSerial_InvalidInterface_c;
        }
        if ( status == ERR_OK  )
        {
            return gSerial_Success_c;
        }
        else
        {
            return gSerial_InternalError_c;
        }
        break;
    case gSerialMgrIICSlave_c:
        switch(pSer->serialChannel)
        {
        case 1:
            status = I2CDriver_SlaveSendBlock(pSer->serialIf,
                                        pSer->txQueue[idx].pData,
                                        pSer->txQueue[idx].dataSize);
            DataAvailablePin_SetFieldBits(NULL, DAP, 1);
            break;
        default:
            return gSerial_InvalidInterface_c;
        }
        if ( status == ERR_OK  )
        {
            return gSerial_Success_c;
        }
        else
        {
            return gSerial_InternalError_c;
        }
        break;
#endif

#if gSerialMgrUseSPI_c
    case gSerialMgrSPISlave_c:
        switch(pSer->serialChannel)
        {
        case 1:
            status = SPISlave_SendBlock(pSer->serialIf,
                                        pSer->txQueue[idx].pData,
                                        pSer->txQueue[idx].dataSize);
            DataAvailablePin_SetFieldBits(NULL, DAP, 1);
            break;
        default:
            return gSerial_InvalidInterface_c;
        }
        if ( status == ERR_OK  )
        {
            return gSerial_Success_c;
        }
        else
        {
            return gSerial_InternalError_c;
        }
        break;
#endif
    default:
        return gSerial_InvalidInterface_c;
    }
}

/*! *********************************************************************************
* \brief Inform the Serial Manager task that new data is available
*
* \param[in] pData The id interface
*
* \return none
*
* \remarks Called from ISR
*
********************************************************************************** */
void SerialManager_RxNotify( LDD_TUserData *pData )
{
    uint32_t i = (uint32_t)pData;

    mSerial_IncIdx_d(mSerials[i].rxIn, gSerialMgrRxBufSize_c);

    //if ( mSerials[i].rxBytes < gSerialMgrRxBufSize_c )
    {
        switch( mSerials[i].serialType )
        {
        case gSerialMgrUart_c:
#if (gSerialMgrUseUartA_c || gSerialMgrUseUartB_c)
            switch( mSerials[i].serialChannel )
            {
#if gSerialMgrUseUartA_c
            case 1:
                UARTA_ReceiveBlock( mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1 );
                break;
#endif
#if gSerialMgrUseUartB_c
            case 2:
                UARTB_ReceiveBlock( mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1 );
                break;
#endif
            default:
                break;
            }
            break;
#endif
        case gSerialMgrIICSlave_c:
#if (gSerialMgrUseIIC_c)
            switch(mSerials[i].serialChannel)
            {
            case 1:
                I2CDriver_SlaveReceiveBlock(mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1);
                break;
            default:
                break;
            }
#endif
            break;
        case gSerialMgrIICMaster_c:
#if (gSerialMgrUseIIC_c)

#endif
            break;
        case gSerialMgrSPISlave_c:
#if (gSerialMgrUseSPI_c)
            switch(mSerials[i].serialChannel)
            {
            case 1:
                if(DataAvailablePin_GetFieldValue(NULL, DAP) != 0) /*discard Rxed chars during slave Tx*/
                {
                    if ( mSerials[i].rxIn == 0 )
                    {
                        mSerials[i].rxIn = gSerialMgrRxBufSize_c - 1;
                    }
                    else
                    {
                        mSerials[i].rxIn--;
                    }
                }
                SPISlave_ReceiveBlock(mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1);
                break;
            default:
                break;
            }
#endif
            break;

        }
    }

#if (gSerialMgrUseSPI_c)
    if( (mSerials[i].serialType == gSerialMgrSPISlave_c) &&
        (DataAvailablePin_GetFieldValue(NULL, DAP) == 1) )
    {
      /*discard Rxed chars during slave Tx*/
      return;
    }
#endif

    mSerials[i].flags |= gSMGR_Rx_c;
    osSignalSet( gSerialManagerTaskId, gSMGR_Rx_c );
}

/*! *********************************************************************************
* \brief Inform the Serial Manager task that a transmission has finished
*
* \param[in] pData the Id interface
*
* \return none
*
* \remarks Called from ISR
*
********************************************************************************** */
void SerialManager_TxNotify( LDD_TUserData *pData )
{
    volatile serial_t *pSer = &mSerials[(uint32_t)pData];
    uint32_t idx = pSer->txCurrent;

    pSer->flags |= gSMGR_TxDone_c;
    pSer->txQueue[idx].dataSize = 0; //Mark as transmitted
    mSerial_IncIdx_d(idx, gSerialMgrTxQueueSize_c);

    /* Transmit next block if available */
    if( idx != pSer->txIn )
    {
        pSer->txCurrent = idx;
        if ( gSerial_Success_c != Serial_WriteInternal( (uint32_t)pData ) )
            pSer->txCurrent = gSerialMgrInvalidIdx_c;
    }
    else
    {
        pSer->txCurrent = gSerialMgrInvalidIdx_c;
#if (gSerialMgrUseIIC_c)
        if( pSer->serialType == gSerialMgrIICSlave_c )
        {
            DataAvailablePin_ClearFieldBits( NULL, DAP, 1 );
        }
#endif
#if (gSerialMgrUseSPI_c)
        if( pSer->serialType == gSerialMgrSPISlave_c )
        {
//pbivol
//            static uint8_t sendDummyBytes=1;
//            static uint8_t dummyData[2] = {'^', '%'};
//
//            if(sendDummyBytes == 1)
//            {
//                SPISlave_SendBlock(mSerials[i].serialIf, dummyData, 2);
//                sendDummyBytes = 0;
//                return;
//            }
//            else
//            {
//                DataAvailablePin_ClearFieldBits(NULL, DAP, 1);
//                //SPISlave_CancelBlockTransmission(mSerials[i].serialIf);
//                sendDummyBytes = 1;
//            }
//            *((uint8_t *)(mSerials[i].serialIf)+14) = &"^%";
//            *((uint8_t *)(mSerials[i].serialIf)+18) = 2;
            DataAvailablePin_ClearFieldBits( NULL, DAP, 1 );
        }
#endif
    }
    osSignalSet( gSerialManagerTaskId, gSMGR_TxDone_c );
}

/*! *********************************************************************************
* \brief Inform the Serial Manager task that the IIC transmission has finished
*
* \param[in] pData the interfaceId
*
* \return none
*
* \remarks Called from ISR
*
********************************************************************************** */
#if (gSerialMgrUseIIC_c)
void SerialManager_IICErrorNotify( LDD_TUserData *pData )
{
    uint32_t i = (uint32_t)pData;

    LDD_I2C_TErrorMask errorMask;
    I2CDriver_GetError( mSerials[i].serialIf, &errorMask );

    switch(errorMask)
    {
        case LDD_I2C_MASTER_NACK:
            SerialManager_TxNotify( (void*)i );
            break;
        default:
            break;
    }
}
#endif

/*! *********************************************************************************
* \brief Retrieve Rx data from internal SM buffer
*
* \param[in] InterfaceId the interface number
* \param[out] pData pointer to location where to store the characters
* \param[in] dataSize the number of characters to be read
*
* \return the number of characters retrieved
*
********************************************************************************** */
uint16_t Serial_ReadInternal( uint8_t InterfaceId,
                             uint8_t *pData,
                             uint16_t dataSize )
{
    uint16_t bytes;
    serial_t *pSer = &mSerials[InterfaceId];

    Serial_RxBufferByteCount(InterfaceId, &bytes);

    if( bytes > 0 )
    {
        uint16_t i;

        if( bytes > dataSize )
            bytes = dataSize;

        /* Copy data */
        for( i=0; i<bytes; i++ )
        {
            pData[i] = pSer->rxBuffer[pSer->rxOut++];
            if ( pSer->rxOut >= gSerialMgrRxBufSize_c )
            {
                pSer->rxOut = 0;
            }
        }
    }

    return bytes;
}

/*! *********************************************************************************
* \brief   Transmit a data buffer asynchronously
*
* \param[in] InterfaceId the interface number
* \param[in] pBuf pointer to data location
* \param[in] bufLen the number of bytes to be sent
* \param[in] pSerialRxCallBack pointer to a function that will be called when
*            a new char is available
* \param[in] pTxParam pointer to a parameter to be passed to the callback function
* \param[in] extraFlags Flags to be OR'ed.
*
* \return The status of the operation
*
********************************************************************************** */
static inline serialStatus_t Serial_WriteCommon( uint8_t id,
                                   uint8_t *pBuf,
                                   uint16_t bufLen,
                                   pSerialCallBack_t cb,
                                   void *pTxParam,
                                   uint8_t extraFlags)
{
    SerialMsg_t *pMsg = NULL;
    serial_t *pSer = &mSerials[id];
    osThreadId taskId = osThreadGetId();

#if gSerialMgr_ParamValidation_d
    if( (NULL == pBuf) || (0 == bufLen) ||
        (id >= gSerialManagerMaxInterfaces_c) ||
        (pSer->serialType == gSerialMgrNone_c) )
    {
        return gSerial_InvalidParameter_c;
    }
#endif

    if( taskId == gSerialManagerTaskId )
        Serial_TxQueueMaintenance(pSer);

#if gSerialMgr_BlockSenderOnQueueFull_c
    if( pSer->txQueue[pSer->txIn].flags )
    {
        if( taskId != gSerialManagerTaskId )
        {
            pSer->txBlockedTasks++;
            osSemaphoreWait( pSer->txQueueSem, osWaitForever );
        }
        else
        {
            while( pSer->txQueue[pSer->txIn].flags )
                Serial_TxQueueMaintenance(pSer);
        }
    }
#endif

    /* Check if slot is free */
    osInterruptDisable();
    if( 0 == pSer->txQueue[pSer->txIn].flags )
    {
        pMsg = &pSer->txQueue[pSer->txIn];
        pMsg->flags      = gSerialMgrBufferInUse_c | extraFlags;
        pMsg->dataSize   = bufLen;
        pMsg->pData      = (void*)pBuf;
        pMsg->txCallback = cb;
        pMsg->pTxParam   = pTxParam;
        mSerial_IncIdx_d(pSer->txIn, gSerialMgrTxQueueSize_c);
    }
    osInterruptEnable();

    if( pMsg )
    {
        /* If interface is Idle, start Tx asap */
        if( pSer->txCurrent == gSerialMgrInvalidIdx_c )
        {
            pSer->txCurrent = pSer->txOut;
            if ( gSerial_Success_c != Serial_WriteInternal( id ) )
            {
                SerialManager_TxNotify( (LDD_TUserData *)id );
            }
        }
        else
        {
            osSignalSet( gSerialManagerTaskId, gSMGR_TxNew_c );
        }
        return gSerial_Success_c;
    }

    return gSerial_OutOfMemory_c;
}

/*! *********************************************************************************
* \brief   This function will mark all finished TX queue entries as empty.
*          If a calback was provided, it will be run.
*
* \param[in] pSer pointer to the serial interface internal structure
*
********************************************************************************** */
static void Serial_TxQueueMaintenance(serial_t *pSer)
{
    while( (pSer->txQueue[pSer->txOut].flags & gSerialMgrBufferInUse_c) &&
           (pSer->txQueue[pSer->txOut].dataSize == 0) )
    {
        pSer->txQueue[pSer->txOut].flags &= ~gSerialMgrBufferInUse_c;

        /* Run Calback */
        if( pSer->txQueue[pSer->txOut].txCallback )
        {
            pSer->txQueue[pSer->txOut].txCallback( pSer->txQueue[pSer->txOut].pTxParam );
        }

        /* If this was a SyncWrite, release the semaphore */
        if( pSer->txQueue[pSer->txOut].flags & gSerialMgrSyncTx_c )
        {
            osSemaphoreRelease( pSer->txSyncSem );
        }

        /* Mark buffer as unused */
        pSer->txQueue[pSer->txOut].flags = 0;

        mSerial_IncIdx_d(pSer->txOut, gSerialMgrTxQueueSize_c);
#if gSerialMgr_BlockSenderOnQueueFull_c
        if( pSer->txBlockedTasks )
        {
            pSer->txBlockedTasks--;
            osSemaphoreRelease( pSer->txQueueSem );
        }
#endif
    }
}

#endif //#if (gSerialManagerMaxInterfaces_c)
