/*****************************************************************************
* flash_RamFunc file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#include "flash.h"

extern FCC0B_STR CommandObj;

/*****************************************************************************
* Function for executing of the flash command
*
*****************************************************************************/
uint32_t FLASH_FlashCommandSequenceStart( uint8_t index )
{
    uint8_t* ptrFccobReg   = (uint8_t*)&FTFA_FCCOB3;
    uint8_t* ptrCommandObj = (uint8_t*)&CommandObj;

    /* wait till CCIF bit is set */
    while( !(FTFA_FSTAT & FTFA_FSTAT_CCIF_MASK) );

    /* clear RDCOLERR & ACCERR & FPVIOL flag in flash status register */
    FTFA_FSTAT = FTFA_FSTAT_ACCERR_MASK | FTFA_FSTAT_FPVIOL_MASK | FTFA_FSTAT_RDCOLERR_MASK;

    /* load FCCOB registers */
    while( index-- )
    {
        *ptrFccobReg++ = *ptrCommandObj++;
    }

    /* launch a command */
    FTFA_FSTAT |= FTFA_FSTAT_CCIF_MASK;

    /* waiting for the finishing of the command */
    while( !(FTFA_FSTAT & FTFA_FSTAT_CCIF_MASK) );

    /* Check error bits */
    /* Get flash status register value */
    return( FTFA_FSTAT & (FTFA_FSTAT_ACCERR_MASK | FTFA_FSTAT_FPVIOL_MASK | FTFA_FSTAT_MGSTAT0_MASK) );
}
