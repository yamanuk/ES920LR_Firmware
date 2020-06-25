/*!
* Copyright (c) 2014, Freescale Semiconductor, Inc.
* All rights reserved.
*
* \file MQXLite_Adapter.c
* This is the source file for the OS Abstraction layer for MQXLite.
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* o Redistributions of source code must retain the above copyright notice, this list
*   of conditions and the following disclaimer.
*
* o Redistributions in binary form must reproduce the above copyright notice, this
*   list of conditions and the following disclaimer in the documentation and/or
*   other materials provided with the distribution.
*
* o Neither the name of Freescale Semiconductor, Inc. nor the names of its
*   contributors may be used to endorse or promote products derived from this
*   software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
* ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
* ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*! *********************************************************************************
*************************************************************************************
* Include
*************************************************************************************
********************************************************************************** */

#include "EmbeddedTypes.h"
#include "cmsis_os.h"

#include <string.h>
#include "GenericList.h"
#include "mqxlite.h"
#include "lwmsgq.h"
#include "lwevent.h"
#include "mutex.h"
#include "lwtimer.h"

#define gHighestThreadPriority_c 3
#define gLowestThreadPriority_c 31

#define priorityAdjust(priority) ((gHighestThreadPriority_c + gLowestThreadPriority_c) -    \
                                  ((gHighestThreadPriority_c + gLowestThreadPriority_c)>>1) - \
                                  priority)

#define millisecToTicks(millisec) ((millisec * _time_get_ticks_per_sec() + 999)/1000)

#ifdef DEBUG_ASSERT
#define OS_ASSERT(condition) if(!(condition))while(1);
#else
#define OS_ASSERT(condition) (void)(condition);
#endif

#define osHeapSize ( (osNumberOfSemaphores * sizeof(LWSEM_STRUCT)) + \
                     (osNumberOfMutexes * (sizeof(MUTEX_STRUCT) + sizeof(MUTEX_ATTR_STRUCT))) + \
                     (osNumberOfTimers * (sizeof(LWTIMER_STRUCT) + \
                                          sizeof(LWTIMER_PERIOD_STRUCT) + \
                                          sizeof(void *) + \
                                          sizeof(void *) + \
                                          sizeof(os_timer_type))) + \
                     (osNumberOfMessageQs * sizeof(LWMSGQ_STRUCT)) + (osNumberOfMessages * sizeof(int)) )

void* osBufferAlloc(uint32_t numBytes);
void osBufferFree(void* buffer);
void TimerMQXLiteCallback(void *argument);
extern void MainThread(void const *argument);
void MainThreadWrapper(void const *argument);

extern const TASK_TEMPLATE_STRUCT MQX_template_list[];

list_t threadList;
uint8_t osHeap[osHeapSize];
uint8_t *osHeapPtr = osHeap, *lastAllocatedBuffer = NULL;

/*! *********************************************************************************
*************************************************************************************
* Public functions
*************************************************************************************
********************************************************************************** */
/*! *********************************************************************************
* \brief   Wrapper over MainThread.
*
* \param[in] param - Parameter to pass to the thread.
*
* \return void.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
void MainThreadWrapper(void const *argument)
{
  static osThreadLink_t osMainThreadLink;
  static osThreadDef_t osMainThreadDef;
  static LWEVENT_STRUCT osMainThreadSignal;

  ListInit(&threadList, 0);
  _lwevent_create(&osMainThreadSignal, 0);

  osMainThreadDef.pthread = (os_pthread)MQX_template_list[0].TASK_ADDRESS;
  osMainThreadDef.instances = 1;
  osMainThreadDef.tlink = &osMainThreadLink;
  osMainThreadDef.tname = MQX_template_list[0].TASK_NAME;
  osMainThreadDef.tpriority = (osPriority)priorityAdjust(MQX_template_list[0].TASK_PRIORITY);
  osMainThreadDef.tstack = NULL;
  osMainThreadDef.stacksize = MQX_template_list[0].TASK_STACKSIZE;

  osMainThreadLink.osThreadDefHandle = &osMainThreadDef;
  osMainThreadLink.osThreadId = osThreadGetId();
  osMainThreadLink.osThreadStackHandle = NULL;
  osMainThreadLink.osThreadSignalHandle = &osMainThreadSignal;

  ListAddTail(&threadList, (listElementHandle_t)&osMainThreadLink.link);

  MainThread(argument);

  while(1);
}

/*! *********************************************************************************
* \brief   Starts a thread dinamically.
*
* \param[in] threadDef - Definition of the thread.
*            param - Parameter to pass to the new thread.
*
* \return Thread handle of the new thread, or NULL if failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osThreadId osThreadCreate (osThreadDef_t *thread_def, void *argument)
{
  osThreadId thread_id;
  static uint32_t TASK_TEMPLATE_INDEX = 1;
  TASK_TEMPLATE_STRUCT taskTemplate;
  uint8_t *threadStackPtr, *stackPtr;
  uint8_t *threadSignalPtr, *signalPtr;
  osThreadLinkHandle_t threadLinkHandle;
  osPriority oldPriority;

  if(thread_def->instances == 0)
  {
    return NULL;
  }

  /*Change priority to avoid context switches*/
  oldPriority = osThreadGetPriority(osThreadGetId());
  osThreadSetPriority(osThreadGetId(), osPriorityRealtime);

  thread_def->instances--;

  stackPtr = thread_def->tstack;
  signalPtr = thread_def->tsignal;
  threadStackPtr = NULL;

  while(threadStackPtr == NULL)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);
    while (threadLinkHandle != NULL)
    {
      if(stackPtr == threadLinkHandle->osThreadStackHandle)
      {
        break; /*Stack is used by another thread*/
      }
      else
      {
        threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link); /*Check next thread*/
      }
    }
    if(threadLinkHandle == NULL)
    {
      threadStackPtr = stackPtr; /*Stack not taken, use it*/
      threadSignalPtr = signalPtr; /*Use signal*/
      break;
    }
    else
    {
      stackPtr = stackPtr + thread_def->stacksize; /*Go to next stack*/
      signalPtr = signalPtr + sizeof(LWEVENT_STRUCT); /*Go to next signal*/
    }
  }

  threadLinkHandle = thread_def->tlink;

  while(ListGetList((listElementHandle_t)&threadLinkHandle->link) == &threadList)
  {
    threadLinkHandle = threadLinkHandle + 1; /*Go to next link element*/
  }

  TASK_TEMPLATE_INDEX++;

  taskTemplate.TASK_TEMPLATE_INDEX = TASK_TEMPLATE_INDEX;
  taskTemplate.TASK_ADDRESS = (TASK_FPTR)(thread_def->pthread);
  taskTemplate.TASK_STACKSIZE = thread_def->stacksize;
  taskTemplate.TASK_PRIORITY = priorityAdjust(thread_def->tpriority);
  taskTemplate.TASK_NAME = thread_def->tname;
  taskTemplate.TASK_ATTRIBUTES = 0;
  taskTemplate.CREATION_PARAMETER = (uint_32)argument;

  _lwevent_create((LWEVENT_STRUCT_PTR)threadSignalPtr, 0);

  ListAddTail(&threadList, (listElementHandle_t)&threadLinkHandle->link);

  thread_id = (void *)_task_create_at(0,0,(uint_32)&taskTemplate,threadStackPtr,thread_def->stacksize);

  threadLinkHandle->osThreadDefHandle = thread_def;
  threadLinkHandle->osThreadId = thread_id;
  threadLinkHandle->osThreadStackHandle = threadStackPtr;
  threadLinkHandle->osThreadSignalHandle = threadSignalPtr;

  if(thread_id == MQX_NULL_TASK_ID)
  {
    ListRemoveElement((listElementHandle_t)&threadLinkHandle->link);
    _lwevent_destroy((LWEVENT_STRUCT_PTR)threadSignalPtr);
    thread_def->instances++;
    osThreadSetPriority(osThreadGetId(), oldPriority);
    return NULL; /*Failure.*/
  }
  else
  {
    osThreadSetPriority(osThreadGetId(), oldPriority);
    return thread_id;
  }
}

/*! *********************************************************************************
* \brief   Stops a thread referenced by the given thread handle.
*
* \param[in] thread_id - Thread handle.
*
* \return osOK: The operation was successful.
*         osErrorParameter: The thread handle was not found.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osThreadTerminate(osThreadId thread_id)
{
  _mqx_uint status;
  osThreadLinkHandle_t threadLinkHandle;
  osPriority oldPriority;

  /*Change priority to avoid context switches*/
  oldPriority = osThreadGetPriority(osThreadGetId());
  osThreadSetPriority(osThreadGetId(), osPriorityRealtime);

  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);
  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link); /*Check next thread*/
    if(threadLinkHandle == NULL)
    {
      osThreadSetPriority(osThreadGetId(), oldPriority);
      return osErrorParameter;
    }
  }

  threadLinkHandle->osThreadDefHandle->instances++;
  ListRemoveElement((listElementHandle_t)&threadLinkHandle->link);
  /*No MQX API support to detect illegal ISR call or terminated thread.*/
  status = _task_destroy((_task_id)(threadLinkHandle->osThreadId));

  if(status == MQX_INVALID_TASK_ID)
  {
    threadLinkHandle->osThreadDefHandle->instances--;
    ListAddTail(&threadList, (listElementHandle_t)&threadLinkHandle->link);
    osThreadSetPriority(osThreadGetId(), oldPriority);
    return osErrorParameter; /*Thread ID error.*/
  }

  _lwevent_destroy((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle);

  osThreadSetPriority(osThreadGetId(), oldPriority);
  return osOK;
}

/*! *********************************************************************************
* \brief   Puts the active thread at the end of the scheduler's queue.
*
* \param[in] void.
*
* \return osOK: The action was successful.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osThreadYield(void)
{
  /*No MQX API support to detect illegal ISR call.*/
  _sched_yield();
  return osOK;
}

/*! *********************************************************************************
* \brief   Retrieves the thread handle of the active thread.
*
* \param[in] void.
*
* \return Thread handle of the calling thread.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osThreadId osThreadGetId(void)
{
  osThreadId thread_id;

  thread_id = (void *)_task_get_id();

  return thread_id;
}

/*! *********************************************************************************
* \brief   Sets the priority of a thread.
*
* \param[in] thread_id - Thread handle of the thread to change the priority of.
*            priority - Priority value.
*
* \return osOK: The action completed successfully.
*         osErrorValue: The priority value is out of range.
*         osErrorParameter: The thread handle was not found.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osThreadSetPriority(osThreadId thread_id, osPriority priority)
{
  _mqx_uint newPriority, oldPriority;

  /*No MQX API support to detect terminated threads.*/
  if( (priority < osPriorityIdle) || (priority > osPriorityRealtime) )
  {
    return osErrorValue; /*Priority value is out of range.*/
  }

  newPriority = priorityAdjust(priority);

  if( _task_get_priority((_task_id)thread_id, &oldPriority) == MQX_INVALID_TASK_ID )
  {
    return osErrorParameter; /*Incorrect thread ID*/
  }
  _task_set_priority((_task_id)thread_id, newPriority, &oldPriority);

  return osOK;
}

/*! *********************************************************************************
* \brief   Gets the priority of a thread.
*
* \param[in] thread_id - Thread handle of the thread to to get the priority of.
*
* \return Priority of the given thread or osPriorityError if the action failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osPriority osThreadGetPriority(osThreadId thread_id)
{
  _mqx_uint priority;

  if( _task_get_priority((_task_id)thread_id, &priority) == MQX_INVALID_TASK_ID)
  {
    return osPriorityError; /*Thread ID error.*/
  }
  else
  {
    return (osPriority)priorityAdjust(priority);
  }
}

/*! *********************************************************************************
* \brief   Suspends the active thread for the given number of milliseconds.
*
* \param[in] millisec - Ammount of time to suspend the thread.
*
* \return osEventTimeout: Timeout occurred.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osDelay(uint32_t millisec)
{
  _time_delay_ticks(millisecToTicks(millisec));
  return osEventTimeout; /*No status from MQX API.*/
}

/*! *********************************************************************************
* \brief   Creates and initializes a mutex object.
*
* \param[in] mutex_def - Definition of the mutex(not used by MQXLite).
*
* \return Mutex handle if successful or NULL if failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osMutexId osMutexCreate (osMutexDef_t *mutex_def)
{
  osMutexId mutex_id;

  MUTEX_ATTR_STRUCT_PTR mutattr;

  (void)mutex_def;

  osInterruptDisable();

  mutex_id =  osBufferAlloc( sizeof(MUTEX_STRUCT) + sizeof(MUTEX_ATTR_STRUCT) );
  if(mutex_id == NULL)
  {
    osInterruptEnable();
    return NULL; /*Alloc error.*/
  }

  mutattr = (MUTEX_ATTR_STRUCT_PTR)((uint8_t *)mutex_id + sizeof(MUTEX_STRUCT));

  if (_mutatr_init(mutattr) != MQX_EOK)
  {
    osBufferFree(mutex_id);
    osInterruptEnable();
    return NULL; /*Parameter error.*/
  }
  if (_mutatr_set_sched_protocol(mutattr, MUTEX_PRIO_INHERIT) != MQX_EOK)
  {
    osBufferFree(mutex_id);
    osInterruptEnable();
    return NULL; /*Parameter error.*/
  }
  if (_mutatr_set_wait_protocol(mutattr, MUTEX_PRIORITY_QUEUEING) != MQX_EOK)
  {
    osBufferFree(mutex_id);
    osInterruptEnable();
    return NULL; /*Parameter error.*/
  }

  if (_mutex_init(mutex_id, mutattr) != MQX_EOK)
  {
    osBufferFree(mutex_id);
    osInterruptEnable();
    return NULL; /*Parameter error.*/
  }

  osInterruptEnable();
  return mutex_id;
}

/*! *********************************************************************************
* \brief   Releases a mutex.
*
* \param[in] mutex_id - Handle of the mutex to release.
*
* \return osOK: Release was successful.
*         osErrorResource: Release failed, mutex handle is incorrect.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osMutexRelease(osMutexId  mutex_id)
{
  if( _mutex_unlock(mutex_id) != MQX_EOK )
  {
    /*This error is not always correct. MQX does not differentiate between
      osErrorResource and osErrorParameter.*/
    return osErrorResource; /*Parameter error.*/
  }
  return osOK;
}

/*! *********************************************************************************
* \brief   Takes a mutex.
*
* \param[in] mutex_id - handle of the mutex to take.
*            millisec - Ammount of time to wait for the mutex to become available.
*
* \return osOK: The mutex has been obtained.
*         osErrorTimeoutResource: The mutex could not be obtained in the given time.
*         osErrorResource: The mutex could not be obtained when no timeout was specified.
*         osErrorParameter: The parameter mutex_id is incorrect.
*         osErrorISR: osMutexWait cannot be called from interrupt service routines.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osMutexWait( osMutexId  mutex_id, uint32_t  millisec )
{
  _mqx_uint status;

  if(millisec == 0)
  {
    status = _mutex_try_lock(mutex_id);
  }
  else
  {
    /*No timeout support in MQX for mutexes. Maybe MQX needs to add timeout support
      for mutexes.*/
    status = _mutex_lock(mutex_id);
  }

  switch(status)
  {
  case MQX_EOK:
    return osOK;
  case MQX_CANNOT_CALL_FUNCTION_FROM_ISR:
    return osErrorISR; /*Illegal ISR call.*/
  case MQX_EINVAL:
    return osErrorParameter; /*Parameter error.*/
  case MQX_EDEADLK:
    /*NOT TREATED BY CMSIS: Thread already has the mutex. Are CMSIS-RTOS mutexes
      recursive? Maybe MQX needs to add support for recursive mutexes.*/
    return osErrorTimeoutResource;
  case MQX_EBUSY:
    if(millisec == 0)
    {
      return osErrorResource; /*Mutex was not obtained.*/
    }
    else
    {
      return osErrorResource; /*We should never get here with the way mutAtr is set up.*/
    }
  default:
    return osErrorResource; /*We should never get here.*/
  }
}

/*! *********************************************************************************
* \brief   Creates and initializes a semaphore object.
*
* \param[in] semaphore_def - Definition of the semaphore(not used by MQXLite).
*            count - Initial number of resources.
*
* \return Semaphore handle if successful or NULL if failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osSemaphoreId osSemaphoreCreate(osSemaphoreDef_t *semaphore_def, int32_t count)
{
  osSemaphoreId semaphore_id;

  (void)semaphore_def;

  osInterruptDisable();

  semaphore_id =  osBufferAlloc( sizeof(LWSEM_STRUCT) );
  if(semaphore_id == NULL)
  {
    osInterruptEnable();
    return NULL; /*Alloc error.*/
  }

  if(_lwsem_create(semaphore_id, count) != MQX_OK)
  {
    osBufferFree(semaphore_id);
    osInterruptEnable();
    return NULL; /*Parameter error.*/
  }

  osInterruptEnable();
  return semaphore_id;
}

/*! *********************************************************************************
* \brief   Releases a semaphore.
*
* \param[in] semaphore_id - Handle of the semaphore to release.
*
* \return osOK: Release was successful.
*         osErrorParameter: Release failed, semaphore handle is incorrect.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osSemaphoreRelease(osSemaphoreId semaphore_id)
{
  if(_lwsem_post(semaphore_id) != MQX_OK)
  {
    return osErrorParameter; /*Parameter error, no MQX support to detect if
                                    all tokens have already been released.*/
  }
  else
  {
    return osOK;
  }
}

/*! *********************************************************************************
* \brief   Takes a semaphore.
*
* \param[in] semaphore_id - Handle of the semaphore to take.
*            millisec - Ammount of time to wait for the semaphore to become available.
*
* \return 1: Semaphore was obtained.
*         0: Semaphore was not obtained within the given time.
*        -1: Parameter error or illegal ISR call.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
int32_t osSemaphoreWait(osSemaphoreId semaphore_id, uint32_t millisec)
{
  _mqx_uint status;

  switch(millisec)
  {
  case 0:
    if(_lwsem_poll(semaphore_id) == FALSE)
    {
      return 0; /*Semaphore not obtained or parameter error.*/
    }
    else
    {
      return 1; /*Semaphore obtained, no MQX API to get semaphore count.*/
    }
  case osWaitForever:
    if(_lwsem_wait(semaphore_id) != MQX_OK)
    {
      return -1; /*Illegal ISR call or parameter error).*/
    }
    else
    {
      return 1; /*Semaphore obtained, no MQX API to get semaphore count.*/
    }
  default:
    status = _lwsem_wait_ticks(semaphore_id, millisecToTicks(millisec));
    switch(status)
    {
    case MQX_LWSEM_WAIT_TIMEOUT:
      return 0; /*Semaphore not obtained.*/
    case MQX_OK:
      return 1; /*Semaphore obtained, no MQX API to get semaphore count.*/
    default:
      return -1; /*Illegal ISR call or parameter error).*/
    }
  }
}

/*! *********************************************************************************
* \brief   Creates and initializes a message queue object.
*
* \param[in] queue_def - Definition of the message queue.
*            thread_id - Thread handle associated with the message queue(not used by MQXLite).
*
* \return Message queue handle if successful or NULL if failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osMessageQId osMessageCreate(osMessageQDef_t *queue_def, osThreadId thread_id)
{
  osMessageQId queue_id;

  (void)thread_id;

  osInterruptDisable();
  queue_id =  osBufferAlloc( sizeof(LWMSGQ_STRUCT) + (queue_def->queue_sz * sizeof(int)) );
  if(queue_id == NULL)
  {
    osInterruptEnable();
    return NULL; /*Alloc error.*/
  }

  if( _lwmsgq_init(queue_id, queue_def->queue_sz, sizeof(int)/sizeof(_mqx_max_type)) != MQX_OK )
  {
    osBufferFree(queue_id);
    osInterruptEnable();
    return NULL; /*Parameter error.*/
  }

  osInterruptEnable();
  return queue_id;
}

/*! *********************************************************************************
* \brief   Sends a messgage to the message queue.
*
* \param[in] queue_id - Handle of the message queue.
*            data - Message to be sent(32 bit integer value).
*
* \return osOK: The message was put into the queue.
*         osErrorResource: No memory in the queue was available.
*         osErrorParameter: A parameter is invalid or outside of a permitted range.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osMessagePut(osMessageQId queue_id, uint32_t info, uint32_t millisec)
{
  _mqx_uint status;

  /*No MQX API support for timeout. Maybe MQX needs to add timeout support
    for queues.*/
  switch(millisec)
  {
  case 0:
    status = _lwmsgq_send(queue_id, (_mqx_max_type_ptr)&info, 0);
    break;
  case osWaitForever:
    status = _lwmsgq_send(queue_id, (_mqx_max_type_ptr)&info, LWMSGQ_SEND_BLOCK_ON_FULL);
    break;
  default:
    status = _lwmsgq_send(queue_id, (_mqx_max_type_ptr)&info, LWMSGQ_SEND_BLOCK_ON_FULL);
    break;
  }

  switch(status)
  {
  case MQX_OK:
    return osOK; /*Message sent*/
  case LWMSGQ_INVALID:
    return osErrorParameter; /*Parameter error*/
  case LWMSGQ_FULL:
    return osErrorResource; /*Queue full*/
  default:
    return osErrorResource; /*We should never get here.*/
  }
}

/*! *********************************************************************************
* \brief   Receives a messgage from the message queue.
*
* \param[in] queue_id - Handle of the queue to receive from.
*            millisec - Ammount of time to wait for a message to become available.
*
* \return osOK: No message is available in the queue and no timeout was specified.
*         osEventTimeout: No message has arrived during the given timeout period.
*         osEventMessage: Message received, value.p contains the pointer to message.
*         osErrorParameter: A parameter is invalid or outside of a permitted range.
*
*         queueNotify.def.message_id: Queue Handle of the queue the message was received from.
*         queueNotify.value.v: Message received(data).
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osEvent osMessageGet (osMessageQId queue_id, uint32_t millisec)
{
  _mqx_uint status;
  uint32_t message;
  MQX_TICK_STRUCT ticks;
  osEvent queueNotify;

  switch(millisec)
  {
  case 0:
    status = _lwmsgq_receive(queue_id, (_mqx_max_type_ptr)&message, 0, 0, NULL);
    break;
  case osWaitForever:
    status = _lwmsgq_receive(queue_id, (_mqx_max_type_ptr)&message, LWMSGQ_RECEIVE_BLOCK_ON_EMPTY, 0, NULL);
    break;
  default:
    status = _lwmsgq_receive(queue_id, (_mqx_max_type_ptr)&message, LWMSGQ_RECEIVE_BLOCK_ON_EMPTY | LWMSGQ_TIMEOUT_FOR, millisecToTicks(millisec), &ticks);
    break;
  }

  switch(status)
  {
  case MQX_OK:
    queueNotify.status = osEventMessage; /*Message received*/
    break;
  case LWMSGQ_INVALID:
    queueNotify.status = osErrorParameter; /*Parameter error*/
    break;
  case LWMSGQ_TIMEOUT:
    queueNotify.status = osEventTimeout; /*Timeout occurred*/
    break;
  case LWMSGQ_EMPTY:
    queueNotify.status = osOK; /*No message received*/
    break;
  default:
    OS_ASSERT(FALSE); /*We should never get here.*/
  }
  queueNotify.def.message_id = queue_id; /*Not sure about this one. CMSIS is not clear.*/
  queueNotify.value.v = message;

  return queueNotify;
}

/*! *********************************************************************************
* \brief   Clears a thread's given signals.
*
* \param[in] thread_id - Thread ID.
*            signals - Bit mask of the signals
*
* \return Previously active signals or 0x80000000 if failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
int32_t osSignalClear(osThreadId thread_id, int32_t signals)
{
  osThreadLinkHandle_t threadLinkHandle;
  _mqx_uint status;
  int32_t oldSignals;

  if( (signals == 0) || ((uint32_t)(~((1U << osFeature_Signals) - 1U)) & signals) )
  {
    return 0x80000000; /*signals out of bounds*/
  }

  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);

  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);
    if(threadLinkHandle == NULL)
    {
      return 0x80000000; /*Task ID not found*/
    }
  }

  osInterruptDisable(); /*Disable interrupts to avoid context switches.*/
  oldSignals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
  status = _lwevent_clear((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, signals);
  osInterruptEnable();

  switch(status)
  {
  case MQX_LWEVENT_INVALID:
    return 0x80000000;
  case MQX_OK:
    return oldSignals;
  default :
    return 0x80000000; /*We should never get here*/
  }
}

/*! *********************************************************************************
* \brief   Gets and clears a thread's signals.
*
* \param[in] thread_id - Thread ID.
*
* \return Previously active signals or 0x80000000 if failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
int32_t osSignalGet(osThreadId thread_id)
{
  osThreadLinkHandle_t threadLinkHandle;
  _mqx_uint status;
  int32_t oldSignals;

  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);

  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);
    if(threadLinkHandle == NULL)
    {
      return 0x80000000; /*Task ID not found*/
    }
  }

  osInterruptDisable(); /*Disable interrupts to avoid context switches.*/
  oldSignals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
  status = _lwevent_clear((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, oldSignals);
  osInterruptEnable();

  switch(status)
  {
  case MQX_LWEVENT_INVALID:
    return 0x80000000;
  case MQX_OK:
    return oldSignals;
  default :
    return 0x80000000; /*We should never get here*/
  }
}

/*! *********************************************************************************
* \brief   Sets a thread's signals flags.
*
* \param[in] thread_id - Thread ID.
*            signals - Bit mask of the signals.
*
* \return Previously active signals or 0x80000000 if failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
int32_t osSignalSet(osThreadId thread_id, int32_t signals)
{
  osThreadLinkHandle_t threadLinkHandle;
  _mqx_uint status;
  int32_t oldSignals;

  if( (signals == 0) || ((uint32_t)(~((1U << osFeature_Signals) - 1U)) & signals) )
  {
    return 0x80000000; /*signals out of bounds*/
  }

  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);

  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);
    if(threadLinkHandle == NULL)
    {
      return 0x80000000; /*Task ID not found*/
    }
  }

  osInterruptDisable(); /*Disable interrupts to avoid context switches.*/
  oldSignals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
  status = _lwevent_set((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, signals);
  osInterruptEnable();

  switch(status)
  {
  case MQX_LWEVENT_INVALID:
    return 0x80000000;
  case MQX_OK:
    return oldSignals;
  default :
    return 0x80000000; /*We should never get here*/
  }
}

/*! *********************************************************************************
* \brief   Suspends the calling thread and waits for the given signals flags.
*
* \param[in] thread_id - Thread ID.
*            millisec - Time to wait.
*
* \return osOK: No signal received when the timeout value millisec was zero.
*         osEventTimeout: Signal not occurred within timeout
*         osEventSignal: Signal occurred, value.signals contains the signal flags; these signal flags are cleared.
*         osErrorValue: The value signals is outside of the permitted range.
*         osErrorISR: osSignalWait cannot be called from interrupt service routines.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osEvent osSignalWait(int32_t signals, uint32_t millisec)
{
  osThreadId thread_id;
  osThreadLinkHandle_t threadLinkHandle;
  _mqx_uint status;
  osEvent signalNotify;

  if( (signals != 0) && ((uint32_t)(~((1U << osFeature_Signals) - 1U)) & signals) )
  {
    signalNotify.status = osErrorValue;
    signalNotify.value.signals = 0;
    return signalNotify; /*signals out of bounds*/
  }

  thread_id = osThreadGetId();
  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);

  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);
    if(threadLinkHandle == NULL)
    {
      /*Task ID not found. Improper CMSIS status, but no status defined for this case.*/
      signalNotify.status = osErrorISR;
      signalNotify.value.signals = 0;
      return signalNotify;
    }
  }

  osInterruptDisable(); /*Disable interrupts to avoid context switches.*/

  switch(millisec)
  {
  case 0:
    if( (((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE != 0) &&
        (((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE & signals == signals) )
    {
      signalNotify.value.signals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
      signalNotify.status = osEventSignal;
      _lwevent_clear((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, signalNotify.value.signals);
    }
    else
    {
      signalNotify.status = osOK;
      signalNotify.value.signals = 0;
    }
    osInterruptEnable();
    break;
  default:
    osInterruptEnable();
    status = _lwevent_wait_ticks((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle,
                                 (signals)?(signals):((1U << osFeature_Signals) - 1U),
                                 (signals)?(TRUE):(FALSE),
                                 (millisec==osWaitForever)?0:millisecToTicks(millisec));
    osInterruptDisable(); /*Disable interrupts to avoid context switches.*/
    if(((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE & signals == signals)
    {
      status = MQX_OK;
    }

    switch(status)
    {
    case LWEVENT_WAIT_TIMEOUT:
      signalNotify.value.signals = 0;
      signalNotify.status = osEventTimeout;
      break;
    case MQX_OK:
      signalNotify.value.signals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
      signalNotify.status = osEventSignal;
      _lwevent_clear((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, signalNotify.value.signals);
      break;
    case MQX_CANNOT_CALL_FUNCTION_FROM_ISR:
      /*Fallthrough*/
    default :
      signalNotify.value.signals = 0;
      signalNotify.status = osErrorISR;
      break;
    }

    osInterruptEnable();
    break;
  }
  return signalNotify;
}

/*! *********************************************************************************
* \brief   Enables interrupts.
*
* \param[in] void.
*
* \return void.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
void osInterruptEnable(void)
{
  _int_enable();
}

/*! *********************************************************************************
* \brief   Disables interrupts(prevents context switches).
*
* \param[in] void.
*
* \return void.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
void osInterruptDisable(void)
{
  _int_disable();
}

/*! *********************************************************************************
* \brief   Installs an ISR.
*
* \param[in] vector: Vector number (not the offset) of the interrupt.
*            isrPtr: Pointer to the ISR.
*            param:  Pointer to the data to be passed as the first parameter to the
*                    ISR when an interrupt occurs and the ISR runs.
*
* \return void.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osIsrFuncPtr_t osInstallIsr(uint32_t vector, osIsrFuncPtr_t isrPtr, void *argument)
{
  return _int_install_isr(vector, isrPtr, argument);
}

/*! *********************************************************************************
* \brief   Creates a timer object.
*
* \param[in] timer_def - Timer definition which includes the callback function pointer.
*            type - One-shot or periodic timer.
*            param - Parameter to pass to callback.
*
* \return Timer handle if procedure is successful or NULL if failed.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osTimerId osTimerCreate (osTimerDef_t *timer_def, os_timer_type type, void *argument)
{
  osTimerId timer_id;
  LWTIMER_PERIOD_STRUCT_PTR periodStruct;
  os_ptimer *userFunc;
  void **userArg;
  os_timer_type *timerType;

  osInterruptDisable();
  timer_id = (osTimerId)osBufferAlloc(sizeof(LWTIMER_STRUCT) +
                                      sizeof(LWTIMER_PERIOD_STRUCT) +
                                      sizeof(void *) +
                                      sizeof(void *) +
                                      sizeof(os_timer_type) );
  osInterruptEnable();

  if(timer_id == NULL)
  {
    return NULL; /*Alloc error*/
  }

  periodStruct = (LWTIMER_PERIOD_STRUCT_PTR)((uint8_t*)timer_id+ sizeof(LWTIMER_STRUCT));
  userFunc = (os_ptimer *)((uint8_t*)periodStruct + sizeof(LWTIMER_PERIOD_STRUCT));
  userArg = (void **)((uint8_t*)userFunc + sizeof(void *));
  timerType = (os_timer_type *)((uint8_t*)userArg + sizeof(void *));

  _lwtimer_create_periodic_queue( periodStruct, 100, 0 );

  *userFunc = timer_def->ptimer;
  *userArg = argument;
  *timerType = type;

  return timer_id;
}

/*! *********************************************************************************
* \brief   Starts a timer.
*
* \param[in] timer_id - Timer handle of the timer to start.
*            millisec - Timer period in milliseconds.
*
* \return osOK: The specified timer has been started or restarted.
*         osErrorParameter: Timer ID is incorrect.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osTimerStart (osTimerId timer_id, uint32_t millisec)
{
  _mqx_uint status;
  LWTIMER_PERIOD_STRUCT_PTR periodStruct;

  periodStruct = (LWTIMER_PERIOD_STRUCT_PTR)((uint8_t*)timer_id+sizeof(LWTIMER_STRUCT));

  /*Hack mqx internal linked periodic queue. I have no other way.*/
  osInterruptDisable();
  periodStruct->EXPIRY = 0;
  periodStruct->PERIOD = millisecToTicks(millisec);
  osInterruptEnable();

  _lwtimer_cancel_timer((LWTIMER_STRUCT_PTR)timer_id);
  status = _lwtimer_add_timer_to_queue(
                                       periodStruct,
                                       (LWTIMER_STRUCT_PTR)timer_id,
                                       millisecToTicks(millisec)-1,
                                       (LWTIMER_ISR_FPTR)TimerMQXLiteCallback,
                                       (void *)timer_id);
  switch(status)
  {
  case MQX_OK:
    return osOK;
  case MQX_LWTIMER_INVALID:
    return osErrorParameter;
  case MQX_INVALID_PARAMETER:
    return osErrorParameter; /*Improper status*/
  default:
    return osErrorResource; /*We should never get here.*/
  }
}

/*! *********************************************************************************
* \brief   Stops a timer.
*
* \param[in] timer_id - Timer handle of the timer to stop.
*
* \return osOK: The specified timer has been stopped.
*         osErrorParameter: Timer handle is incorrect.
*         osErrorResource: The timer was not started.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
osStatus osTimerStop (osTimerId timer_id)
{
  _mqx_uint status;

  status = _lwtimer_cancel_timer((LWTIMER_STRUCT_PTR)timer_id);
  switch(status)
  {
  case MQX_OK:
    return osOK;
  case MQX_LWTIMER_INVALID:
    return osErrorParameter;
  default:
    return osErrorResource; /*We should never get here.*/
  }
}

/*! *********************************************************************************
*************************************************************************************
* Private functions
*************************************************************************************
********************************************************************************** */
/*! *********************************************************************************
* \brief   Re-entrant timer callback used for all timers to catch and stop one-shot timers.
*
* \param[in] param - Timer handle.
*
* \return void.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
/*! *********************************************************************************
* \brief     Allocates a block from the os heap array.
* \param[in] numBytes - Size of buffer to allocate.
*
* \return Pointer to the allocated buffer, NULL if failed.
*
* \pre
*
* \post
*
* \remarks Function is unprotected from interrupts.
*
********************************************************************************** */
void* osBufferAlloc(uint32_t numBytes)
{
  void *bufferPtr = NULL;

  if( (osHeapSize - (osHeapPtr - osHeap)) >= numBytes )
  {
    bufferPtr = osHeapPtr;
    lastAllocatedBuffer = bufferPtr;
    osHeapPtr += numBytes;
  }

  return bufferPtr;
}

/*! *********************************************************************************
* \brief     Frees a block from the os heap array.
* \param[in] Pointer to the buffer to free.
*
* \return void.
*
* \pre
*
* \post
*
* \remarks Function provides limited buffer freeing. Only frees the last
*          allocated buffer.
*
********************************************************************************** */
void osBufferFree(void* buffer)
{
  if( lastAllocatedBuffer == buffer )
  {
    osHeapPtr = buffer;
  }
}

/*! *********************************************************************************
* \brief   Re-entrant timer callback used for all timers to catch and stop one-shot timers.
*
* \param[in] param - Timer handle.
*
* \return void.
*
* \pre
*
* \post
*
* \remarks
*
********************************************************************************** */
void TimerMQXLiteCallback(void *argument)
{
  osTimerId timer_id = argument;
  os_ptimer userFunc;
  void *userArg;
  os_timer_type timerType;

  userFunc = *(os_ptimer *)((uint8_t*)timer_id + sizeof(LWTIMER_STRUCT) + sizeof(LWTIMER_PERIOD_STRUCT));
  userArg = *(void **)((uint8_t*)timer_id + sizeof(LWTIMER_STRUCT) + sizeof(LWTIMER_PERIOD_STRUCT) + sizeof(void *));
  timerType = *(os_timer_type *)((uint8_t*)timer_id + sizeof(LWTIMER_STRUCT) + sizeof(LWTIMER_PERIOD_STRUCT) + sizeof(void *) + sizeof(void *));

  if( timerType == osTimerOnce )
  {
    _lwtimer_cancel_timer((LWTIMER_STRUCT_PTR)argument);
  }

  userFunc(userArg);
}
