/************************************************************************************
* main header file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
************************************************************************************/
#ifndef _MAIN_H_
#define _MAIN_H_

#include "SerialManager.h"
#include "menus.h"
#include "message.h"

#ifdef __cplusplus
    extern "C" {
#endif


/************************************************************************************
*************************************************************************************
* Public macros
*************************************************************************************
************************************************************************************/

#define MODE_ON                  1
#define MODE_OFF                 2

#define COORDINATOR              1
#define END_DEVICE               2
#define ROUTER                   3

#define CONFIG                   1
#define OPERATION                2

#define TERMINAL                 1
#define PROCESSOR                2

#define NO_SLEEP                 1
#define TIMER_WAKEUP             2
#define INT_WAKEUP               3

#define TRANS_PAYLOAD            1
#define TRANS_FRAME              2

#define FMT_ASCII                1
#define FMT_BINARY               2

#define MAX_COMM_SIZE            256

#define MIN_HOP_COUNT            1
#define MAX_HOP_COUNT            3
#define MAX_RETRY_CNT            10
#define MAX_SLEEP_TIME           864000
#define MAX_SEND_TIME            86400

#define WDG_Refresh();           SIM_SRVCOP = 0x55; SIM_SRVCOP = 0xAA;

#define EVENT_UART_RX            (1<<0)
#define EVENT_MCPS_CNF           (1<<1)
#define EVENT_MCPS_IND           (1<<2)
#define EVENT_MLME_EDCNF         (1<<3)
#define EVENT_MLME_CCACNF        (1<<4)
#define EVENT_MLME_TIMEOUT       (1<<5)
#define EVENT_WDT_RESET          (1<<6)
#define EVENT_WUSELF             (1<<7)
#define EVENT_SEND_TIME          (1<<8)


/************************************************************************************
*************************************************************************************
* Public type definitions
*************************************************************************************
************************************************************************************/

typedef struct tagTERMINAL_PARAM
{
    uint8_t     Once[8];            /* write once */
    uint32_t    Baudrate;           /* baudrate   */
    uint32_t    SleepTime;          /* sleeptime  */
    int32_t     Power;              /* power      */
    uint32_t    SendTime;           /* sendtime   */
    uint8_t     SendData[52];       /* senddata   */
    uint32_t    rsv_1[13];
    uint16_t    Ack;                /* ack        */
    uint16_t    Bw;                 /* bw         */
    uint16_t    Channel;            /* channel    */
    uint16_t    DstId;              /* dstid      */
    uint16_t    EndId;              /* endid      */
    uint16_t    HopCnt;             /* hopcount   */
    uint16_t    Mode;               /* mode       */
    uint16_t    Node;               /* node       */
    uint16_t    Operation;          /* operation  */
    uint16_t    PanId;              /* panid      */
    uint16_t    RcvId;              /* rcvid      */
    uint16_t    Retry;              /* retry      */
    uint16_t    Route[2];           /* route      */
    uint16_t    Rssi;               /* rssi       */
    uint16_t    Sf;                 /* sf         */
    uint16_t    Sleep;              /* sleep      */
    uint16_t    SrcId;              /* srcid      */
    uint16_t    TransMode;          /* transmode  */
    uint16_t    Format;             /* format     */
} TERMINAL_PARAM;

extern TERMINAL_PARAM   mTermParam;
extern uint8_t          CommDataBuffer[MAX_COMM_SIZE];
extern uint8_t          SendDataBuffer[MAX_COMM_SIZE];
extern uint16_t         CommDataIndex;
extern bool_t           evDataFromUART;
extern bool_t           gEnterIdle;
extern tmrTimerID_t     IntervalTmr;
extern tmrTimerID_t     WaitSendTmr;
extern tmrTimerID_t     SendTimeTmr;
extern uint8_t          mAppSer;
extern osThreadId       myAppId;
extern tmrTimerID_t     UartCheckTmr;
extern uint8_t          SendDataLen;


/******************************************************************************
*******************************************************************************
* Public Prototypes
*******************************************************************************
******************************************************************************/

void Debug_Print( char* pString );
void Debug_PrintDec( uint32_t nr );
void Debug_PrintHex( uint8_t* hex, uint8_t len, uint8_t flags );
void Terminal_Print( char* pString );
void Terminal_PrintDec( uint32_t nr );
void Terminal_PrintHex( uint8_t* hex, uint8_t len, uint8_t flags );
void Terminal_PrintBin( uint8_t* data, uint8_t len );
void Processor_Print( char* pString );
void Processor_PrintDec( uint32_t nr );
void Processor_PrintHex( uint8_t* hex, uint8_t len, uint8_t flags );
void Processor_PrintBin( uint8_t* data, uint8_t len );
void SettingDefaultValue( void );

#ifdef __cplusplus
}
#endif

/**********************************************************************************/
#endif /* _MAIN_H_ */
