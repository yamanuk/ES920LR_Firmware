/*****************************************************************************
* lptmr file.
*
* (c) Copyright 2014, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#include "lptmr.h"
#include "BME.h"
#include "cmsis_os.h"


/*******************************************************************************
*
*   PROCEDURE NAME:
*       lptmr_init -
*
*******************************************************************************/
void LPTMR_init( int count, int mode, int clock_source )
{
    SIM_SCGC5 |= SIM_SCGC5_LPTMR_MASK;

    osInstallIsr(INT_LPTimer, LPTMR_IRQHandler, NULL);

    NVIC_ICPR |= 1 << ((INT_LPTimer-16)%32);
    NVIC_ISER |= 1 << ((INT_LPTimer-16)%32);

    if( DIV_0 == mode )
    {
        LPTMR0_PSR = ( LPTMR_PSR_PRESCALE(0)            // 0000 is div 2
                     | LPTMR_PSR_PBYP_MASK              // LPO feeds directly to LPT
                     | LPTMR_PSR_PCS(clock_source)) ;   // use the choice of clock

        count = count * 100;
    }
    else if( DIV_512 == mode )
    {
        LPTMR0_PSR = ( LPTMR_PSR_PRESCALE(8)            // 0000 is div 2
                     | LPTMR_PSR_PCS(clock_source)) ;   // use the choice of clock

        count = count * 100 / 512;
    }
    else
    {
        LPTMR0_PSR = ( LPTMR_PSR_PRESCALE(10)           // 0000 is div 2
                     | LPTMR_PSR_PCS(clock_source)) ;   // use the choice of clock

        count = count * 100 / 2048;
    }

    LPTMR0_CMR = LPTMR_CMR_COMPARE(count);    //Set compare value

    LPTMR0_CSR =(  LPTMR_CSR_TCF_MASK   // Clear any pending interrupt
                 | LPTMR_CSR_TIE_MASK   // LPT interrupt enabled
                 | LPTMR_CSR_TPS(0)     // TMR pin select
                 |!LPTMR_CSR_TPP_MASK   // TMR Pin polarity
                 |!LPTMR_CSR_TFC_MASK   // Timer Free running counter is reset whenever TMR counter equals compare
                 |!LPTMR_CSR_TMS_MASK   // LPTMR0 as Timer
                );
    LPTMR0_CSR |= LPTMR_CSR_TEN_MASK;   //Turn on LPT and start counting
}

/************************************************************************************
*
* LPTMR_IRQHandler
*
************************************************************************************/
void LPTMR_IRQHandler( void *param )
{
    volatile unsigned int dummyread;

    if(MCM_CPO & MCM_CPO_CPOACK_MASK)
    {
        MCM_CPO &= ~MCM_CPO_CPOREQ_MASK;
        while (MCM_CPO & MCM_CPO_CPOACK_MASK);
    }
    SIM_SCGC5 |= SIM_SCGC5_LPTMR_MASK;

    LPTMR0_CSR |=  LPTMR_CSR_TCF_MASK;   // write 1 to TCF to clear the LPT timer compare flag
    LPTMR0_CSR = ( LPTMR_CSR_TEN_MASK | LPTMR_CSR_TIE_MASK | LPTMR_CSR_TCF_MASK  );

    // enable timer
    // enable interrupts
    // clear the flag
    /*wait for write to complete to  before returning */
    dummyread = LPTMR0_CSR;

    return;
}
