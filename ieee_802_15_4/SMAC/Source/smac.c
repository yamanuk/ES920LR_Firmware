/*****************************************************************************
* smac file.
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
#include "radio.h"
#include "sx1276.h"
#include "sx1276-Hal.h"
#include "sx1276-LoRa.h"
#include "sx1276-LoRaMisc.h"
#include "RNG_Interface.h"
#include "TimersManager.h"
#include "smac.h"
#include "cca.h"


#define  gSmacInstancesCnt_c     1
#define  gSmacTaskStackSize_c    700
#define  gSmacTaskPriority_c     osPriorityAboveNormal

const uint32_t gDataRate[10][6] = {
    {   342,   195,   110,     61,     34,     19 },   //   7.8  kHz
    {   455,   260,   147,     82,     45,     25 },   //  10.4  kHz
    {   683,   390,   220,    122,     68,     37 },   //  15.6  kHz
    {   910,   520,   293,    163,     90,     49 },   //  20.8  kHz
    {  1368,   782,   440,    245,    135,     74 },   //  31.25 kHz
    {  1825,  1043,   587,    326,    180,     98 },   //  41.7  kHz
    {  2735,  1563,   879,    489,    269,    147 },   //  62.5  kHz
    {  5469,  3125,  1758,    977,    538,    293 },   // 125    kHz
    { 10938,  6250,  3516,   1954,   1075,    586 },   // 250    kHz
    { 21875, 12500,  7032,   3907,   2149,   1172 }    // 500    kHz
};

const float gSymbolTime[10][6] = {
    { 16.41, 32.82, 65.64, 131.28, 262.56, 525.13 },   //   7.8  kHz
    { 12.31, 24.62, 49.23,  98.46, 196.92, 393.85 },   //  10.4  kHz
    {  8.21, 16.41, 32.82,  65.64, 131.28, 262.56 },   //  15.6  kHz
    {  6.15, 12.31, 24.62,  49.23,  98.46, 196.92 },   //  20.8  kHz
    {  4.10,  8.19, 16.38,  32.77,  65.54, 131.07 },   //  31.25 kHz
    {  3.07,  6.14, 12.28,  24.56,  49.11,  98.23 },   //  41.7  kHz
    {  2.05,  4.10,  8.19,  16.38,  32.77,  65.54 },   //  62.5  kHz
    {  1.02,  2.05,  4.10,   8.19,  16.38,  32.77 },   // 125    kHz
    {  0.51,  1.02,  2.05,   4.10,   8.19,  16.38 },   // 250    kHz
    {  0.26,  0.51,  1.02,   2.05,   4.10,   8.19 }    // 500    kHz
};

/*****************************************************************************
******************************************************************************
* Private function declarations
******************************************************************************
******************************************************************************/
static smacErrors_t Transmit( txPacket_t* data, uint8_t length );
static smacErrors_t RetryTransmit( txPacket_t* data, uint8_t length );
static smacErrors_t AckTransmit( uint8_t seqNo, uint16_t dstAddr );
static void Receive( void );
static void SmacTimerCallBack( void* );
static void DutyTimerCallBack( void* );
static void SmacRetryProcess( void );
static void SmacTask( void const * taskParam );

 #if defined(__GNUC__)
osThreadLink_t osThreadLink_SmacTask[gSmacInstancesCnt_c] = {0};
uint8_t osThread_SmacTask_stack[(gSmacTaskStackSize_c)*(gSmacInstancesCnt_c)];
uint8_t osThread_SmacTask_signal[36*(gSmacInstancesCnt_c)];
osThreadDef_t os_thread_def_SmacTask = { SmacTask,
                                         gSmacTaskPriority_c,
                                         gSmacInstancesCnt_c,
                                         gSmacTaskStackSize_c,
                                         osThread_SmacTask_stack,
                                         osThread_SmacTask_signal,
                                         osThreadLink_SmacTask,
                                         "SmacTask"};
#else
osThreadDef(SmacTask, gSmacTaskPriority_c, gSmacInstancesCnt_c, gSmacTaskStackSize_c);
#endif

/*****************************************************************************
******************************************************************************
* Private memory declarations
******************************************************************************
******************************************************************************/
static  txContextConfig_t   txConfigurator;
static  tRadioDriver*       Radio;
static  rxPacket_t*         rxBuffer;
static  bool_t              smacInitialized;
static  uint8_t             RetryCount;
static  uint8_t             TxSeqNum;
static  uint16_t            u16PanID;
static  uint16_t            u16SrcAddress;
static  uint8_t             lastSendSeqNo;
static  bool_t              isAck;
static  bool_t              isRetry;
static  bool_t              isAckFin;
static  bool_t              isDutyFin;
static  tmrTimerID_t        SmacTmr;
static  tmrTimerID_t        DutyTmr;
static  uint8_t             TxBuffer[RF_BUFFER_SIZE_MAX];
static  SMAC_APP_Handler_t  pHandler;
static  osThreadId          ThreadId;
static  uint8_t             setCh;
static  uint8_t             setBw;
static  uint8_t             setSf;
static  uint32_t            iAckTmo;


/*****************************************************************************
* SMAC_Init
*
* This function initialise SMAC.
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
******************************************************************************/
void SMAC_Init( void )
{
    uint32_t    u32RandomNo;

    smacInitialized = TRUE;
    RetryCount      = 0;
    u16PanID        = 0;
    u16SrcAddress   = 0;
    lastSendSeqNo   = 0;
    isAck           = FALSE;
    isRetry         = FALSE;
    isAckFin        = FALSE;
    isDutyFin       = FALSE;
    setCh           = 0;
    setBw           = 0;
    setSf           = 7;
    iAckTmo         = 0;

    Radio = RadioDriverInit();
    Radio->Init();

    RNG_Init();
    RNG_GetRandomNo( &u32RandomNo );
    TxSeqNum = (uint8_t)u32RandomNo;

    /* allocate SMAC timer */
    SmacTmr = TMR_AllocateTimer();
    DutyTmr = TMR_AllocateTimer();

    /* create thread */
    ThreadId = osThreadCreate( osThread(SmacTask), 0 );
}

/*****************************************************************************
* SMAC_RxStart
*
* This function transit the SX1276 to RFLR_STATE_RX_INIT state.
*
* Interface assumptions:
*     data          rx buffer pointer
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_RxStart( rxPacket_t* data )
{
    if( FALSE == smacInitialized )
    {
        return gErrorNoValidCondition_c;
    }

    if( NULL == data )
    {
        return gErrorOutOfRange_c;
    }

    rxBuffer = data;

	Radio->StartRx( );

    osSignalSet( ThreadId, 1 );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_TxPacket
*
* This function send packet.
*
* Interface assumptions:
*     data          tx buffer pointer
*     length        tx length (not include smac header)
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_TxPacket( txPacket_t *data, uint8_t length )
{
	return Transmit( data, length );
}

/*****************************************************************************
* SMAC_ConfigureTxContext
*
* This function is used to configure the conditions under which
* SMAC will perform a transmission.
*
* Interface assumptions:
*     pTxConfig     transmission parameter
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_ConfigureTxContext( txContextConfig_t* pTxConfig )
{
    if( ((pTxConfig->autoAck == FALSE) && (pTxConfig->retryCountAckFail != 0)) ||
        ((pTxConfig->ccaBeforeTx == FALSE) && (pTxConfig->retryCountCCAFail != 0)) )
    {
        return gErrorOutOfRange_c;
    }

    if( (pTxConfig->retryCountAckFail > gMaxRetriesAllowed_c) ||
        (pTxConfig->retryCountCCAFail > gMaxRetriesAllowed_c) )
    {
        return gErrorOutOfRange_c;
    }

    txConfigurator.autoAck           = pTxConfig->autoAck;
    txConfigurator.ccaBeforeTx       = pTxConfig->ccaBeforeTx;
    txConfigurator.retryCountAckFail = pTxConfig->retryCountAckFail;
    txConfigurator.retryCountCCAFail = pTxConfig->retryCountCCAFail;

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_RegisterHandler
*
* This function is used to configure the conditions under which
* SMAC will perform a transmission.
*
* Interface assumptions:
*     smacToAppHandler  callback function address
*
* Return value:
*     smacErrors_t      gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_RegisterHandler( SMAC_APP_Handler_t smacToAppHandler )
{
    pHandler = smacToAppHandler;

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_FillHeader
*
* This function helps the user fill the SMAC header with
* the desired short destination address.
*
* Interface assumptions:
*     pHeader       tx buffer pointer
*     destAddr      short destination address
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_FillHeader( smacHeader_t* pHeader, uint16_t destAddr )
{
    pHeader->frameControl   = 0x00;
    pHeader->seqNo          = 0;
    pHeader->panId_l        = (uint8_t)(u16PanID & 0xFF);
    pHeader->panId_h        = (uint8_t)((u16PanID >> 8) & 0xFF);
    pHeader->destAddr_l     = (uint8_t)(destAddr & 0xFF);
    pHeader->destAddr_h     = (uint8_t)((destAddr >> 8) & 0xFF);
    pHeader->srcAddr_l      = (uint8_t)(u16SrcAddress & 0xFF);
    pHeader->srcAddr_h      = (uint8_t)((u16SrcAddress >> 8) & 0xFF);

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_SetSrcAddress
*
* This function sets the short source address so that PHY can perform filtering
*
* Interface assumptions:
*     srcAddr       short source address
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_SetSrcAddress( uint16_t srcAddr )
{
    u16SrcAddress = srcAddr;

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_SetPanID
*
* This function sets the pan ID so that PHY can perform filtering
*
* Interface assumptions:
*     panID         pan ID
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_SetPanID( uint16_t panID )
{
    u16PanID = panID;

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_SetOpMode
*
* This function transit the SX1276 to any state.
*
* Interface assumptions:
*     opMode        new state
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_SetOpMode( uint8_t opMode )
{
    /* sleep or standby */
    if( 1 < opMode )
    {
        return gErrorOutOfRange_c;
    }

    SX1276SetOpMode( opMode );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_SetChannel
*
* This function sets to SX1276 register.
* Call SX1276LoRaSetRFFrequency and SX1276LoRaSetSignalBandwidth function.
*
* Interface assumptions:
*     ch            channel number ( ch0 = 920600000Hz )
*     bw            band width
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_SetChannel( uint8_t ch, uint8_t bw )
{
    uint32_t    RFFrequency;

    switch( bw )
    {
    case BANDWIDTH7_8:
    case BANDWIDTH10_4:
    case BANDWIDTH15_6:
    case BANDWIDTH20_8:
    case BANDWIDTH31_25:
    case BANDWIDTH41_7:
    case BANDWIDTH62_5:
    case BANDWIDTH125:
        if( 37 <= ch )
        {
            return gErrorOutOfRange_c;
        }
        RFFrequency = 920600000 + (200000 * ch);
        break;

    case BANDWIDTH250:
        if( 18 <= ch )
        {
            return gErrorOutOfRange_c;
        }
        RFFrequency = 920700000 + (400000 * ch);
        break;

    case BANDWIDTH500:
        if( 12 <= ch )
        {
            return gErrorOutOfRange_c;
        }
        RFFrequency = 920800000 + (600000 * ch);
        break;

    default:
        return gErrorOutOfRange_c;
    }

    SX1276LoRaSetRFFrequency( RFFrequency );
    SX1276LoRaSetSignalBandwidth( bw );

    setCh = ch;
    setBw = bw;

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_GetChannel
*
* This function gets from SX1276 register.
* Call SX1276LoRaGetRFFrequency and SX1276LoRaGetSignalBandwidth function.
*
* Interface assumptions:
*     ch            channel number ( ch0 = 920600000Hz )
*     bw            band width
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_GetChannel( uint8_t* ch, uint8_t* bw )
{
    uint32_t    RFFrequency;


    RFFrequency = SX1276LoRaGetRFFrequency( );
    *bw         = SX1276LoRaGetSignalBandwidth( );

    switch( *bw )
    {
    case BANDWIDTH7_8:
    case BANDWIDTH10_4:
    case BANDWIDTH15_6:
    case BANDWIDTH20_8:
    case BANDWIDTH31_25:
    case BANDWIDTH41_7:
    case BANDWIDTH62_5:
    case BANDWIDTH125:
        if( (RFFrequency - 920600000) % 200000 )
        {
            *ch = (200000 + RFFrequency - 920600000) / 200000;
        }
        else
        {
            *ch = (RFFrequency - 920600000) / 200000;
        }
        break;

    case BANDWIDTH250:
        if( (RFFrequency - 920700000) % 400000 )
        {
            *ch = (400000 + RFFrequency - 920700000) / 400000;
        }
        else
        {
            *ch = (RFFrequency - 920700000) / 400000;
        }
        break;

    case BANDWIDTH500:
        if( (RFFrequency - 920800000) % 600000 )
        {
            *ch = (600000 + RFFrequency - 920800000) / 600000;
        }
        else
        {
            *ch = (RFFrequency - 920800000) / 600000;
        }
        break;

    default:
        return gErrorOutOfRange_c;
    }

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_SetRFPower
*
* This function sets to SX1276 register.
* Call SX1276LoRaSetRFPower function.
*
* Interface assumptions:
*     power         output power value(dB)
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_SetRFPower( int8_t power )
{
    if( (power < -4) || (13 < power) )
    {
        return gErrorOutOfRange_c;
    }

    SX1276LoRaSetRFPower( power );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_GetRFPower
*
* This function gets from SX1276 register.
* Call SX1276LoRaGetRFPower function.
*
* Interface assumptions:
*     power         output power value(dB)
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_GetRFPower( int8_t* power )
{
    *power = SX1276LoRaGetRFPower( );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_GetLastPktRssi
*
* This function gets from SX1276 register.
* Call SX1276GetPacketRssi function.
*
* Interface assumptions:
*     rssi          rssi value(dB)
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_GetLastPktRssi( int16_t* rssi )
{
    *rssi = (int16_t)SX1276GetPacketRssi( );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_GetRssi
*
* This function gets from SX1276 register.
* Call SX1276ReadRssi function.
*
* Interface assumptions:
*     rssi          rssi value(dB)
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_GetRssi( int16_t* rssi )
{
    *rssi = (int16_t)SX1276ReadRssi( );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_SetCodingRate
*
* This function sets to SX1276 register.
* Call SX1276LoRaSetErrorCoding function.
*
* Interface assumptions:
*     cr            coding rate
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_SetCodingRate( uint8_t cr )
{
    if( 4 < cr )
    {
        return gErrorOutOfRange_c;
    }

    SX1276LoRaSetErrorCoding( cr );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_GetCodingRate
*
* This function gets from SX1276 register.
* Call SX1276LoRaGetErrorCoding function.
*
* Interface assumptions:
*     cr            coding rate
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_GetCodingRate( uint8_t* cr )
{
    *cr = SX1276LoRaGetErrorCoding( );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_SetSpreadingFactor
*
* This function sets to SX1276 register.
* Call SX1276LoRaSetSpreadingFactor function.
*
* Interface assumptions:
*     sf            spreading factor
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_SetSpreadingFactor( uint8_t sf )
{
    if( 12 < sf )
    {
        return gErrorOutOfRange_c;
    }

    SX1276LoRaSetSpreadingFactor( sf );

    setSf = sf;

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_GetSpreadingFactor
*
* This function gets from SX1276 register.
* Call SX1276LoRaGetSpreadingFactor function.
*
* Interface assumptions:
*     sf            spreading factor
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_GetSpreadingFactor( uint8_t* sf )
{
    *sf = SX1276LoRaGetSpreadingFactor( );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_SetContinuous
*
* This function sets to SX1276 register.
* Call SX1276LoRaSetContinuous function.
*
* Interface assumptions:
*     cr            coding rate
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
smacErrors_t SMAC_SetContinuous( uint8_t enable )
{
    SX1276LoRaSetContinuous( enable );

    return gErrorNoError_c;
}

/*****************************************************************************
* SMAC_GetSymbolTime
*
* This function get SymbolTime.
*
* Interface assumptions:
*     bw            band width
*     sf            spreading factor
*
* Return value:
*     uint32_t      symbol time
*
******************************************************************************/
float SMAC_GetSymbolTime( uint8_t bw, uint8_t sf )
{
    return gSymbolTime[bw][sf-7];
}

/*****************************************************************************
* Transmit
*
* This function send packet.
*
* Interface assumptions:
*     data          tx buffer pointer
*     length        tx length (not include smac header)
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
static smacErrors_t Transmit( txPacket_t* data, uint8_t length )
{
	uint8_t       idx         = 0;
	uint8_t       status      = 0;
	uint16_t      checkSum    = 0;
    smacHeader_t* header      = NULL;
#if 0   // hardware cca
    uint32_t      cca_ret     = 0;
    uint32_t      cca_cnt     = 0;
#endif

    if( FALSE == smacInitialized )
    {
        return gErrorNoValidCondition_c;
    }

    if( NULL == data )
    {
        return gErrorOutOfRange_c;
    }

    RetryCount = 0;

    /* add SMAC header and checksum length */
    data->smacHeader.totalLength += (sizeof(smacHeader_t) + 2);

	/* copy data */
    memcpy( TxBuffer, data, data->smacHeader.totalLength );

    header = (smacHeader_t*)TxBuffer;

	if( TRUE == txConfigurator.autoAck )
    {
        if( (0xFF != header->destAddr_h) || (0xFF != header->destAddr_l) )
        {
            /* add ACK request flag */
            header->frameControl |= 0x80;
        }
    }

    /* set sequence number */
    header->seqNo = TxSeqNum;

    /* add checksum */
	checkSum = 0;
	for( idx = 0; idx < length; idx++ )
	{
		checkSum += TxBuffer[sizeof(smacHeader_t) + idx];
	}
	TxBuffer[sizeof(smacHeader_t) + length    ] = (checkSum >> 0) & 0xFF;
	TxBuffer[sizeof(smacHeader_t) + length + 1] = (checkSum >> 8) & 0xFF;

	/* execute carrier sense */
    status = 0;
    if( TRUE == txConfigurator.ccaBeforeTx )
    {
#if 0   // hardware cca
        for( cca_cnt = 0; cca_cnt < txConfigurator.retryCountCCAFail; cca_cnt++ )
        {
            cca_ret = SX1276LoRaCcaProcess();
            if( RF_CHANNEL_EMPTY == cca_ret )
            {
                status = 0;
                break;
            }
            else if( RF_CHANNEL_ACTIVITY_DETECTED == cca_ret )
            {
                status = 1;
            }
        }
#endif
        /* software cca */
        status = IsCcaOk( setCh, setBw, txConfigurator.retryCountCCAFail );
    }
	/* OK */
	if( 0 == status )
	{
		/* send data */
		Radio->SetTxPacket( TxBuffer, header->totalLength );

        osSignalSet( ThreadId, 1 );

        lastSendSeqNo = TxSeqNum++;
        isAck         = FALSE;
        iAckTmo       = 50 + (uint32_t)ceil(
                        (gSymbolTime[setBw][setSf-7] * 2.0) + (gSymbolTime[setBw][setSf-7] * 12.25) +    // (Preamble = 12.25 symbol)
                        (gSymbolTime[setBw][setSf-7] * (8+ceil((80-4.0*setSf+44)/(4.0*(setSf-2)))*5)));

		return gErrorNoError_c;
	}
	/* NG */
	else
	{
		return gErrorBusy_c;
	}
}

/*****************************************************************************
* RetryTransmit
*
* This function re-transmition packet.
*
* Interface assumptions:
*     data          tx buffer pointer
*     length        tx length (include smac header)
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
static smacErrors_t RetryTransmit( txPacket_t* data, uint8_t length )
{
	uint8_t       status      = 0;
#if 0   // hardware cca
    uint32_t      cca_ret     = 0;
    uint32_t      cca_cnt     = 0;
#endif

	/* execute carrier sense */
    status = 0;
    if( TRUE == txConfigurator.ccaBeforeTx )
    {
#if 0   // hardware cca
        for( cca_cnt = 0; cca_cnt < txConfigurator.retryCountCCAFail; cca_cnt++ )
        {
            cca_ret = SX1276LoRaCcaProcess();
            if( RF_CHANNEL_EMPTY == cca_ret )
            {
                status = 0;
                break;
            }
            else if( RF_CHANNEL_ACTIVITY_DETECTED == cca_ret )
            {
                status = 1;
            }
        }
#endif
        /* software cca */
        status = IsCcaOk( setCh, setBw, txConfigurator.retryCountCCAFail );
    }
	/* OK */
	if( 0 == status )
	{
		/* send data */
		Radio->SetTxPacket( data, data->smacHeader.totalLength );

        osSignalSet( ThreadId, 1 );

        isAck         = FALSE;
        iAckTmo       = 50 + (uint32_t)ceil(
                        (gSymbolTime[setBw][setSf-7] * 2.0) + (gSymbolTime[setBw][setSf-7] * 12.25) +    // (Preamble = 12.25 symbol)
                        (gSymbolTime[setBw][setSf-7] * (8+ceil((80-4.0*setSf+44)/(4.0*(setSf-2)))*5)));

		return gErrorNoError_c;
	}
	/* NG */
	else
	{
		return gErrorBusy_c;
	}
}

/*****************************************************************************
* AckTransmit
*
* This function transmit ack packet.
*
* Interface assumptions:
*     seqNo         recieve sequence number
*     dstAddr       recieve source address
*
* Return value:
*     smacErrors_t  gErrorNoError_c or other
*
******************************************************************************/
static smacErrors_t AckTransmit( uint8_t seqNo, uint16_t dstAddr )
{
    smacHeader_t* header      = NULL;
	uint8_t       status      = 0;
#if 0   // hardware cca
    uint32_t      cca_ret     = 0;
    uint32_t      cca_cnt     = 0;
#endif


    header = (smacHeader_t*)TxBuffer;

    /* make Ack packet */
    header->totalLength     = sizeof(smacHeader_t);
    header->frameControl    = 0;
    header->data_type       = 0;
    header->seqNo           = seqNo;
    header->panId_l         = (uint8_t)((u16PanID >> 0) & 0xFF);
    header->panId_h         = (uint8_t)((u16PanID >> 8) & 0xFF);
    header->destAddr_l      = (uint8_t)((dstAddr >> 0) & 0xFF);
    header->destAddr_h      = (uint8_t)((dstAddr >> 8) & 0xFF);
    header->srcAddr_l       = (uint8_t)((u16SrcAddress >> 0) & 0xFF);
    header->srcAddr_h       = (uint8_t)((u16SrcAddress >> 8) & 0xFF);

    status = 0;
    if( TRUE == txConfigurator.ccaBeforeTx )
    {
#if 0   // hardware cca
        for( cca_cnt = 0; cca_cnt < txConfigurator.retryCountCCAFail; cca_cnt++ )
        {
            cca_ret = SX1276LoRaCcaProcess();
            if( RF_CHANNEL_EMPTY == cca_ret )
            {
                status = 0;
                break;
            }
            else if( RF_CHANNEL_ACTIVITY_DETECTED == cca_ret )
            {
                status = 1;
            }
        }
#endif
        /* software cca */
        status = IsCcaOk( setCh, setBw, txConfigurator.retryCountCCAFail );
    }
	/* OK */
	if( 0 == status )
	{
        /* send data */
        Radio->SetTxPacket( TxBuffer, header->totalLength );

        osSignalSet( ThreadId, 1 );

        isAck = TRUE;

        return gErrorNoError_c;
    }
    /* NG */
	else
	{
		return gErrorBusy_c;
	}
}

/*****************************************************************************
* Receive
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
******************************************************************************/
static void Receive( void )
{
	uint16_t      idx;
	uint16_t      CalcCheckSum  = 0;
	uint16_t      RecvCheckSum  = 0;
    uint16_t      rxLength      = 0;
	uint8_t       getSize       = 0;
    smacHeader_t* header        = NULL;
    char*        pRcvBuf        = (char*)rxBuffer;


    if( FALSE == smacInitialized )
    {
        return;
    }

    /* get rx data */
    Radio->GetRxPacket( rxBuffer, &rxLength );

    header = (smacHeader_t*)rxBuffer;

    /* check header size */
    if( sizeof(smacHeader_t) <= rxLength )
    {
        if( header->totalLength < sizeof(smacHeader_t) )
        {
            return;
        }

        /* check PAN ID */
        if( ((header->panId_h << 8) | header->panId_l) != u16PanID )
        {
            return;
        }

        switch( header->data_type )
        {
        /* ACK */
        case 0:

            /* to Own Node */
            if( (TRUE == txConfigurator.autoAck) &&
                (((header->destAddr_h << 8) | header->destAddr_l) == u16SrcAddress) &&
                (header->seqNo == lastSendSeqNo) )
            {
                TMR_StopTimer( SmacTmr );

                isAckFin = TRUE;
            }
            break;

		/* DATA */
        default:

            /* submit checksum length */
            getSize = header->totalLength - 2;

            /* check checksum */
            RecvCheckSum = (uint16_t)(pRcvBuf[getSize] | (pRcvBuf[getSize+1] << 8));
            CalcCheckSum = 0;
            for( idx = sizeof(smacHeader_t); idx < getSize; idx++ )
            {
                CalcCheckSum += pRcvBuf[idx];
            }
            if( CalcCheckSum != RecvCheckSum )
            {
                /* Checksum Error */
                break;
            }

            /* to Own Node */
            if( ((header->destAddr_h << 8) | header->destAddr_l) == u16SrcAddress )
            {
                /* required acknowledge */
                if( header->frameControl & 0x80 )
                {
                    AckTransmit( header->seqNo, ((header->srcAddr_h << 8) | header->srcAddr_l) );
                }
                /* not required acknowledge */
                else
                {
                    header->totalLength -= (sizeof(smacHeader_t) + 2);

                    pHandler( 0, 0 );
                }
            }
            /* Broadcast */
            else if( ((header->destAddr_h << 8) | header->destAddr_l) == 0xFFFF )
            {
                header->totalLength -= (sizeof(smacHeader_t) + 2);

                pHandler( 0, 0 );
            }
            break;
        }
    }
}

/*****************************************************************************
* SmacTimerCallBack
*
* Interface assumptions:
*     param
*
* Return value:
*     None
*
******************************************************************************/
static void SmacTimerCallBack( void* param )
{
    isRetry = TRUE;
}

/*****************************************************************************
* DutyTimerCallBack
*
* Interface assumptions:
*     param
*
* Return value:
*     None
*
******************************************************************************/
static void DutyTimerCallBack( void* param )
{
    isDutyFin = TRUE;
}

/*****************************************************************************
* SmacRetryProcess
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
******************************************************************************/
static void SmacRetryProcess( void )
{
    smacErrors_t    err;
    smacHeader_t*   header = NULL;


    RetryCount++;
    if( RetryCount <= txConfigurator.retryCountAckFail )
    {
        header = (smacHeader_t*)TxBuffer;

        /* packet send retry */
        err = RetryTransmit( (txPacket_t*)TxBuffer, header->totalLength );
        if( gErrorNoError_c != err )
        {
            /* call back */
            pHandler( 1, 1 );
        }
    }
    else
    {
        /* call back */
        pHandler( 1, 1 );
    }
}

/*****************************************************************************
* SmacTask
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
******************************************************************************/
static void SmacTask( void const * taskParam )
{
    uint32_t        iRet;
    smacHeader_t*   header = NULL;


    while( 1 )
    {
        osSignalWait( 0, 1 );

        iRet = Radio->Process();

        switch( iRet )
        {
        case RF_RX_DONE:

            /* receive data process */
            Receive();
            break;

        case RF_TX_DONE:

            /* last send packet is ack */
            if( TRUE == isAck )
            {
                header = (smacHeader_t*)rxBuffer;

                header->totalLength -= (sizeof(smacHeader_t) + 2);

                pHandler( 0, 0 );
            }
            /* last send packet is data */
            else
            {
                header = (smacHeader_t*)TxBuffer;
                if( header->frameControl & 0x80 )
                {
                    Radio->StartRx( );

                    osSignalSet( ThreadId, 1 );

                    TMR_StartSingleShotTimer( SmacTmr, iAckTmo, SmacTimerCallBack, NULL );
                }
                else
                {
                    isAckFin = TRUE;
                }

                TMR_StartSingleShotTimer( DutyTmr, 50, DutyTimerCallBack, NULL );
            }
            break;

        default:
            break;
        }

        /* send done */
        if( (TRUE == isAckFin) && (TRUE == isDutyFin) )
        {
            isAckFin    = FALSE;
            isDutyFin   = FALSE;

            pHandler( 1, 0 );
        }

        /* retry send */
        if( (TRUE == isRetry) && (TRUE == isDutyFin) )
        {
            isRetry     = FALSE;
            isDutyFin   = FALSE;

            SmacRetryProcess();
        }
    }
}
