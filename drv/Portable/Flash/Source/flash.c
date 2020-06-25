/*****************************************************************************
* flash file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#include "flash.h"

#if defined(__IAR_SYSTEMS_ICC__)
#pragma section = "codeRam"
#pragma location = "codeRam"

uint8_t buffer[128];

#pragma section = "default"
#pragma location = "default"
#elif defined(__GNUC__)
uint8_t buffer[256];
#endif

FCC0B_STR   CommandObj;

#define FLASH_FlashCommandSequence ((uint32_t (*)(uint8_t))&buffer[1])

/* internal driver function */
extern uint32_t FLASH_FlashCommandSequenceStart(uint8_t index);

/*****************************************************************************
* Init Function
*
*****************************************************************************/
void FLASH_Init( void )
{
    uint32_t i;
    volatile uint8_t* ptr_FlashCommandSequenceStart = ((uint8_t*)FLASH_FlashCommandSequenceStart - 1);

#if defined(__GNUC__)
	ptr_FlashCommandSequenceStart++;
#endif

    /* initialize pointer to ram function */
    /* copy function from ROM to RAM      */
#if defined(__IAR_SYSTEMS_ICC__)
    for( i = 0; i < 128; i++ )
#elif defined(__GNUC__)
	for( i = 0; i < 256; i++ )
#endif
    {
        buffer[i] =	*ptr_FlashCommandSequenceStart++;
    }
}

/*****************************************************************************
* Function for Programming of one Long Word
*
*****************************************************************************/
uint32_t FLASH_ProgramLongWord( uint32_t destination, uint32_t data32b )
{
    /* preparing passing parameter to program the flash block */
    CommandObj.regsLong.fccob3210 = destination;
    CommandObj.regs.fccob0        = FLASH_PROGRAM_LONGWORD;
    CommandObj.regsLong.fccob7654 = data32b;

    return( FLASH_FlashCommandSequence(PROGRAM_LONGWORD_INDEX) );
}

/*****************************************************************************
* Function for Programming of section by simple longs
*
*****************************************************************************/
uint32_t FLASH_ProgramSectionByLongs( uint32_t destination, uint32_t* pSource, uint32_t size )
{
    while( size-- )
    {
        if( FLASH_ProgramLongWord(destination, *pSource++) != FLASH_OK )
        {
            return( FLASH_FAIL );
        }
        destination += 4;
    }

    return( FLASH_OK );
}

/*****************************************************************************
* Function for erasing of flash memory sector
*
*****************************************************************************/
uint32_t FLASH_EraseSector( uint32_t destination )
{
    CommandObj.regsLong.fccob3210   = destination;
    CommandObj.regs.fccob0          = FLASH_ERASE_SECTOR;

    return( FLASH_FlashCommandSequence(ERASE_BLOCK_INDEX) );
}

/*****************************************************************************
* Function for Reading of one Short Word
*
*****************************************************************************/
uint16_t FLASH_ReadShortWord( uint32_t offset )
{
    return( *((uint16_t*)(FLASH_PARAM_TOP + offset)) );
}

/*****************************************************************************
* Function for Reading of one Long Word
*
*****************************************************************************/
uint32_t FLASH_ReadLongWord( uint32_t offset )
{
    return( *((uint32_t*)(FLASH_PARAM_TOP + offset)) );
}
