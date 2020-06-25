/************************************************************************************
* flash header file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
************************************************************************************/

#ifndef _FLASH_H_
#define _FLASH_H_

#include "MKL26Z4.h"
#include "EmbeddedTypes.h"


/* sector address */
#define FLASH_PARAM_TOP         0x1F000
#define FLASH_OFS_ONCE          0
#define FLASH_OFS_BAUDRATE      8
#define FLASH_OFS_SLEEPTIME     FLASH_OFS_BAUDRATE+4
#define FLASH_OFS_POWER         FLASH_OFS_SLEEPTIME+4
#define FLASH_OFS_SENDTIME      FLASH_OFS_POWER+4
#define FLASH_OFS_SENDDATA      FLASH_OFS_SENDTIME+4

#define FLASH_OFS_ACK           128
#define FLASH_OFS_BW            FLASH_OFS_ACK+2
#define FLASH_OFS_CHANNEL       FLASH_OFS_BW+2
#define FLASH_OFS_DSTID         FLASH_OFS_CHANNEL+2
#define FLASH_OFS_ENDID         FLASH_OFS_DSTID+2
#define FLASH_OFS_HOPCNT        FLASH_OFS_ENDID+2
#define FLASH_OFS_MODE          FLASH_OFS_HOPCNT+2
#define FLASH_OFS_NODE          FLASH_OFS_MODE+2
#define FLASH_OFS_OPERATION     FLASH_OFS_NODE+2
#define FLASH_OFS_PANID         FLASH_OFS_OPERATION+2
#define FLASH_OFS_RCVID         FLASH_OFS_PANID+2
#define FLASH_OFS_RETRY         FLASH_OFS_RCVID+2
#define FLASH_OFS_ROUTE1        FLASH_OFS_RETRY+2
#define FLASH_OFS_ROUTE2        FLASH_OFS_ROUTE1+2
#define FLASH_OFS_RSSI          FLASH_OFS_ROUTE2+2
#define FLASH_OFS_SF            FLASH_OFS_RSSI+2
#define FLASH_OFS_SLEEP         FLASH_OFS_SF+2
#define FLASH_OFS_SRCID         FLASH_OFS_SLEEP+2
#define FLASH_OFS_TRANSMODE     FLASH_OFS_SRCID+2
#define FLASH_OFS_FORMAT        FLASH_OFS_TRANSMODE+2

/* Flash hardware algorithm operation commands */
#define FLASH_PROGRAM_LONGWORD  0x06
#define FLASH_ERASE_SECTOR      0x09

#define FCCOB_REGS              12
#define FLASH_OK                0
#define FLASH_FAIL              1

#define ERASE_BLOCK_INDEX       4
#define PROGRAM_LONGWORD_INDEX  8

/* FCOOB register structure */
typedef union
{
    uint8_t all[FCCOB_REGS];
    struct
    {
        uint8_t fccob3;
        uint8_t fccob2;
        uint8_t fccob1;
        uint8_t fccob0;
        uint8_t fccob7;
        uint8_t fccob6;
        uint8_t fccob5;
        uint8_t fccob4;
        uint8_t fccobB;
        uint8_t fccobA;
        uint8_t fccob9;
        uint8_t fccob8;
    }regs;

    struct
    {
        uint32_t fccob3210;
        uint32_t fccob7654;
        uint32_t fccobBA98;
    }regsLong;
}FCC0B_STR;

/* API FUNCTION FOR FLASH DRIVER */
void  FLASH_Init( void );
uint32_t FLASH_EraseSector( uint32_t destination );
uint32_t FLASH_ProgramLongWord( uint32_t destination, uint32_t data );
uint32_t FLASH_ProgramSectionByLongs( uint32_t destination, uint32_t* pSource, uint32_t size );
uint16_t FLASH_ReadShortWord( uint32_t offset );
uint32_t FLASH_ReadLongWord( uint32_t offset );

#endif
