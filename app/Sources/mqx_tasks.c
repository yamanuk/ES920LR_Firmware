/* ###################################################################
**     Filename    : mqx_tasks.c
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Component   : Events
**     Version     : Driver 01.00
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2013-05-22, 16:17, # CodeGen: 0
**     Abstract    :
**         This is user's event module.
**         Put your event handler code here.
**     Settings    :
**     Contents    :
**         PExTask - void PExTask(uint32_t task_init_data);
**
** ###################################################################*/
/*!
** @file mqx_tasks.c
** @version 01.00
** @date 2013-05-22, 16:17, # CodeGen: 0
** @brief
**         This is user's event module.
**         Put your event handler code here.
*/
/*!
**  @addtogroup mqx_tasks_module mqx_tasks module documentation
**  @{
*/
/* MODULE mqx_tasks */

#include "Cpu.h"
#include "Events.h"
#include "mqx_tasks.h"

#ifdef __cplusplus
extern "C" {
#endif


/* User includes (#include below this line is not maintained by Processor Expert) */
extern void MainThreadWrapper(void const *argument);

/*
** ===================================================================
**     Event       :  PExTask (module mqx_tasks)
**
**     Component   :  Task1 [MQXLite1_task]
**     Description :
**         MQX task routine. The routine is generated into mqx_tasks.c
**         file.
**     Parameters  :
**         NAME            - DESCRIPTION
**         task_init_data  -
**     Returns     : Nothing
** ===================================================================
*/
void PExTask(uint32_t task_init_data)
{
    while(1)
    {
        /* Write your code here ... */
        MainThreadWrapper((void const*)task_init_data);
    }
}

/* END mqx_tasks */

#ifdef __cplusplus
}  /* extern "C" */
#endif

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
