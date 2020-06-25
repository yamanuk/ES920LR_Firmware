/* ###################################################################
**     Filename    : ProcessorExpert.c
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Version     : Driver 01.01
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2013-08-16, 15:33, # CodeGen: 29
**     Abstract    :
**         Main module.
**         This module contains user's application code.
**     Settings    :
**     Contents    :
**         No public methods
**
** ###################################################################*/
/*!
** @file ProcessorExpert.c
** @version 01.01
** @brief
**         Main module.
**         This module contains user's application code.
*/
/*!
**  @addtogroup ProcessorExpert_module ProcessorExpert module documentation
**  @{
*/
/* MODULE ProcessorExpert */
#include "Cpu.h"
#include "Events.h"
#include "mqx_tasks.h"
#include "MQXLite1.h"
#include "SystemTimer1.h"
#include "StackTimer.h"
#include "UARTA.h"
#include "UARTB.h"
#include "SPISlave.h"
#include "I2CDriver.h"
#include "DataAvailablePin.h"
#include "PitTimeStamp.h"
#include "LED1.h"
#include "LED2.h"
#include "RealTimeClock.h"
#include "PE_Types.h"
#include "PE_Error.h"
#include "PE_Const.h"
#include "IO_Map.h"

#include "adc16.h"

/* User includes (#include below this line is not maintained by Processor Expert) */
#ifdef INC_FREERTOS_H
extern void FreeRTOSmain(void);
#endif

/*lint -save  -e970 Disable MISRA rule (6.3) checking. */
int main(void)
/*lint -restore Enable MISRA rule (6.3) checking. */
{
    /* Write your local variable definition here */

    /*** Processor Expert internal initialization. DON'T REMOVE THIS CODE!!! ***/
    PE_low_level_init();
    /*** End of Processor Expert internal initialization.                    ***/

    /* Write your code here */
    

#ifdef INC_FREERTOS_H
    FreeRTOSmain();
#endif

    /*** Don't write any code pass this line, or it will be deleted during code generation. ***/

    /*** RTOS startup code. Macro PEX_RTOS_START is defined by the RTOS component. DON'T MODIFY THIS CODE!!! ***/
#ifdef PEX_RTOS_START
    PEX_RTOS_START();                  /* Startup of the selected RTOS. Macro is defined by the RTOS component. */
#endif
    /*** End of RTOS startup code.  ***/

    /*** Processor Expert end of main routine. DON'T MODIFY THIS CODE!!! ***/
    for(;;){}
    /*** Processor Expert end of main routine. DON'T WRITE CODE BELOW!!! ***/
} /*** End of main routine. DO NOT MODIFY THIS TEXT!!! ***/

/* END ProcessorExpert */
/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.3 [05.09]
**     for the Freescale Kinetis series of microcontrollers.
**
** ###################################################################
*/
