/* ###################################################################
**     Filename    : mqx_tasks.h
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Component   : Events
**     Version     : Driver 01.00
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2013-06-06, 15:24, # CodeGen: 14
**     Abstract    :
**         This is user's event module.
**         Put your event handler code here.
**     Settings    :
**     Contents    :
**         PExTask - void PExTask(uint32_t task_init_data);
**
** ###################################################################*/
/*!
** @file mqx_tasks.h
** @version 01.00
** @date 2013-06-06, 15:24, # CodeGen: 14
** @brief
**         This is user's event module.
**         Put your event handler code here.
*/
/*!
**  @addtogroup mqx_tasks_module mqx_tasks module documentation
**  @{
*/

#ifndef __mqx_tasks_H
#define __mqx_tasks_H
/* MODULE mqx_tasks */

#include "PE_Types.h"
#include "PE_Error.h"
#include "PE_Const.h"
#include "IO_Map.h"
#include "MQXLite1.h"
#include "SystemTimer1.h"
#include "StackTimer.h"
#include "LED1.h"
#include "LED2.h"
#include "RealTimeClock.h"
#include "UARTA.h"
#include "UARTB.h"
#include "SPISlave.h"
#include "I2CDriver.h"
#include "DataAvailablePin.h"
#include "PitTimeStamp.h"

#ifdef __cplusplus
extern "C" {
#endif

/*
** ===================================================================
**     Event       :  PExTask (module mqx_tasks)
**
**     Component   :  Task1 [MQXLite_task]
**     Description :
**         MQX task routine. The routine is generated into mqx_tasks.c
**         file.
**     Parameters  :
**         NAME            - DESCRIPTION
**         task_init_data  -
**     Returns     : Nothing
** ===================================================================
*/
void PExTask(uint32_t task_init_data);

/* END mqx_tasks */

#ifdef __cplusplus
}  /* extern "C" */
#endif

#endif
/* ifndef __mqx_tasks_H*/
/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.2 [05.06]
**     for the Freescale Kinetis series of microcontrollers.
**
** ###################################################################
*/
