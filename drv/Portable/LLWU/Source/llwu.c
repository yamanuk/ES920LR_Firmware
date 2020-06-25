/*****************************************************************************
* llwu file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#include "llwu.h"
#include "cmsis_os.h"

extern int re_init_clk;
extern int clock_freq_hz;


/************************************************************************************
*
*   function: llwu_configure
*
*   description: Set up the LLWU for wakeup the MCU from LLS and VLLSx modes
*   from the selected pin or module.
*
*   inputs:
*   pin_en - unsigned integer, bit position indicates the pin is enabled.
*            More than one bit can be set to enable more than one pin at a time.
*
*   rise_fall - 0x00 = External input disabled as wakeup
*               0x01 - External input enabled as rising edge detection
*               0x02 - External input enabled as falling edge detection
*               0x03 - External input enablge as any edge detection
*   module_en - unsigned char, bit position indicates the module is enabled.
*               More than one bit can be set to enabled more than one module
*
*   for example:  if bit 0 and 1 need to be enabled as rising edge detect call this  routine with
*   pin_en = 0x0003 and rise_fall = 0x02
*
*   Note: to set up one set of pins for rising and another for falling, 2 calls to this
*         function are required, 1st for rising then the second for falling.
*
************************************************************************************/
void llwu_configure( unsigned int pin_en, unsigned char rise_fall, unsigned char module_en )
{
    uint8_t temp;


    osInstallIsr(INT_LLW, LLW_IRQHandler, NULL);

    NVIC_ICPR |= 1 << ((INT_LLW-16)%32);
    NVIC_ISER |= 1 << ((INT_LLW-16)%32);

    temp = LLWU_PE1;
    if( pin_en & 0x0001 )
    {
        ;
    }
    if( pin_en & 0x0002 )
    {
        ;
    }
    if( pin_en & 0x0004 )
    {
        ;
    }
    if( pin_en & 0x0008 )
    {
        ;
    }
    LLWU_PE1 = temp;

    temp = LLWU_PE2;
    if( pin_en & 0x0010 )
    {
        ;
    }
    if( pin_en & 0x0020 )
    {
        temp |= LLWU_PE2_WUPE5(rise_fall);
        LLWU_F1 |= LLWU_F1_WUF5_MASK;   // write one to clear the flag
    }
    if( pin_en & 0x0040 )
    {
        temp |= LLWU_PE2_WUPE6(rise_fall);
        LLWU_F1 |= LLWU_F1_WUF6_MASK;   // write one to clear the flag
    }
    if( pin_en & 0x0080 )
    {
        temp |= LLWU_PE2_WUPE7(rise_fall);
        LLWU_F1 |= LLWU_F1_WUF7_MASK;   // write one to clear the flag
    }
    LLWU_PE2 = temp;

    temp = LLWU_PE3;
    if( pin_en & 0x0100 )
    {
        temp |= LLWU_PE3_WUPE8(rise_fall);
        LLWU_F2 |= LLWU_F2_WUF8_MASK;   // write one to clear the flag
    }
    if( pin_en & 0x0200 )
    {
        temp |= LLWU_PE3_WUPE9(rise_fall);
        LLWU_F2 |= LLWU_F2_WUF9_MASK;   // write one to clear the flag
    }
    if( pin_en & 0x0400 )
    {
        temp |= LLWU_PE3_WUPE10(rise_fall);
        LLWU_F2 |= LLWU_F2_WUF10_MASK;   // write one to clear the flag
    }
    if( pin_en & 0x0800 )
    {
        temp |= LLWU_PE3_WUPE11(rise_fall);
        LLWU_F2 |= LLWU_F2_WUF11_MASK;   // write one to clear the flag
    }
    LLWU_PE3 = temp;

    temp = LLWU_PE4;
    if( pin_en & 0x1000 )
    {
        temp |= LLWU_PE4_WUPE12(rise_fall);
        LLWU_F2 |= LLWU_F2_WUF12_MASK;   // write one to clear the flag
    }
    if( pin_en & 0x2000 )
    {
        temp |= LLWU_PE4_WUPE13(rise_fall);
        LLWU_F2 |= LLWU_F2_WUF13_MASK;   // write one to clear the flag
    }
    if( pin_en & 0x4000 )
    {
        temp |= LLWU_PE4_WUPE14(rise_fall);
        LLWU_F2 |= LLWU_F2_WUF14_MASK;   // write one to clear the flag
    }
    if( pin_en & 0x8000 )
    {
        temp |= LLWU_PE4_WUPE15(rise_fall);
        LLWU_F2 |= LLWU_F2_WUF15_MASK;   // write one to clear the flag
    }
    LLWU_PE4 = temp;

    if( module_en == 0 )
    {
        LLWU_ME = 0;
    }
    else
    {
        LLWU_ME |= module_en;  //Set up more modules to wakeup up
    }
}

/************************************************************************************
*
* llwu_configure_filter
*
************************************************************************************/
void llwu_configure_filter( unsigned int wu_pin_num, unsigned char filter_en, unsigned char rise_fall )
{
    /* wu_pin_num is the pin number to be written to FILTSEL.  wu_pin_num is not the same as pin_en. */
    uint8_t temp;


    temp = 0;

    /* first clear filter values and clear flag by writing a 1 */
    LLWU_FILT1 = LLWU_FILT1_FILTF_MASK;
    LLWU_FILT2 = LLWU_FILT2_FILTF_MASK;

    if(filter_en == 1)
    {
        /*clear the flag bit and set the others */
        temp |= (LLWU_FILT1_FILTF_MASK) | (LLWU_FILT1_FILTE(rise_fall) | LLWU_FILT1_FILTSEL(wu_pin_num));
        LLWU_FILT1 = temp;
    }
    else if (filter_en == 2)
    {
        /* clear the flag bit and set the others */
        temp |= (LLWU_FILT2_FILTF_MASK) | (LLWU_FILT2_FILTE(rise_fall) | LLWU_FILT2_FILTSEL(wu_pin_num));
        LLWU_FILT2 = temp;
    }
    else
    {
        ;
    }
}

/************************************************************************************
*
* Interrupt handler for LLWU
*
************************************************************************************/
void LLW_IRQHandler( void *param )
{
    if (LLWU_F1 & LLWU_F1_WUF5_MASK)
    {
        LLWU_F1 |= LLWU_F1_WUF5_MASK;   // write one to clear the flag
    }
    if (LLWU_F1 & LLWU_F1_WUF6_MASK)
    {
        LLWU_F1 |= LLWU_F1_WUF6_MASK;   // write one to clear the flag
    }
    if (LLWU_F1 & LLWU_F1_WUF7_MASK)
    {
        LLWU_F1 |= LLWU_F1_WUF7_MASK;   // write one to clear the flag
    }
    if (LLWU_F2 & LLWU_F2_WUF8_MASK)
    {
        LLWU_F2 |= LLWU_F2_WUF8_MASK;   // write one to clear the flag
    }
    if (LLWU_F2 & LLWU_F2_WUF9_MASK)
    {
        LLWU_F2 |= LLWU_F2_WUF9_MASK;   // write one to clear the flag
    }
    if (LLWU_F2 & LLWU_F2_WUF10_MASK)
    {
        LLWU_F2 |= LLWU_F2_WUF10_MASK;   // write one to clear the flag
    }
    if (LLWU_F2 & LLWU_F2_WUF11_MASK)
    {
        LLWU_F2 |= LLWU_F2_WUF11_MASK;   // write one to clear the flag
    }
    if (LLWU_F2 & LLWU_F2_WUF12_MASK)
    {
        LLWU_F2 |= LLWU_F2_WUF12_MASK;   // write one to clear the flag
    }
    if (LLWU_F2 & LLWU_F2_WUF13_MASK)
    {
        LLWU_F2 |= LLWU_F2_WUF13_MASK;   // write one to clear the flag
    }
    if (LLWU_F2 & LLWU_F2_WUF14_MASK)
    {
        LLWU_F2 |= LLWU_F2_WUF14_MASK;   // write one to clear the flag
    }
    if (LLWU_F2 & LLWU_F2_WUF15_MASK)
    {
        LLWU_F2 |= LLWU_F2_WUF15_MASK;   // write one to clear the flag
    }

    /************************************************************************
    * Note: This ISR does not write to the LLWU_F3 register because these
    * are peripheral module wakeups.  The flags contained in the LLWU_F3
    * register should be cleared through the associated module interrupt
    * and not through the LLWU_F3 per the Kinetis L Family Reference
    * Manual (LLWU Chapter)
    **********************************************************************/
    if (LLWU_F3 & LLWU_F3_MWUF0_MASK)
    {
        SIM_SCGC5  |= SIM_SCGC5_LPTMR_MASK;
        LPTMR0_CSR |=  LPTMR_CSR_TCF_MASK;   // write 1 to TCF to clear the LPT timer compare flag
        LPTMR0_CSR = ( LPTMR_CSR_TEN_MASK | LPTMR_CSR_TIE_MASK | LPTMR_CSR_TCF_MASK  );
    }
    if(LLWU_FILT1 & LLWU_FILT1_FILTF_MASK)
    {
        LLWU_FILT1 |= LLWU_FILT1_FILTF_MASK;
    }
    if(LLWU_FILT2 & LLWU_FILT2_FILTF_MASK)
    {
        LLWU_FILT2 |= LLWU_FILT2_FILTF_MASK;
    }
    NVIC_ICPR |= 1 << ((INT_LLW-16)%32);
}
