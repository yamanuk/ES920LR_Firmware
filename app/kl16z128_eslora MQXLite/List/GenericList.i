































 





 
































 







 



































 







 

 
 

  #pragma system_include

 
 

 

  #pragma system_include














 


 
 


  #pragma system_include

 



 

 

 

 
#pragma rtmodel = "__dlib_version", "6"

 


 



























 


  #pragma system_include

 
 
 


  #pragma system_include

 

   

 
 


   #pragma system_include






 




 


 


 


 

 


 

 

 

 

 

 

 

 

 















 



















 











 























 





 



 










 














 













 








 













 













 















 











 








 








 






 





 












 





 













 






 


   


  







 







 




 






 




 




 













 

   




 







 







 







 










 





 

















 


 


 













 

   


 


 



 

 

 
  typedef unsigned int _Wchart;
  typedef unsigned int _Wintt;

 

 
typedef unsigned int     _Sizet;

 
typedef signed char   __int8_t;
typedef unsigned char  __uint8_t;
typedef signed short int   __int16_t;
typedef unsigned short int  __uint16_t;
typedef signed int   __int32_t;
typedef unsigned int  __uint32_t;
   typedef signed long long int   __int64_t;
   typedef unsigned long long int  __uint64_t;
typedef signed int   __intptr_t;
typedef unsigned int  __uintptr_t;

 
typedef struct _Mbstatet
{  
    unsigned int _Wchar;   
    unsigned int _State;   

} _Mbstatet;

 

 
  typedef struct __va_list __Va_list;



 
typedef struct
{
    long long _Off;     
  _Mbstatet _Wstate;
} _Fpost;


 

 
  
   
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Locksyslock_StaticGuard(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Malloc(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Stream(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_Debug(void);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlocksyslock_StaticGuard(void);


  typedef void *__iar_Rmtx;

  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Initdynamiclock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Dstdynamiclock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Lockdynamiclock(__iar_Rmtx *);
  _Pragma("object_attribute = __weak") __intrinsic __nounwind void __iar_Unlockdynamiclock(__iar_Rmtx *);

  






 


 
  typedef signed char          int8_t;
  typedef unsigned char        uint8_t;

  typedef signed short int         int16_t;
  typedef unsigned short int       uint16_t;

  typedef signed int         int32_t;
  typedef unsigned int       uint32_t;

  typedef signed long long int         int64_t;
  typedef unsigned long long int       uint64_t;


 
typedef signed char      int_least8_t;
typedef unsigned char    uint_least8_t;

typedef signed short int     int_least16_t;
typedef unsigned short int   uint_least16_t;

typedef signed int     int_least32_t;
typedef unsigned int   uint_least32_t;

 
  typedef signed long long int   int_least64_t;
  typedef unsigned long long int uint_least64_t;



 
typedef signed int       int_fast8_t;
typedef unsigned int     uint_fast8_t;

typedef signed int      int_fast16_t;
typedef unsigned int    uint_fast16_t;

typedef signed int      int_fast32_t;
typedef unsigned int    uint_fast32_t;

  typedef signed long long int    int_fast64_t;
  typedef unsigned long long int  uint_fast64_t;

 
typedef signed long long int          intmax_t;
typedef unsigned long long int        uintmax_t;


 
typedef signed int          intptr_t;
typedef unsigned int        uintptr_t;

 
typedef int __data_intptr_t; typedef unsigned int __data_uintptr_t;

 






















 











 






 

 
typedef uint8_t   bool_t;

typedef uint8_t    index_t;

 


 





typedef volatile signed char vint8_t;
typedef volatile unsigned char vuint8_t;
typedef volatile signed short vint16_t;
typedef volatile unsigned short vuint16_t;
typedef volatile signed long vint32_t;
typedef volatile unsigned long vuint32_t;

typedef unsigned char uintn8_t;
typedef unsigned long uintn32_t;


 


 
typedef uint32_t instanceId_t;








 





 
typedef enum
{
  gListOk_c = 0,
  gListFull_c,
  gListEmpty_c,
  gOrphanElement_c
}listStatus_t;

typedef struct list_tag
{
  struct listElement_tag *head;
  struct listElement_tag *tail;
  uint16_t size;
  uint16_t max;
}list_t, *listHandle_t;

typedef struct listElement_tag
{
  struct listElement_tag *next;
  struct listElement_tag *prev;
  struct list_tag *list;
}listElement_t, *listElementHandle_t;





 
void ListInit(listHandle_t list, uint32_t max);
listHandle_t ListGetList(listElementHandle_t element);
listStatus_t ListAddHead(listHandle_t list, listElementHandle_t element);
listStatus_t ListAddTail(listHandle_t list, listElementHandle_t element);
listElementHandle_t ListRemoveHead(listHandle_t list);
listElementHandle_t ListGetHead(listHandle_t list);
listElementHandle_t ListGetNext(listElementHandle_t element);
listElementHandle_t ListGetPrev(listElementHandle_t element);
listStatus_t ListRemoveElement(listElementHandle_t element);
listStatus_t ListAddPrevElement(listElementHandle_t element, listElementHandle_t newElement);
uint32_t ListGetSize(listHandle_t list);
uint32_t ListGetAvailable(listHandle_t list);
listStatus_t ListTest(void);





 

















 












































































 





 













 
 

  #pragma system_include

 
 

 

  #pragma system_include














 


 
 


  #pragma system_include

 
 

 

  #pragma system_include














 



 
  typedef _Sizet size_t;

typedef unsigned int __data_size_t;



 


 
  typedef   signed int ptrdiff_t;

  typedef   _Wchart wchar_t;


    typedef union
    {
      long long _ll;
      long double _ld;
      void *_vp;
    } _Max_align_t;
    typedef _Max_align_t max_align_t;






 







typedef enum  {
  osPriorityIdle          = -3,          
  osPriorityLow           = -2,          
  osPriorityBelowNormal   = -1,          
  osPriorityNormal        =  0,          
  osPriorityAboveNormal   = +1,          
  osPriorityHigh          = +2,          
  osPriorityRealtime      = +3,          
  osPriorityError         =  0x84        
} osPriority;






typedef enum  {
  osOK                    =     0,       
  osEventSignal           =  0x08,       
  osEventMessage          =  0x10,       
  osEventMail             =  0x20,       
  osEventTimeout          =  0x40,       
  osErrorParameter        =  0x80,       
  osErrorResource         =  0x81,       
  osErrorTimeoutResource  =  0xC1,       
  osErrorISR              =  0x82,       
  osErrorISRRecursive     =  0x83,       
  osErrorPriority         =  0x84,       
  osErrorNoMemory         =  0x85,       
  osErrorValue            =  0x86,       
  osErrorOS               =  0xFF,       
  os_status_reserved      =  0x7FFFFFFF  
} osStatus;




typedef enum  {
  osTimerOnce             =     0,       
  osTimerPeriodic         =     1        
} os_timer_type;



typedef void (*os_pthread) (void const *argument);



typedef void (*os_ptimer) (void const *argument);


typedef void (*osIsrFuncPtr_t) (void *);





typedef void *osThreadId;



typedef void *osTimerId;



typedef void *osMutexId;



typedef void *osSemaphoreId;



typedef struct os_pool_cb *osPoolId;



typedef void *osMessageQId;



typedef struct os_mailQ_cb *osMailQId;




typedef struct os_thread_def  {
  os_pthread               pthread;    
  osPriority             tpriority;    
  uint32_t               instances;    
  uint32_t               stacksize;    
  uint8_t                  *tstack;
  void                    *tsignal;
  void                      *tlink;
  char                      *tname;
} osThreadDef_t;

typedef struct osThreadLink_tag{
  uint8_t          link[12];
  osThreadId       osThreadId;
  osThreadDef_t    *osThreadDefHandle;
  uint8_t          *osThreadStackHandle;
  void             *osThreadSignalHandle;
}osThreadLink_t, *osThreadLinkHandle_t;



typedef struct os_timer_def  {
  os_ptimer                 ptimer;    
  void                   *argument;
} osTimerDef_t;



typedef struct os_mutex_def  {
  uint32_t                   dummy;    
} osMutexDef_t;



typedef struct os_semaphore_def  {
  uint32_t                   dummy;    
} osSemaphoreDef_t;



typedef const struct os_pool_def  {
  uint32_t                 pool_sz;    
  uint32_t                 item_sz;    
  void                       *pool;    
} osPoolDef_t;



typedef struct os_messageQ_def  {
  uint32_t                queue_sz;    
  uint32_t                 item_sz;    
  void                       *pool;    
} osMessageQDef_t;



typedef const struct os_mailQ_def  {
  uint32_t                queue_sz;    
  uint32_t                 item_sz;    
  void                       *pool;    
} osMailQDef_t;




typedef struct  {
  osStatus                 status;     
  union  {
    uint32_t                    v;     
    void                       *p;     
    int32_t               signals;     
  } value;                             
  union  {
    osMailQId             mail_id;     
    osMessageQId       message_id;     
  } def;                               
} osEvent;









osStatus osKernelStart (osThreadDef_t *thread_def, void *argument);




int32_t osKernelRunning(void);

























osThreadId osThreadCreate (osThreadDef_t *thread_def, void *argument);




osThreadId osThreadGetId (void);





osStatus osThreadTerminate (osThreadId thread_id);




osStatus osThreadYield (void);






osStatus osThreadSetPriority (osThreadId thread_id, osPriority priority);





osPriority osThreadGetPriority (osThreadId thread_id);








osStatus osDelay (uint32_t millisec);






osEvent osWait (uint32_t millisec);





















osTimerId osTimerCreate (osTimerDef_t *timer_def, os_timer_type type, void *argument);






osStatus osTimerStart (osTimerId timer_id, uint32_t millisec);





osStatus osTimerStop (osTimerId timer_id);









int32_t osSignalSet (osThreadId thread_id, int32_t signal);






int32_t osSignalClear (osThreadId thread_id, int32_t signal);





int32_t osSignalGet (osThreadId thread_id);






osEvent osSignalWait (int32_t signals, uint32_t millisec);


















osMutexId osMutexCreate (osMutexDef_t *mutex_def);






osStatus osMutexWait (osMutexId mutex_id, uint32_t millisec);





osStatus osMutexRelease (osMutexId mutex_id);




















osSemaphoreId osSemaphoreCreate (osSemaphoreDef_t *semaphore_def, int32_t count);






int32_t osSemaphoreWait (osSemaphoreId semaphore_id, uint32_t millisec);





osStatus osSemaphoreRelease (osSemaphoreId semaphore_id);


























osMessageQId osMessageCreate (osMessageQDef_t *queue_def, osThreadId thread_id);







osStatus osMessagePut (osMessageQId queue_id, uint32_t info, uint32_t millisec);






osEvent osMessageGet (osMessageQId queue_id, uint32_t millisec);













osIsrFuncPtr_t osInstallIsr(uint32_t vector, osIsrFuncPtr_t isrPtr, void *param);



void osGenericISR(void);



void osUnhandledISR(void *param);



void osInterruptEnable(void);



void osInterruptDisable(void);








 














 
void ListInit(listHandle_t list, uint32_t max)
{
  list->head = (( void * )( 0x0UL ));
  list->tail = (( void * )( 0x0UL ));
  list->max = max;
  list->size = 0;
}















 
listHandle_t ListGetList(listElementHandle_t elementHandle)
{
  return elementHandle->list;
}
















 
listStatus_t ListAddTail(listHandle_t list, listElementHandle_t element)
{
  osInterruptDisable();

  if( (list->max != 0) && (list->max == list->size) )
  {
    osInterruptEnable();
    return gListFull_c;
  }

  if(list->size == 0)
  {
    list->head = element;
  }
  else
  {
    list->tail->next = element;
  }
  element->prev = list->tail;
  element->next = (( void * )( 0x0UL ));
  element->list = list;
  list->tail = element;
  list->size++;

  osInterruptEnable();
  return gListOk_c;
}
















 
listStatus_t ListAddHead(listHandle_t list, listElementHandle_t element)
{
  osInterruptDisable();

  if( (list->max != 0) && (list->max == list->size) )
  {
    osInterruptEnable();
    return gListFull_c;
  }

  if(list->size == 0)
  {
    list->tail = element;
  }
  else
  {
    list->head->prev = element;
  }
  element->next = list->head;
  element->prev = (( void * )( 0x0UL ));
  element->list = list;
  list->head = element;
  list->size++;

  osInterruptEnable();
  return gListOk_c;
}















 
listElementHandle_t ListRemoveHead(listHandle_t list)
{
  listElementHandle_t element;

  osInterruptDisable();

  if((( void * )( 0x0UL )) == list || list->size == 0)
  {
    osInterruptEnable();
    return (( void * )( 0x0UL ));  
  }

  element = list->head;
  list->size--;
  if(list->size == 0)
  {
    list->tail = (( void * )( 0x0UL ));
  }
  else
  {
    element->next->prev = (( void * )( 0x0UL ));
  }
  list->head = element->next;  
  element->list = (( void * )( 0x0UL ));

  osInterruptEnable();
  return element;
}















 
listElementHandle_t ListGetHead(listHandle_t list)
{
  return list->head;
}















 
listElementHandle_t ListGetNext(listElementHandle_t element)
{
  return element->next;
}















 
listElementHandle_t ListGetPrev(listElementHandle_t element)
{
  return element->prev;
}















 
listStatus_t ListRemoveElement(listElementHandle_t element)
{
  if(element->list == (( void * )( 0x0UL )))
  {
    return gOrphanElement_c;  
  }

  osInterruptDisable();

  if(element->prev == (( void * )( 0x0UL )))  
  {
    element->list->head = element->next;  
  }
  if(element->next == (( void * )( 0x0UL )))  
  {
    element->list->tail = element->prev;  
  }
  if(element->prev != (( void * )( 0x0UL )))  
  {
    element->prev->next = element->next;
  }
  if(element->next != (( void * )( 0x0UL )))  
  {
    element->next->prev = element->prev;
  }
  element->list->size--;
  element->list = (( void * )( 0x0UL ));

  osInterruptEnable();
  return gListOk_c;
}


















 
listStatus_t ListAddPrevElement(listElementHandle_t element, listElementHandle_t newElement)
{
  if(element->list == (( void * )( 0x0UL )))
  {
    return gOrphanElement_c;  
  }
  osInterruptDisable();

  if( (element->list->max != 0) && (element->list->max == element->list->size) )
  {
    osInterruptEnable();
    return gListFull_c;
  }

  if(element->prev == (( void * )( 0x0UL )))  
  {
    element->list->head = newElement;
  }
  else
  {
    element->prev->next = newElement;
  }
  newElement->list = element->list;
  element->list->size++;
  newElement->next = element;
  newElement->prev = element->prev;
  element->prev = newElement;

  osInterruptEnable();
  return gListOk_c;
}














 
uint32_t ListGetSize(listHandle_t list)
{
  return list->size;
}














 
uint32_t ListGetAvailable(listHandle_t list)
{
  return (list->max - list->size);
}















 

listStatus_t ListTest()
{
  return gListOk_c;
}

