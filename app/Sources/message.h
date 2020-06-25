/************************************************************************************
* message header file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
************************************************************************************/
#ifndef _MESSAGE_H_
#define _MESSAGE_H_

#ifdef __cplusplus
    extern "C" {
#endif

/************************************************************************************
*************************************************************************************
* Public macros
*************************************************************************************
************************************************************************************/
#define MSG_DATA                 0x01
#define MSG_ACK                  0x02
#define MSG_SCH                  0x03
#define MSG_SCA                  0x04
#define MSG_SET                  0x05
#define MSG_SEA                  0x06
#define MSG_BCN                  0x07
#define MSG_BCA                  0x08
#define MSG_RSP                  0x09

#ifdef _STATIC_ROUTING_
#define FRAME_HEAD               22
#else
#define FRAME_HEAD               8
#endif
#define BROADCAST                ( 0xFFFF )


/************************************************************************************
*************************************************************************************
* Public type definitions
*************************************************************************************
************************************************************************************/

#ifdef _STATIC_ROUTING_
typedef struct tagUSER_HEADER
{
    uint8_t     hop_cnt;            /* hop count         */
    uint8_t     reserved;           /* reserved          */
    uint16_t    route1;             /* route address 1   */
    uint16_t    route2;             /* route address 2   */
    uint16_t    end_addr;           /* end address       */
    uint16_t    ori_addr;           /* original address  */
} USER_HEADER;
#endif

/************************************************************************************
*************************************************************************************
* Public memory declarations
*************************************************************************************
************************************************************************************/
extern txPacket_t*  gAppTxPacket;
extern rxPacket_t*  gAppRxPacket;
extern uint8_t      gSendingType;

/******************************************************************************
*******************************************************************************
* Public Prototypes
*******************************************************************************
******************************************************************************/

void DoOperation( void );
void SetRadioRxOnNoTimeOut( void );
void Switch_Interrupt( void* );
smacErrors_t SendPacket( uint8_t*, uint8_t );
void WaitSendTimerCallBack ( void* );

#ifdef __cplusplus
}
#endif

/**********************************************************************************/
#endif /* _MESSAGE_H_ */
