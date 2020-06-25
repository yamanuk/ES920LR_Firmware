/*****************************************************************************
* cca header file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#ifndef __SMAC_H__
#define __SMAC_H__

#include "EmbeddedTypes.h"
#include "cmsis_os.h"

#define gMaxRetriesAllowed_c    ( 10 )
#define gSmacBuffersSize_c      ( 128 )

extern const uint32_t gDataRate[10][6];

typedef enum smacErrors_tag
{
    gErrorNoError_c = 0,
    gErrorBusy_c,
    gErrorChannelBusy_c,
    gErrorNoAck_c,
    gErrorOutOfRange_c,
    gErrorNoResourcesAvailable_c,
    gErrorNoValidCondition_c,
    gErrorCorrupted_c,
    gErrorMaxError_c
} smacErrors_t;

typedef enum bandWidth_tag
{
    BANDWIDTH7_8    = 0,
    BANDWIDTH10_4,
    BANDWIDTH15_6,
    BANDWIDTH20_8,
    BANDWIDTH31_25,
    BANDWIDTH41_7,
    BANDWIDTH62_5,
    BANDWIDTH125,
    BANDWIDTH250,
    BANDWIDTH500
} bandWidth;

typedef struct txContextConfig_tag
{
    bool_t      ccaBeforeTx;
    bool_t      autoAck;
    uint8_t     retryCountCCAFail;
    uint8_t     retryCountAckFail;
} txContextConfig_t;

typedef struct smacPdu_tag
{
    uint8_t     smacPdu[1];
} smacPdu_t;

typedef struct smacHeader_tag
{
    uint8_t     totalLength;
    uint8_t     frameControl;
    uint8_t     data_type;
    uint8_t     seqNo;
    uint8_t     panId_l;
    uint8_t     panId_h;
    uint8_t     destAddr_l;
    uint8_t     destAddr_h;
    uint8_t     srcAddr_l;
    uint8_t     srcAddr_h;
} smacHeader_t;

typedef struct txPacket_tag
{
    smacHeader_t  smacHeader;
    smacPdu_t     smacPdu;
} txPacket_t;

typedef struct rxPacket_tag
{
    smacHeader_t  smacHeader;
    smacPdu_t     smacPdu;
} rxPacket_t;

typedef smacErrors_t (*SMAC_APP_Handler_t)(uint8_t, uint8_t);

void SMAC_Init( void );
smacErrors_t SMAC_RxStart( rxPacket_t* data );
smacErrors_t SMAC_TxPacket( txPacket_t* data, uint8_t length );
smacErrors_t SMAC_ConfigureTxContext( txContextConfig_t* pTxConfig );
smacErrors_t SMAC_RegisterHandler( SMAC_APP_Handler_t smacToAppHandler );
smacErrors_t SMAC_FillHeader( smacHeader_t* pHeader, uint16_t destAddr );
smacErrors_t SMAC_SetSrcAddress( uint16_t srcAddr );
smacErrors_t SMAC_SetPanID( uint16_t panID );
smacErrors_t SMAC_SetOpMode( uint8_t opMode );
smacErrors_t SMAC_SetChannel( uint8_t ch, uint8_t bw );
smacErrors_t SMAC_GetChannel( uint8_t* ch, uint8_t* bw );
smacErrors_t SMAC_SetRFPower( int8_t power );
smacErrors_t SMAC_GetRFPower( int8_t* power );
smacErrors_t SMAC_GetLastPktRssi( int16_t* rssi );
smacErrors_t SMAC_GetRssi( int16_t* rssi );
smacErrors_t SMAC_SetCodingRate( uint8_t cr );
smacErrors_t SMAC_GetCodingRate( uint8_t* cr );
smacErrors_t SMAC_SetSpreadingFactor( uint8_t sf );
smacErrors_t SMAC_GetSpreadingFactor( uint8_t* sf );
smacErrors_t SMAC_SetContinuous( uint8_t enable );
float SMAC_GetSymbolTime( uint8_t bw, uint8_t sf );

#endif	//__SMAC_H__
