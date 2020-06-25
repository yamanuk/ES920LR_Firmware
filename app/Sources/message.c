/*****************************************************************************
* message file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#include <string.h>
#include <math.h>
#include "Application_Interface.h"
#include "flash.h"
#include "llwu.h"
#include "lptmr.h"
#include "smc.h"
#include "LED.h"
#include "mcg.h"
#include "usr_tasks.h"
#include "message.h"
#include "mqxlite.h"
#include "mqxlite_prv.h"

#include "adc16.h"

/////////////////////////
/// Kohei ///////////////
uint8_t user_data[52];


/************************************************************************************
*************************************************************************************
* Private macros
*************************************************************************************
************************************************************************************/

#define INTERVAL_TIMEOUT            ( 100 )
#define IS_ROUTING                  ( 0x80 )
#define MAX_DATA_LENGTH             ( 50 )


/************************************************************************************
*************************************************************************************
* Private prototypes
*************************************************************************************
************************************************************************************/

static void ProcessEvent( void );
static smacErrors_t SendPacketProcess( uint8_t data_length );
static void ReceivePacketProcess( void );
static uint16_t CheckRouteInfo( rxPacket_t*, uint16_t* );
static void ReceiveData( rxPacket_t*, int16_t );
#ifdef _STATIC_ROUTING_
static void RoutingPacket( rxPacket_t*, uint16_t, uint16_t );
#endif
static void SendDoneProcess( void );
static void SleepProcess( void );
static void IntervalTimerCallBack ( void* );
static void SendTimeTimerCallBack ( void* );

smacErrors_t smacToAppHandler( uint8_t type, uint8_t status );


/************************************************************************************
*************************************************************************************
* Private memory declarations
*************************************************************************************
************************************************************************************/

static uint8_t           gau8RxDataBuffer[gSmacBuffersSize_c];
static uint8_t           gau8TxDataBuffer[gSmacBuffersSize_c];
static bool_t            bCCAFailed;
static bool_t            bAckFailed;
static txContextConfig_t txConfig;


/************************************************************************************
*************************************************************************************
* Public memory declarations
*************************************************************************************
************************************************************************************/

txPacket_t*       gAppTxPacket;
rxPacket_t*       gAppRxPacket;
uint8_t           gSendingType;


/************************************************************************************
*************************************************************************************
* Public functions
*************************************************************************************
************************************************************************************/

/************************************************************************************
*
* DoOperation
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
void DoOperation( void )
{
    smacErrors_t err = gErrorNoError_c;


    /* LLMU module initialization */
    if( END_DEVICE == mTermParam.Node )
    {
        if( TIMER_WAKEUP == mTermParam.Sleep )
        {
            /* LPTMR */
            llwu_configure( 0x0000, LLWU_PIN_FALLING, LLWU_LPTMR_ME );
        }
        else if( INT_WAKEUP == mTermParam.Sleep )
        {
            /* PTC1 */
            llwu_configure( 0x0040, LLWU_PIN_FALLING, 0x00 );
        }
    }

    gAppTxPacket    = (txPacket_t*)gau8TxDataBuffer;
    gAppRxPacket    = (rxPacket_t*)gau8RxDataBuffer;

    /* SMAC Initialization */
    SMAC_Init();

    /* Tell SMAC who to call when it needs to pass a message to the application thread. */
    SMAC_RegisterHandler( (SMAC_APP_Handler_t)smacToAppHandler );

    SMAC_SetPanID( mTermParam.PanId );
    SMAC_SetSrcAddress( mTermParam.SrcId );
    SMAC_FillHeader( &(gAppTxPacket->smacHeader), mTermParam.DstId );
    SMAC_SetChannel( (mTermParam.Channel - 1), mTermParam.Bw );
    SMAC_SetSpreadingFactor( mTermParam.Sf );
    SMAC_SetRFPower( mTermParam.Power );

    if( MODE_ON == mTermParam.Ack )
    {
        txConfig.autoAck = TRUE;
        txConfig.retryCountAckFail = mTermParam.Retry;
    }
    else
    {
        txConfig.autoAck = FALSE;
        txConfig.retryCountAckFail = 0;
    }
    txConfig.ccaBeforeTx       = TRUE;
    txConfig.retryCountCCAFail = 3;
    SMAC_ConfigureTxContext( &txConfig );

    IntervalTmr  = TMR_AllocateTimer();
    WaitSendTmr  = TMR_AllocateTimer();
    UartCheckTmr = TMR_AllocateTimer();
    SendTimeTmr  = TMR_AllocateTimer();

    /* start interval timer for WDT */
    TMR_StartIntervalTimer( IntervalTmr, INTERVAL_TIMEOUT, IntervalTimerCallBack, NULL );

    Terminal_Print( "\r\n ----- operation mode is ready ----- \r\n" );
    Processor_Print( "\r\n" );

    /* ready to receive */
    SetRadioRxOnNoTimeOut();

    if( 0 != mTermParam.SendTime )
    {
        FLib_MemCpy( SendDataBuffer, mTermParam.SendData, strlen((char*)mTermParam.SendData) );
        err = SendPacketProcess( strlen((char*)mTermParam.SendData) );
        if( gErrorNoError_c != err )
        {
            TMR_StartSingleShotTimer( SendTimeTmr, mTermParam.SendTime * 1000, SendTimeTimerCallBack, NULL );
        }
    }

    while( 1 )
    {
        ProcessEvent();
    }
}


/************************************************************************************
*************************************************************************************
* Private functions
*************************************************************************************
************************************************************************************/

/************************************************************************************
*
* ProcessEvent
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void ProcessEvent( void )
{
    osEvent      ev;
    smacErrors_t err = gErrorNoError_c;


    ev = osSignalWait( 0, osWaitForever );

    /* receive UART Data */
    if( EVENT_UART_RX & ev.value.signals )
    {
        Debug_Print( "receive UART data\r\n" );

        /* send RF data */
        SendPacketProcess( SendDataLen );
    }

    /* receive RF Data */
    if( EVENT_MCPS_IND & ev.value.signals )
    {
        Debug_Print( "receive RF data\r\n" );

        /* process receive data */
        ReceivePacketProcess();
    }

    /* send done RF Data */
    if( EVENT_MCPS_CNF & ev.value.signals )
    {
        Debug_Print( "send done data\r\n" );

        /* send done RF data */
        SendDoneProcess();

        if( (0 != mTermParam.SendTime) && (NO_SLEEP == mTermParam.Sleep) )
        {
            TMR_StartSingleShotTimer( SendTimeTmr, mTermParam.SendTime * 1000, SendTimeTimerCallBack, NULL );
        }
    }

    /* send time */
    if( EVENT_SEND_TIME & ev.value.signals )
    {
        FLib_MemCpy( SendDataBuffer, mTermParam.SendData, strlen((char*)mTermParam.SendData) );
        err = SendPacketProcess( strlen((char*)mTermParam.SendData) );
        if( gErrorNoError_c != err )
        {
            TMR_StartSingleShotTimer( SendTimeTmr, mTermParam.SendTime * 1000, SendTimeTimerCallBack, NULL );
        }
    }

    /* WDT Reset */
    if( EVENT_WDT_RESET & ev.value.signals )
    {
        /* process reset WDT */
        WDG_Refresh();
    }

    /* enter sleep mode if node is EndDevice */
    SleepProcess();
}

/************************************************************************************
*
* SendPacketProcess
*
* Interface assumptions:
*     data_length   send data length
*
* Return value:
*     smacErrors_t  send result
*
************************************************************************************/
static smacErrors_t SendPacketProcess( uint8_t data_length )
{
#ifdef _STATIC_ROUTING_
    USER_HEADER*    header      = NULL;
#endif
	smacErrors_t    err         = gErrorNoError_c;
    uint8_t         len         = 6;


    /* too long */
    if( ((MAX_DATA_LENGTH < data_length) && (TRANS_PAYLOAD == mTermParam.TransMode)) ||
        (((MAX_DATA_LENGTH + FRAME_HEAD) < data_length) && (TRANS_FRAME == mTermParam.TransMode)) )
    {
        Terminal_Print( "send data length too long\r\n" );
        if( FMT_ASCII == mTermParam.Format )
        {
            Processor_Print( "NG 100\r\n" );
        }
        else
        {
            Processor_PrintBin( &len, 1 );
            Processor_Print( "NG 100" );
        }
        return( gErrorOutOfRange_c );
    }

    /* too short */
    if( (data_length <= FRAME_HEAD) && (TRANS_FRAME == mTermParam.TransMode) )
    {
        Terminal_Print( "send data length too short\r\n" );
        if( FMT_ASCII == mTermParam.Format )
        {
            Processor_Print( "NG 100\r\n" );
        }
        else
        {
            Processor_PrintBin( &len, 1 );
            Processor_Print( "NG 100" );
        }
        return( gErrorOutOfRange_c );
    }

#ifdef _STATIC_ROUTING_
    header = (USER_HEADER*)&gAppTxPacket->smacPdu.smacPdu[0];
#endif

    /* PAYLOAD */
    if( TRANS_PAYLOAD == mTermParam.TransMode )
    {
#ifdef _STATIC_ROUTING_
		gAppTxPacket->smacHeader.totalLength = data_length + sizeof(USER_HEADER);
#else
        gAppTxPacket->smacHeader.totalLength = data_length;
#endif
        gAppTxPacket->smacHeader.data_type   = MSG_DATA;

        /* make header from pre-set parameter */
        SMAC_SetPanID( mTermParam.PanId );
        SMAC_SetSrcAddress( mTermParam.SrcId );
        SMAC_FillHeader( &(gAppTxPacket->smacHeader), mTermParam.DstId );
#ifdef _STATIC_ROUTING_
        header->hop_cnt         = mTermParam.HopCnt;
        header->reserved        = 0;
        header->route1          = mTermParam.Route[0];
        header->route2          = mTermParam.Route[1];
        header->end_addr        = mTermParam.EndId;
        header->ori_addr        = mTermParam.SrcId;
#endif

        err = SendPacket( SendDataBuffer, data_length );
    }
    /* FRAME MODE */
    else
    {
#ifdef _STATIC_ROUTING_
        gAppTxPacket->smacHeader.totalLength = data_length - FRAME_HEAD + sizeof(USER_HEADER);
#else
        gAppTxPacket->smacHeader.totalLength = data_length - FRAME_HEAD;
#endif
        gAppTxPacket->smacHeader.data_type   = MSG_DATA;

        /* make header from UART input parameter */
        SMAC_SetPanID( (AsciiToHex(SendDataBuffer[0]) << 12) | (AsciiToHex(SendDataBuffer[1]) << 8) |
                       (AsciiToHex(SendDataBuffer[2]) << 4)  |  AsciiToHex(SendDataBuffer[3]) );
        SMAC_SetSrcAddress( mTermParam.SrcId );
        SMAC_FillHeader( &(gAppTxPacket->smacHeader),
                         (AsciiToHex(SendDataBuffer[4]) << 12) | (AsciiToHex(SendDataBuffer[5]) << 8) |
                         (AsciiToHex(SendDataBuffer[6]) << 4)  |  AsciiToHex(SendDataBuffer[7]) );
#ifdef _STATIC_ROUTING_
        header->hop_cnt         = (AsciiToHex(SendDataBuffer[8]) << 4) | AsciiToHex(SendDataBuffer[9]);
        header->reserved        = 0;
        header->route1          = (AsciiToHex(SendDataBuffer[10]) << 12) | (AsciiToHex(SendDataBuffer[11]) << 8) |
                                  (AsciiToHex(SendDataBuffer[12]) << 4)  |  AsciiToHex(SendDataBuffer[13]);
        header->route2          = (AsciiToHex(SendDataBuffer[14]) << 12) | (AsciiToHex(SendDataBuffer[15]) << 8) |
                                  (AsciiToHex(SendDataBuffer[16]) << 4)  |  AsciiToHex(SendDataBuffer[17]);
        header->end_addr        = (AsciiToHex(SendDataBuffer[18]) << 12) | (AsciiToHex(SendDataBuffer[19]) << 8) |
                                  (AsciiToHex(SendDataBuffer[20]) << 4)  |  AsciiToHex(SendDataBuffer[21]);
        header->ori_addr        = mTermParam.SrcId;
#endif

        err = SendPacket( (SendDataBuffer + FRAME_HEAD), (data_length - FRAME_HEAD) );
    }

    /* send success */
    if( err == gErrorNoError_c )
    {
        /* set sending packet type */
        gSendingType = MSG_DATA;
    }
    else if( err == gErrorBusy_c )
    {
        Terminal_Print( "carrier sense failed\r\n" );
        if( FMT_ASCII == mTermParam.Format )
        {
            Processor_Print( "NG 102\r\n" );
        }
        else
        {
            Processor_PrintBin( &len, 1 );
            Processor_Print( "NG 102" );
        }

        if( TIMER_WAKEUP == mTermParam.Sleep )
        {
            gEnterIdle = TRUE;
        }
    }
    else
    {
        Terminal_Print( "send data failed\r\n" );
        if( FMT_ASCII == mTermParam.Format )
        {
            Processor_Print( "NG 101\r\n" );
        }
        else
        {
            Processor_PrintBin( &len, 1 );
            Processor_Print( "NG 101" );
        }

        if( TIMER_WAKEUP == mTermParam.Sleep )
        {
            gEnterIdle = TRUE;
        }
    }

    return( err );
}

/************************************************************************************
*
* SendPacket
*
* Interface assumptions:
*     pData         send data
*     DataLen       send data length
*
* Return value:
*     smacErrors_t  send result
*
************************************************************************************/
#define MARGIN 100

smacErrors_t SendPacket( uint8_t* pData, uint8_t DataLen )
{
    smacErrors_t    err         = gErrorNoError_c;
    uint32_t        sendTmo     = 0;
    float           symbolTime  = 0;
    uint32_t        ackTime     = 0;
    uint32_t        dataTime    = 0;
    uint8_t         txLen       = gAppTxPacket->smacHeader.totalLength;


    /* now sending packet */
    if( gSendingType )
    {
        Terminal_Print( "send failed bacause now sending packet\r\n" );

        return( gErrorNoValidCondition_c );
    }

    /* copy to pdu */
    if( (NULL != pData) && (0 != DataLen) )
    {
#ifdef _STATIC_ROUTING_
        FLib_MemCpy( gAppTxPacket->smacPdu.smacPdu + sizeof(USER_HEADER), (void *)pData, DataLen );
#else
        FLib_MemCpy( gAppTxPacket->smacPdu.smacPdu, (void *)pData, DataLen );
#endif
    }

    Terminal_Print( "<-- send data info[" );
    Terminal_Print( "panid = " );    Terminal_PrintHex( (uint8_t*)&gAppTxPacket->smacHeader.panId_l, 2, 0 );
    Terminal_Print( ", srcid = " );  Terminal_PrintHex( (uint8_t*)&gAppTxPacket->smacHeader.srcAddr_l, 2, 0 );
    Terminal_Print( ", dstid = " );  Terminal_PrintHex( (uint8_t*)&gAppTxPacket->smacHeader.destAddr_l, 2, 0 );
    Terminal_Print( ", length = " ); Terminal_PrintHex( (uint8_t*)&DataLen, 1, 0 );
    Terminal_Print( "]\r\n" );

    /* Get symbol time */
    symbolTime = SMAC_GetSymbolTime( mTermParam.Bw, mTermParam.Sf );

    /* start send done wait timer */
    if( TRUE == txConfig.autoAck )
    {
        ackTime = 50 + (uint32_t)ceil((symbolTime * 2.0) + (symbolTime * 12.25) +    // (Preamble = 12.25 symbol)
                  (symbolTime * (8+ceil((80-4.0*mTermParam.Sf+44)/(4.0*(mTermParam.Sf-2)))*5)));

        dataTime = (uint32_t)ceil((symbolTime * 12.25) +                            // (Preamble = 12.25 symbol)
                   (symbolTime * (8+ceil((8*(12+txLen)-4.0*mTermParam.Sf+44)/(4.0*(mTermParam.Sf-2)))*5)));

        sendTmo = MARGIN + (dataTime + ackTime) * (txConfig.retryCountAckFail + 1);
    }
    else
    {
        dataTime = (uint32_t)ceil((symbolTime * 12.25) +                            // (Preamble = 12.25 symbol)
                   (symbolTime * (8+ceil((8*(12+txLen)-4.0*mTermParam.Sf+44)/(4.0*(mTermParam.Sf-2)))*5)));

        sendTmo = MARGIN + dataTime;
    }

    /* Send operation */
    err = SMAC_TxPacket( gAppTxPacket, gAppTxPacket->smacHeader.totalLength );
    if( err != gErrorNoError_c )
    {
        return( err );
    }

    TMR_StartSingleShotTimer( WaitSendTmr, sendTmo, WaitSendTimerCallBack, NULL );

    LED_ToggleLed( LED2 );

    return( err );
}

/************************************************************************************
*
* ReceivePacketProcess
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void ReceivePacketProcess( void )
{
    uint16_t    nextId  = 0;
    uint16_t    result  = 0;
    int16_t     rssi    = 0;
#ifdef _STATIC_ROUTING_
    uint8_t     length  = 0;
#endif


    /* waiting for ack */
    if( gSendingType )
    {
        return;
    }

    LED_ToggleLed( LED1 );

    /* check packet destination */
    result = CheckRouteInfo( gAppRxPacket, &nextId );
    if( 0 == result )
    {
        /* to own node */
        if( 0xffff == nextId )
        {
            Terminal_Print( "--> receive data info[" );
            Terminal_Print( "panid = " );  Terminal_PrintHex( (uint8_t*)&gAppRxPacket->smacHeader.panId_l, 2, 0 );
            Terminal_Print( ", srcid = " );  Terminal_PrintHex( (uint8_t*)&gAppRxPacket->smacHeader.srcAddr_l, 2, 0 );
            Terminal_Print( ", dstid = " );  Terminal_PrintHex( (uint8_t*)&gAppRxPacket->smacHeader.destAddr_l, 2, 0 );
#ifdef _STATIC_ROUTING_
            length = gAppRxPacket->smacHeader.totalLength - sizeof(USER_HEADER);
            Terminal_Print( ", length = " ); Terminal_PrintHex( (uint8_t*)&length, 1, 0 );
#else
            Terminal_Print( ", length = " ); Terminal_PrintHex( (uint8_t*)&gAppRxPacket->smacHeader.totalLength, 1, 0 );
#endif
            Terminal_Print( "]\r\n" );

            switch( gAppRxPacket->smacHeader.data_type )
            {
            case MSG_DATA:
                Debug_Print( "receive data packet\r\n" );

                SMAC_GetLastPktRssi( &rssi );
                ReceiveData( gAppRxPacket, rssi );

                /* ready to receive */
                SetRadioRxOnNoTimeOut();
                break;

            default:
                /* ready to receive */
                SetRadioRxOnNoTimeOut();
                break;
            }
        }
        /* to other node */
        else
        {
#ifdef _STATIC_ROUTING_
            /* routing packet */
            if( ROUTER == mTermParam.Node )
            {
                RoutingPacket( gAppRxPacket, nextId, ((gAppRxPacket->smacHeader.panId_h << 8) | gAppRxPacket->smacHeader.panId_l) );
            }
            /* packet drop because of coordinator or enddevice */
            else
            {
#endif
                /* ready to receive */
                SetRadioRxOnNoTimeOut();
#ifdef _STATIC_ROUTING_
            }
#endif
        }
    }
    /* packet drop because of unknown destination */
    else
    {
        Debug_Print( "packet drop because of unknown destination\r\n" );

        /* ready to receive */
        SetRadioRxOnNoTimeOut();
    }
}

/******************************************************************************
* CheckRouteInfo
*
* Interface assumptions:
*     pMsgIn          receive message
*     nextId          next node ID
*
* Return value:
*     0:success 1:failure
*
******************************************************************************/
static uint16_t CheckRouteInfo( rxPacket_t* pMsgIn, uint16_t* nextId )
{
#ifdef _STATIC_ROUTING_
    USER_HEADER*    header  = NULL;
#endif
    uint16_t        result  = 0;
    uint16_t        panId   = 0;
    uint16_t        dstAddr = 0;

#ifdef _STATIC_ROUTING_
    header = (USER_HEADER*)&gAppRxPacket->smacPdu.smacPdu[0];
#endif

    /* dstination node is own node */
    panId   = (uint16_t)((gAppRxPacket->smacHeader.panId_h << 8) | gAppRxPacket->smacHeader.panId_l);
    dstAddr = (uint16_t)((gAppRxPacket->smacHeader.destAddr_h << 8) | gAppRxPacket->smacHeader.destAddr_l);
    if( (panId == mTermParam.PanId) && (dstAddr == mTermParam.SrcId) )
    {
#ifdef _STATIC_ROUTING_
        switch( header->hop_cnt )
        {
        case 1:
            *nextId         = 0xffff;
            break;

        case 2:
            header->hop_cnt--;
            header->route1  = 0x0000;
            header->route2  = 0x0000;
            *nextId         = header->end_addr;
            break;

        case 3:
            header->hop_cnt--;
            header->route1  = header->route2;
            header->route2  = 0x0000;
            *nextId         = header->route1;
            break;

        default:
            result = 1;
            break;
        }
#else
        *nextId = 0xffff;
#endif
    }
    /* broadcast */
    else if( BROADCAST == dstAddr )
    {
        *nextId = 0xffff;
    }
    else
    {
        result  = 1;
    }

    return( result );
}

/************************************************************************************
*
* ReceiveData
*
* Interface assumptions:
*     pMsgIn          receive message
*     rssi            receive rssi
*
* Return value:
*     None
*
************************************************************************************/
static void ReceiveData( rxPacket_t* pMsgIn, int16_t rssi )
{
#ifdef _STATIC_ROUTING_
    USER_HEADER*    header  = NULL;


    header = (USER_HEADER*)&pMsgIn->smacPdu.smacPdu[0];
#endif
    uint8_t len;

    if( (MODE_ON == mTermParam.Rssi) && (MODE_ON == mTermParam.RcvId) )
    {
        len = pMsgIn->smacHeader.totalLength + 12;
    }
    else if( (MODE_ON == mTermParam.Rssi) && (MODE_OFF == mTermParam.RcvId) )
    {
        len = pMsgIn->smacHeader.totalLength + 4;
    }
    else if( (MODE_OFF == mTermParam.Rssi) && (MODE_ON == mTermParam.RcvId) )
    {
        len = pMsgIn->smacHeader.totalLength + 8;
    }
    else
    {
        len = pMsgIn->smacHeader.totalLength;
    }

    if( FMT_BINARY == mTermParam.Format )
    {
        Processor_PrintBin( &len, 1 );
    }

    if( MODE_ON == mTermParam.Rssi )
    {
        if( rssi < 0 )
        {
            Terminal_Print( "RSSI(-" );
            Terminal_PrintDec( -rssi );
        }
        else
        {
            Terminal_Print( "RSSI(" );
            Terminal_PrintDec( rssi );
        }

        Terminal_Print( "dBm):" );

        Processor_PrintHex( (uint8_t*)&rssi, 2, 0 );
    }

    if( MODE_ON == mTermParam.RcvId )
    {
        Terminal_Print( "PAN ID(" );
        Terminal_PrintHex( (uint8_t*)&pMsgIn->smacHeader.panId_l, 2, 0 );
        Terminal_Print( "):" );

        Terminal_Print( "Src ID(" );
        Terminal_PrintHex( (uint8_t*)&pMsgIn->smacHeader.srcAddr_l, 2, 0 );
        Terminal_Print( "):" );

#ifdef _STATIC_ROUTING_
        Terminal_Print( "End ID(" );
        Terminal_PrintHex( (uint8_t*)&header->ori_addr, 2, 0 );
        Terminal_Print( "):" );
#endif

        Processor_PrintHex( (uint8_t*)&pMsgIn->smacHeader.panId_l, 2, 0 );
        Processor_PrintHex( (uint8_t*)&pMsgIn->smacHeader.srcAddr_l, 2, 0 );
#ifdef _STATIC_ROUTING_
        Processor_PrintHex( (uint8_t*)&header->ori_addr, 2, 0 );
#endif
    }

    Terminal_Print( "Receive Data(" );
#ifdef _STATIC_ROUTING_
    Terminal_PrintBin( gAppRxPacket->smacPdu.smacPdu + sizeof(USER_HEADER), pMsgIn->smacHeader.totalLength - sizeof(USER_HEADER) );
    Terminal_Print( ")\r\n" );
    Processor_PrintBin( gAppRxPacket->smacPdu.smacPdu + sizeof(USER_HEADER), pMsgIn->smacHeader.totalLength - sizeof(USER_HEADER) );
    if( FMT_ASCII == mTermParam.Format )
    {
        Processor_Print( "\r\n" );
    }
#else
    Terminal_PrintBin( gAppRxPacket->smacPdu.smacPdu, pMsgIn->smacHeader.totalLength );
    Terminal_Print( ")\r\n" );
    Processor_PrintBin( gAppRxPacket->smacPdu.smacPdu, pMsgIn->smacHeader.totalLength );
    if( FMT_ASCII == mTermParam.Format )
    {
        Processor_Print( "\r\n" );
    }
#endif
}

#ifdef _STATIC_ROUTING_
/************************************************************************************
*
* RoutingPacket
*
* Interface assumptions:
*     pMsgIn          receive message
*     nextId          next node ID
*     nextPanId       next PAN ID
*
* Return value:
*     None
*
************************************************************************************/
static void RoutingPacket( rxPacket_t* pMsgIn, uint16_t nextId, uint16_t nextPanId )
{
    smacErrors_t    err = gErrorNoError_c;


    /* Copy data to be sent to packet */
    FLib_MemCpy( &gAppTxPacket->smacPdu.smacPdu[0], &pMsgIn->smacPdu.smacPdu[0], pMsgIn->smacHeader.totalLength );

    gAppTxPacket->smacHeader.totalLength = pMsgIn->smacHeader.totalLength;
    gAppTxPacket->smacHeader.data_type   = pMsgIn->smacHeader.data_type;

    /* replace header information */
    SMAC_SetPanID( mTermParam.PanId );
    SMAC_SetSrcAddress( mTermParam.SrcId );
    SMAC_FillHeader( &(gAppTxPacket->smacHeader), nextId );

    err = SendPacket( pMsgIn->smacPdu.smacPdu, 0 );
    if( err == gErrorNoError_c )
    {
        /* set sending packet type */
        gSendingType = (gAppTxPacket->smacHeader.data_type | IS_ROUTING);
    }
    else
    {
        Terminal_Print( "routing failed\r\n" );

        /* ready to receive */
        SetRadioRxOnNoTimeOut();
    }
}
#endif

/************************************************************************************
*
* SendDoneProcess
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void SendDoneProcess( void )
{
    uint8_t len = 6;

    TMR_StopTimer( WaitSendTmr );

    /* send failed */
    if( TRUE == bCCAFailed )
    {
        Terminal_Print( "Send Failed\r\n" );
        bCCAFailed = FALSE;

        if( !(gSendingType & IS_ROUTING) )
        {
        	if( FMT_ASCII == mTermParam.Format )
        	{
                Processor_Print( "NG 104\r\n" );
            }
            else
            {
                Processor_PrintBin( &len, 1 );
                Processor_Print( "NG 104" );
            }
        }
    }
    else if( TRUE == bAckFailed )
    {
        Terminal_Print( "Ack Timeout\r\n" );
        bAckFailed = FALSE;

        if( !(gSendingType & IS_ROUTING) )
        {
        	if( FMT_ASCII == mTermParam.Format )
        	{
                Processor_Print( "NG 103\r\n" );
            }
            else
            {
                Processor_PrintBin( &len, 1 );
                Processor_Print( "NG 103" );
            }
        }
    }
    else
    {
        len = 2;

        if( !(gSendingType & IS_ROUTING) )
        {
        	if( FMT_ASCII == mTermParam.Format )
        	{
                Processor_Print( "OK\r\n" );
            }
            else
            {
                Processor_PrintBin( &len, 1 );
                Processor_Print( "OK" );
            }
        }
    }

    if( TIMER_WAKEUP == mTermParam.Sleep )
    {
        gEnterIdle  = TRUE;
    }

    gSendingType    = 0;

    /* ready to data receive */
    SetRadioRxOnNoTimeOut();
}

/************************************************************************************
*
* SleepProcess
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void SleepProcess( void )
{
    int mode = 0;


    /* Check and if possible allow device to enter sleep mode */
    if( (END_DEVICE == mTermParam.Node) && (TRUE == gEnterIdle) )
    {
        if( TIMER_WAKEUP == mTermParam.Sleep )
        {
            Terminal_Print( "enter timer sleep mode\r\n" );
        }
        else if( INT_WAKEUP == mTermParam.Sleep )
        {
            Terminal_Print( "enter interrupt sleep mode\r\n" );
        }

        if( (TIMER_WAKEUP == mTermParam.Sleep) || (INT_WAKEUP == mTermParam.Sleep) )
        {
            LED_TurnOffLed( LED_ALL );

            /* RF sleep */
            fei_fbi( 4194304, 1 );
            fbi_blpi( 4194304, 1 );

            SMAC_SetOpMode( 0 );    // sleep
        }

        if( TIMER_WAKEUP == mTermParam.Sleep )
        {
            if( 2048 < mTermParam.SleepTime )
            {
                mode = DIV_2048;
            }
            else if( 512 < mTermParam.SleepTime )
            {
                mode = DIV_512;
            }
            else
            {
                mode = DIV_0;
            }

            LPTMR_init( mTermParam.SleepTime, mode, 1 );

            /* SPI NSS LO */
            GPIOD_PCOR |= (uint32_t)(1<<4);

            enter_lls();
        }
        else if( INT_WAKEUP == mTermParam.Sleep )
        {
            /* SPI NSS LO */
            GPIOD_PCOR |= (uint32_t)(1<<4);

            enter_lls();
        }

        if( (TIMER_WAKEUP == mTermParam.Sleep) || (INT_WAKEUP == mTermParam.Sleep) )
        {
            /* SPI NSS HI */
            GPIOD_PSOR |= (uint32_t)(1<<4);

            SMAC_SetOpMode( 1 );    // standby

            blpi_fbi( 32768, 0 );
            fbi_fei( 32768 );

            /* ready to receive */
            SetRadioRxOnNoTimeOut();
        }

        gEnterIdle = FALSE;

        TMR_StopTimer( WaitSendTmr );

        gSendingType = 0;

        if( TIMER_WAKEUP == mTermParam.Sleep )
        {
            Terminal_Print( "exit timer sleep mode\r\n" );

            if( 0 != mTermParam.SendTime )
            {
              //FLib_MemCpy( SendDataBuffer, mTermParam.SendData, strlen((char*)mTermParam.SendData) );
              
              uint32_t val=0;
              uint8_t send_data[3];
              
              ADC16_ReInit();
              TriggerADC(2);
              val = ReadADCPoll();
              
              send_data[0] = val & 0x000000ff;
              send_data[1] =(val & 0x0000ff00)>>4;
              send_data[2] =(val & 0x00ff0000)>>6;
              
              Terminal_PrintHex(send_data,3,0);
              Terminal_Print( "\r\n" );
              
              FLib_MemCpy( SendDataBuffer, send_data , strlen((char*)send_data) );
              SendPacketProcess( strlen((char*)send_data) );
              //SendPacketProcess( strlen((char*)mTermParam.SendData) );
                
               
            }
        }
        else if( INT_WAKEUP == mTermParam.Sleep )
        {
            Terminal_Print( "exit interrupt sleep mode\r\n" );
        }
    }
}

/************************************************************************************
*
* SetRadioRxOnNoTimeOut
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
void SetRadioRxOnNoTimeOut( void )
{
	gAppRxPacket->smacHeader.totalLength = 0xFF;

    SMAC_RxStart( gAppRxPacket );
}


/************************************************************************************
* User's Callbacks
************************************************************************************/

/************************************************************************************
*
* IntervalTimerCallBack
*
* Interface assumptions:
*     param       timer ID
*
* Return value:
*     None
*
************************************************************************************/
static void IntervalTimerCallBack( void* param )
{
    osSignalSet( myAppId, EVENT_WDT_RESET );
}

/************************************************************************************
*
* WaitSendTimerCallBack
*
* Interface assumptions:
*     param       timer ID
*
* Return value:
*     None
*
************************************************************************************/
void WaitSendTimerCallBack( void* param )
{
    bCCAFailed = TRUE;
    osSignalSet( myAppId, EVENT_MCPS_CNF );
}

/************************************************************************************
*
* SendTimeTimerCallBack
*
* Interface assumptions:
*     param       timer ID
*
* Return value:
*     None
*
************************************************************************************/
void SendTimeTimerCallBack( void* param )
{
    osSignalSet( myAppId, EVENT_SEND_TIME );
}

/************************************************************************************
*
* Switch_Interrupt
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
void Switch_Interrupt( void* param )
{
    if( PORTC_PCR1 & PORT_PCR_ISF_MASK )
    {
        PORTC_PCR1 |= PORT_PCR_ISF_MASK ;

        if( INT_WAKEUP == mTermParam.Sleep )
        {
            gEnterIdle  = TRUE;

            osSignalSet( myAppId, EVENT_WUSELF );
        }
    }
}

/************************************************************************************
*
* smacToAppHandler
*     Sap handler for managing data confirm and data indication
*
* Interface assumptions:
*     type      indication or confirm
*     status
*
* Return value:
*     smacErrors_t
*
************************************************************************************/
smacErrors_t smacToAppHandler( uint8_t type, uint8_t status )
{
    switch( type )
    {
   	/* indication */
    case 0:
        if( 0 == status )
        {
            osSignalSet( myAppId, EVENT_MCPS_IND );
        }
        break;

	/* confirm */
    case 1:
        /* no ack */
        if( 1 == status )
        {
            bAckFailed = TRUE;
        }
        osSignalSet( myAppId, EVENT_MCPS_CNF );
        break;

    default:
        break;
    }

    return( gErrorNoError_c );
}
