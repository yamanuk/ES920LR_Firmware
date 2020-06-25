






























 





 



































 







 

 
 

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



 
 

  #pragma system_include

 
 

 

  #pragma system_include














 











 


  #pragma system_include


  





 


  




 


  


 


  #pragma inline=forced_no_body
  _Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns") __intrinsic __nounwind void * memcpy(void * _D, const void * _S, size_t _N)
  {
    __aeabi_memcpy(_D, _S, _N);
    return _D;
  }

  #pragma inline=forced_no_body
  _Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns") __intrinsic __nounwind void * memmove(void * _D, const void * _S, size_t _N)
  {
    __aeabi_memmove(_D, _S, _N);
    return _D;
  }

  #pragma inline=forced_no_body
  _Pragma("function_effects = no_state, no_read(1), returns 1, always_returns") __intrinsic __nounwind void * memset(void * _D, int _C, size_t _N)
  {
    __aeabi_memset(_D, _N, _C);
    return _D;
  }




 

 

 

  _Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind   int       memcmp(const void *, const void *,
                                                   size_t);
  _Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns")  __intrinsic __nounwind void *    memcpy(void *restrict,
                                                   const void *restrict,
                                                   size_t);
  _Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns")  __intrinsic __nounwind void *    memmove(void *, const void *,
                                                    size_t);
  _Pragma("function_effects = no_state, no_read(1), returns 1, always_returns")     __intrinsic __nounwind void *    memset(void *, int, size_t);
  _Pragma("function_effects = no_state, no_write(2), returns 1, always_returns")     __intrinsic __nounwind char *    strcat(char *restrict,
                                                   const char *restrict);
  _Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind   int       strcmp(const char *, const char *);
  _Pragma("function_effects = no_write(1,2), always_returns")     __intrinsic __nounwind   int       strcoll(const char *, const char *);
  _Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns")  __intrinsic __nounwind char *    strcpy(char *restrict,
                                                   const char *restrict);
  _Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind   size_t    strcspn(const char *, const char *);
                    __intrinsic __nounwind char *    strerror(int);
  _Pragma("function_effects = no_state, no_write(1), always_returns")      __intrinsic __nounwind   size_t    strlen(const char *);
  _Pragma("function_effects = no_state, no_write(2), returns 1, always_returns")     __intrinsic __nounwind char *    strncat(char *restrict,
                                                    const char *restrict,
                                                    size_t);
  _Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind   int       strncmp(const char *, const char *,
                                                    size_t);
  _Pragma("function_effects = no_state, no_read(1), no_write(2), returns 1, always_returns")  __intrinsic __nounwind char *    strncpy(char *restrict,
                                                    const char *restrict,
                                                    size_t);
  _Pragma("function_effects = no_state, no_write(1,2), always_returns")   __intrinsic __nounwind   size_t    strspn(const char *, const char *);
  _Pragma("function_effects = no_write(2), always_returns")         __intrinsic __nounwind char *    strtok(char *restrict,
                                                   const char *restrict);
  _Pragma("function_effects = no_write(2), always_returns")        __intrinsic __nounwind   size_t    strxfrm(char *restrict,
                                                    const char *restrict,
                                                    size_t);
    _Pragma("function_effects = no_write(1), always_returns")      __intrinsic __nounwind   char *    strdup(const char *);
    _Pragma("function_effects = no_write(1,2), always_returns")   __intrinsic __nounwind   int       strcasecmp(const char *,
                                                       const char *);
    _Pragma("function_effects = no_write(1,2), always_returns")   __intrinsic __nounwind   int       strncasecmp(const char *,
                                                        const char *, size_t);
    _Pragma("function_effects = no_state, no_write(2), always_returns")    __intrinsic __nounwind   char *    strtok_r(char *, const char *,
                                                     char **);
    _Pragma("function_effects = no_state, no_write(1), always_returns")     __intrinsic __nounwind size_t    strnlen(char const *, size_t);


  _Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind void *memchr(const void *_S, int _C, size_t _N);
  _Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind char *strchr(const char *_S, int _C);
  _Pragma("function_effects = no_state, no_write(1,2), always_returns") __intrinsic __nounwind char *strpbrk(const char *_S, const char *_P);
  _Pragma("function_effects = no_state, no_write(1), always_returns")    __intrinsic __nounwind char *strrchr(const char *_S, int _C);
  _Pragma("function_effects = no_state, no_write(1,2), always_returns") __intrinsic __nounwind char *strstr(const char *_S, const char *_P);






 































 







 







 





 
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





 






































 



 


 

 


 





















































































 




 















 



 



 

 

 

 

 


 

 


 




 







 






















































































 





 



 




 







 






 






 





 





 









 





 







 





 





 





 














 








 







 








 






 








 











 





 






 








 







 






 








 









 




 





 





 





 




 





 





 




 




 





 







 





 




 




 




 




 





 






 





 




 








 





 






 






 





 





 





 




 





 




 




 





 





 





 





 





 





 





 





 






 





 





 








 









 







 





 





 





 





 




 




 






 




 



 




 



 




 



 



 




 
 
 





 

 


 

 


 





























 




 


 





 


typedef char *                    char_ptr;     
typedef unsigned char  uchar, *   uchar_ptr;    
typedef volatile char *                    vchar_ptr;     
typedef volatile unsigned char  vuchar, *   vuchar_ptr;    

typedef signed   char   int_8, *   int_8_ptr;    
typedef unsigned char  uint_8, *  uint_8_ptr;   
typedef volatile signed   char   vint_8, *   vint_8_ptr;    
typedef volatile unsigned char  vuint_8, *  vuint_8_ptr;   

typedef          short int_16, *  int_16_ptr;   
typedef unsigned short uint_16, * uint_16_ptr;  
typedef volatile          short vint_16, *  vint_16_ptr;   
typedef volatile unsigned short vuint_16, * vuint_16_ptr;  

typedef          long  int_32, *  int_32_ptr;   

typedef unsigned long  uint_32, * uint_32_ptr;  

typedef volatile          long  vint_32, *  vint_32_ptr;   
typedef volatile unsigned long  vuint_32, * vuint_32_ptr;  

typedef    long  long  int_64, *  int_64_ptr;        
typedef unsigned long long  uint_64, * uint_64_ptr;  
typedef volatile   long  long  vint_64, *  vint_64_ptr;        
typedef volatile unsigned long long  vuint_64, * vuint_64_ptr;  

typedef unsigned long  boolean;   

typedef void *     pointer;   

 
typedef float          ieee_single;

 
typedef double         ieee_double;

 
typedef uint_32  _mqx_uint, * _mqx_uint_ptr;
typedef int_32   _mqx_int,  * _mqx_int_ptr;

 
typedef uint_32  _psp_data_addr, * _psp_data_addr_ptr;

 
typedef uint_32  _psp_code_addr, * _psp_code_addr_ptr;

 
typedef uint_32  _mqx_max_type, * _mqx_max_type_ptr;

 
typedef uint_32 _mem_size, * _mem_size_ptr;

 
typedef uint_32       _file_size;
typedef int_32        _file_offset;


 


 






 


 


 































 










 


 






























 



 
 






 






 





 




 

typedef uint_16 _task_number;        
typedef uint_32 _task_id;            



typedef uint_16 _processor_number;   




 


 



 
 
typedef void (* INT_EXCEPTION_FPTR)(_mqx_uint, _mqx_uint, pointer, pointer);
typedef void (* INT_ISR_FPTR)(pointer);
typedef void (* INT_KERNEL_ISR_FPTR)(void);

 
typedef void (* LWTIMER_ISR_FPTR)(pointer);

 
typedef void (* MQX_EXIT_FPTR)(void);

 
typedef void (* TASK_FPTR)(uint_32);

 
typedef uint_32 (* MQX_GET_HWTICKS_FPTR)(pointer);
typedef void (* TIMER_COMPONENT_ISR_FPTR)(void);
typedef _mqx_uint (* MQX_IPC_FPTR)( boolean, _processor_number, _mqx_uint, _mqx_uint, _mqx_uint, ...);

 
typedef void (* TASK_EXCEPTION_FPTR)(_mqx_uint, pointer);
typedef void (* TASK_EXIT_FPTR)(void);



 




 


 




 


 




 


 

 

 

 

 

 

 

 

 

 

 

 

 

 




 





 




 





 




 







 




 







 



 




 

 

 


 


 

 

 

 






 


 



 



 

 


 
 
typedef pointer _mem_pool_id;


 

 


 

 

 

 


 



typedef uint_16 _mem_type;


 

 


 
typedef struct idle_loop_struct
{
     
    _mqx_uint                   IDLE_LOOP1;
     
    _mqx_uint                   IDLE_LOOP2;
     
    _mqx_uint                   IDLE_LOOP3;
     
    _mqx_uint                   IDLE_LOOP4;

} IDLE_LOOP_STRUCT, * IDLE_LOOP_STRUCT_PTR;






























 
typedef struct mqx_tick_struct
{
    



 
    _mqx_uint TICKS[(((64)+ (32)-1) / (32))];

    



 
    uint_32   HW_TICKS;
} MQX_TICK_STRUCT, * MQX_TICK_STRUCT_PTR;









 
typedef struct   task_template_struct
{
   






 
   _mqx_uint            TASK_TEMPLATE_INDEX;

   




 
   TASK_FPTR            TASK_ADDRESS;

    
   _mem_size            TASK_STACKSIZE;


   




 
   _mqx_uint            TASK_PRIORITY;

    
   char           * TASK_NAME;

   








 
   _mqx_uint             TASK_ATTRIBUTES;

    
   uint_32               CREATION_PARAMETER;

} TASK_TEMPLATE_STRUCT, * TASK_TEMPLATE_STRUCT_PTR;


 











 

typedef  struct mqxlite_initialization_struct
{
    




 
    _mqx_uint       PROCESSOR_NUMBER;

     
    pointer         START_OF_KERNEL_MEMORY;

    




 
    pointer         END_OF_KERNEL_MEMORY;

    




 
    _mqx_uint       MQX_HARDWARE_INTERRUPT_LEVEL_MAX;

    



 
    _mem_size       INTERRUPT_STACK_SIZE;

     
    pointer         INTERRUPT_STACK_LOCATION;

    



 
    _mem_size       IDLE_TASK_STACK_SIZE;

     
    pointer         IDLE_TASK_STACK_LOCATION;

    


 
    TASK_TEMPLATE_STRUCT_PTR    TASK_TEMPLATE_LIST;

} MQXLITE_INITIALIZATION_STRUCT, * MQXLITE_INITIALIZATION_STRUCT_PTR;

 
typedef MQXLITE_INITIALIZATION_STRUCT       MQX_INITIALIZATION_STRUCT;
typedef MQXLITE_INITIALIZATION_STRUCT_PTR   MQX_INITIALIZATION_STRUCT_PTR;

 




































 


 


 







 
typedef struct queue_element_struct
{

     
    struct queue_element_struct * NEXT;

     
    struct queue_element_struct * PREV;

} QUEUE_ELEMENT_STRUCT, * QUEUE_ELEMENT_STRUCT_PTR;


 


 










 

typedef struct queue_struct
{

    




 
    struct queue_element_struct * NEXT;

    




 
    struct queue_element_struct * PREV;

     
    uint_16                           SIZE;

    



 
    uint_16                           MAX;

} QUEUE_STRUCT, * QUEUE_STRUCT_PTR;



 
 


extern QUEUE_ELEMENT_STRUCT_PTR _queue_dequeue  (QUEUE_STRUCT_PTR);
extern boolean                  _queue_enqueue  (QUEUE_STRUCT_PTR,
                                                 QUEUE_ELEMENT_STRUCT_PTR);
extern _mqx_uint                _queue_get_size (QUEUE_STRUCT_PTR);
extern void                     _queue_init     (QUEUE_STRUCT_PTR, uint_16);
extern boolean                  _queue_insert   (QUEUE_STRUCT_PTR,
                                                 QUEUE_ELEMENT_STRUCT_PTR,
                                                 QUEUE_ELEMENT_STRUCT_PTR);
extern boolean                  _queue_is_empty (QUEUE_STRUCT_PTR);
extern QUEUE_ELEMENT_STRUCT_PTR _queue_head     (QUEUE_STRUCT_PTR);
extern QUEUE_ELEMENT_STRUCT_PTR _queue_next     (QUEUE_STRUCT_PTR,
                                                 QUEUE_ELEMENT_STRUCT_PTR);
extern void                     _queue_unlink   (QUEUE_STRUCT_PTR,
                                                 QUEUE_ELEMENT_STRUCT_PTR);
extern _mqx_uint                _queue_test     (QUEUE_STRUCT_PTR,
                                                 pointer *);


 

 




































 




 
 

 
 

 
 
 

 



 



























 
typedef struct lwsem_struct
{

     

    
 
    struct lwsem_struct *  NEXT;

    
 
    struct lwsem_struct *  PREV;

    
 
    QUEUE_STRUCT               TD_QUEUE;

    
 
    _mqx_uint                  VALID;

    


 
    _mqx_int                   VALUE;

} LWSEM_STRUCT, * LWSEM_STRUCT_PTR;




 
 


    extern _mqx_uint        _lwsem_create(LWSEM_STRUCT_PTR, _mqx_int);
    extern _mqx_uint        _lwsem_create_hidden(LWSEM_STRUCT_PTR, _mqx_int);
    extern _mqx_uint        _lwsem_destroy(LWSEM_STRUCT_PTR);
    extern _mqx_uint        _lwsem_poll(LWSEM_STRUCT_PTR);
    extern _mqx_uint        _lwsem_post(LWSEM_STRUCT_PTR);
    extern _mqx_uint        _lwsem_test(pointer *, pointer *);
    extern _mqx_uint        _lwsem_wait(LWSEM_STRUCT_PTR);
    extern _mqx_uint        _lwsem_wait_ticks(LWSEM_STRUCT_PTR, _mqx_uint);
    extern _mqx_uint        _lwsem_wait_for(LWSEM_STRUCT_PTR, MQX_TICK_STRUCT_PTR);
    extern _mqx_uint        _lwsem_wait_until(LWSEM_STRUCT_PTR, MQX_TICK_STRUCT_PTR);



 

 




































 




 


 





 








 

 





 

 


 















 
typedef struct mutex_attr_struct
{

   








 
    _mqx_uint SCHED_PROTOCOL;

   






 
    _mqx_uint VALID;

   


 
    _mqx_uint PRIORITY_CEILING;

   

 
    _mqx_uint COUNT;

   



















 
    _mqx_uint WAIT_PROTOCOL;

} MUTEX_ATTR_STRUCT, * MUTEX_ATTR_STRUCT_PTR;














 
typedef struct mutex_struct
{

    
    QUEUE_ELEMENT_STRUCT  LINK;

   


 
    _mqx_uint             PROTOCOLS;

   




 
    _mqx_uint             VALID;

   




 
    _mqx_uint             PRIORITY_CEILING;

   



 
    _mqx_uint             COUNT;

    
    uint_16               DELAYED_DESTROY;

    
    uchar                 LOCK;

    
    uchar                 FILLER;

   




 
    QUEUE_STRUCT          WAITING_TASKS;

    
    pointer               OWNER_TD;

   


 
    _mqx_uint             BOOSTED;

} MUTEX_STRUCT, * MUTEX_STRUCT_PTR;


 


 


extern _mqx_uint _mutatr_destroy(MUTEX_ATTR_STRUCT_PTR);
extern _mqx_uint _mutatr_get_priority_ceiling(MUTEX_ATTR_STRUCT_PTR, _mqx_uint_ptr);
extern _mqx_uint _mutatr_get_sched_protocol(MUTEX_ATTR_STRUCT_PTR, _mqx_uint_ptr);
extern _mqx_uint _mutatr_get_spin_limit(MUTEX_ATTR_STRUCT_PTR, _mqx_uint_ptr);
extern _mqx_uint _mutatr_get_wait_protocol(MUTEX_ATTR_STRUCT_PTR, _mqx_uint_ptr);
extern _mqx_uint _mutatr_set_priority_ceiling(MUTEX_ATTR_STRUCT_PTR, _mqx_uint);
extern _mqx_uint _mutatr_set_sched_protocol(MUTEX_ATTR_STRUCT_PTR, _mqx_uint);
extern _mqx_uint _mutatr_set_spin_limit(MUTEX_ATTR_STRUCT_PTR, _mqx_uint);
extern _mqx_uint _mutatr_set_wait_protocol(MUTEX_ATTR_STRUCT_PTR, _mqx_uint);
extern _mqx_uint _mutatr_init(MUTEX_ATTR_STRUCT_PTR);

 
extern _mqx_uint _mutex_create_component( void );
extern _mqx_uint _mutex_destroy(MUTEX_STRUCT_PTR);
extern _mqx_uint _mutex_get_priority_ceiling(MUTEX_STRUCT_PTR, _mqx_uint_ptr);
extern _mqx_uint _mutex_get_wait_count(MUTEX_STRUCT_PTR);
extern _mqx_uint _mutex_init(MUTEX_STRUCT_PTR, MUTEX_ATTR_STRUCT_PTR);
extern _mqx_uint _mutex_lock(MUTEX_STRUCT_PTR);
extern _mqx_uint _mutex_set_priority_ceiling(MUTEX_STRUCT_PTR, _mqx_uint, _mqx_uint_ptr);
extern _mqx_uint _mutex_test(pointer *);
extern _mqx_uint _mutex_try_lock(MUTEX_STRUCT_PTR);
extern _mqx_uint _mutex_unlock(MUTEX_STRUCT_PTR);


 

 




































 




 
 

 

 

 






















 
typedef struct lwevent_struct
{
     
    QUEUE_ELEMENT_STRUCT LINK;

     
    QUEUE_STRUCT WAITING_TASKS;

     
    _mqx_uint VALID;

     
    _mqx_uint VALUE;

     
    _mqx_uint FLAGS;

     
    _mqx_uint AUTO;

}LWEVENT_STRUCT, * LWEVENT_STRUCT_PTR;


 
 


extern _mqx_uint _lwevent_create(LWEVENT_STRUCT_PTR, _mqx_uint);
extern _mqx_uint _lwevent_destroy(LWEVENT_STRUCT_PTR);
extern _mqx_uint _lwevent_set(LWEVENT_STRUCT_PTR, _mqx_uint);
extern _mqx_uint _lwevent_set_auto_clear(LWEVENT_STRUCT_PTR, _mqx_uint);
extern _mqx_uint _lwevent_clear(LWEVENT_STRUCT_PTR, _mqx_uint);
extern _mqx_uint _lwevent_wait_for  (LWEVENT_STRUCT_PTR, _mqx_uint,
                                     boolean, MQX_TICK_STRUCT_PTR);
extern _mqx_uint _lwevent_wait_ticks(LWEVENT_STRUCT_PTR, _mqx_uint,
                                     boolean, _mqx_uint);
extern _mqx_uint _lwevent_wait_until(LWEVENT_STRUCT_PTR, _mqx_uint,
                                     boolean, MQX_TICK_STRUCT_PTR);
extern _mqx_uint _lwevent_get_signalled(void);
extern _mqx_uint _lwevent_test(pointer *, pointer *);




 





































 




 


 

 

 

 

 

 

 

 

 



 


 

 


 

 

 






 
typedef struct lwmsgq_struct
{
     
    QUEUE_ELEMENT_STRUCT LINK;

     
    QUEUE_STRUCT WAITING_WRITERS;

     
    QUEUE_STRUCT WAITING_READERS;

     
    _mqx_uint    VALID;

     
    _mqx_uint    MSG_SIZE;

    


 
    _mqx_uint     MAX_SIZE;

     
    _mqx_uint    CURRENT_SIZE;

     
    _mqx_max_type_ptr MSG_WRITE_LOC;

     
    _mqx_max_type_ptr MSG_READ_LOC;

     
    _mqx_max_type_ptr MSG_START_LOC;

     
    _mqx_max_type_ptr MSG_END_LOC;

} LWMSGQ_STRUCT, * LWMSGQ_STRUCT_PTR;

 


 


_mqx_uint _lwmsgq_init(pointer, _mqx_uint, _mqx_uint);
_mqx_uint _lwmsgq_send(pointer, _mqx_max_type_ptr, _mqx_uint);
_mqx_uint _lwmsgq_receive(pointer, _mqx_max_type_ptr, _mqx_uint, _mqx_uint, MQX_TICK_STRUCT_PTR);



 





 


 






























 






























 






























 


 





 





 

 

 

 
 

 

 

 
 

 


 


 
 
 





 






























 



 
 












































 








 




 

 

 



 
 




 




 

 
typedef enum {
  INT_Initial_Stack_Pointer    = 0,                 
  INT_Initial_Program_Counter  = 1,                 
  INT_NMI                      = 2,                 
  INT_Hard_Fault               = 3,                 
  INT_Reserved4                = 4,                 
  INT_Reserved5                = 5,                 
  INT_Reserved6                = 6,                 
  INT_Reserved7                = 7,                 
  INT_Reserved8                = 8,                 
  INT_Reserved9                = 9,                 
  INT_Reserved10               = 10,                
  INT_SVCall                   = 11,                
  INT_Reserved12               = 12,                
  INT_Reserved13               = 13,                
  INT_PendableSrvReq           = 14,                
  INT_SysTick                  = 15,                
  INT_DMA0                     = 16,                
  INT_DMA1                     = 17,                
  INT_DMA2                     = 18,                
  INT_DMA3                     = 19,                
  INT_Reserved20               = 20,                
  INT_FTFA                     = 21,                
  INT_LVD_LVW                  = 22,                
  INT_LLW                      = 23,                
  INT_I2C0                     = 24,                
  INT_I2C1                     = 25,                
  INT_SPI0                     = 26,                
  INT_SPI1                     = 27,                
  INT_UART0                    = 28,                
  INT_UART1                    = 29,                
  INT_UART2                    = 30,                
  INT_ADC0                     = 31,                
  INT_CMP0                     = 32,                
  INT_TPM0                     = 33,                
  INT_TPM1                     = 34,                
  INT_TPM2                     = 35,                
  INT_RTC                      = 36,                
  INT_RTC_Seconds              = 37,                
  INT_PIT                      = 38,                
  INT_I2S0                     = 39,                
  INT_USB0                     = 40,                
  INT_DAC0                     = 41,                
  INT_TSI0                     = 42,                
  INT_MCG                      = 43,                
  INT_LPTimer                  = 44,                
  INT_Reserved45               = 45,                
  INT_PORTA                    = 46,                
  INT_PORTC_PORTD              = 47                 
} IRQInterruptIndex;



   




 




 




 

  #pragma language=extended



 




 

 
typedef struct ADC_MemMap {
  uint32_t SC1[2];                                  
  uint32_t CFG1;                                    
  uint32_t CFG2;                                    
  uint32_t R[2];                                    
  uint32_t CV1;                                     
  uint32_t CV2;                                     
  uint32_t SC2;                                     
  uint32_t SC3;                                     
  uint32_t OFS;                                     
  uint32_t PG;                                      
  uint32_t MG;                                      
  uint32_t CLPD;                                    
  uint32_t CLPS;                                    
  uint32_t CLP4;                                    
  uint32_t CLP3;                                    
  uint32_t CLP2;                                    
  uint32_t CLP1;                                    
  uint32_t CLP0;                                    
  uint8_t RESERVED_0[4];
  uint32_t CLMD;                                    
  uint32_t CLMS;                                    
  uint32_t CLM4;                                    
  uint32_t CLM3;                                    
  uint32_t CLM2;                                    
  uint32_t CLM1;                                    
  uint32_t CLM0;                                    
} volatile *ADC_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct BP_MemMap {
  uint32_t CTRL;                                    
  uint8_t RESERVED_0[4];
  uint32_t COMP[2];                                 
  uint8_t RESERVED_1[4032];
  uint32_t PID4;                                    
  uint32_t PID5;                                    
  uint32_t PID6;                                    
  uint32_t PID7;                                    
  uint32_t PID0;                                    
  uint32_t PID1;                                    
  uint32_t PID2;                                    
  uint32_t PID3;                                    
  uint32_t CID0;                                    
  uint32_t CID1;                                    
  uint32_t CID2;                                    
  uint32_t CID3;                                    
} volatile *BP_MemMapPtr;



 




 


 



   




 




 




   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct CMP_MemMap {
  uint8_t CR0;                                      
  uint8_t CR1;                                      
  uint8_t FPR;                                      
  uint8_t SCR;                                      
  uint8_t DACCR;                                    
  uint8_t MUXCR;                                    
} volatile *CMP_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct CoreDebug_MemMap {
  union {                                           
    uint32_t base_DHCSR_Read;                         
    uint32_t base_DHCSR_Write;                        
  };
  uint32_t base_DCRSR;                              
  uint32_t base_DCRDR;                              
  uint32_t base_DEMCR;                              
} volatile *CoreDebug_MemMapPtr;



 




 


 



   




 




 




   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct DAC_MemMap {
  struct {                                          
    uint8_t DATL;                                     
    uint8_t DATH;                                     
  } DAT[2];
  uint8_t RESERVED_0[28];
  uint8_t SR;                                       
  uint8_t C0;                                       
  uint8_t C1;                                       
  uint8_t C2;                                       
} volatile *DAC_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct DMA_MemMap {
  uint8_t RESERVED_0[256];
  struct {                                          
    uint32_t SAR;                                     
    uint32_t DAR;                                     
    union {                                           
      uint32_t DSR_BCR;                                 
      struct {                                          
        uint8_t RESERVED_0[3];
        uint8_t DSR;                                      
      } DMA_DSR_ACCESS8BIT;
    };
    uint32_t DCR;                                     
  } DMA[4];
} volatile *DMA_MemMapPtr;



 




 


 



   




 




 

 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct DMAMUX_MemMap {
  uint8_t CHCFG[4];                                 
} volatile *DMAMUX_MemMapPtr;



 




 


 



   




 




 

 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct DWT_MemMap {
  uint32_t CTRL;                                    
  uint8_t RESERVED_0[24];
  uint32_t PCSR;                                    
  struct {                                          
    uint32_t COMP;                                    
    uint32_t MASK;                                    
    uint32_t FUNCTION;                                
    uint8_t RESERVED_0[4];
  } COMPARATOR[2];
} volatile *DWT_MemMapPtr;



 




 


 



   




 




 




   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct FGPIO_MemMap {
  uint32_t PDOR;                                    
  uint32_t PSOR;                                    
  uint32_t PCOR;                                    
  uint32_t PTOR;                                    
  uint32_t PDIR;                                    
  uint32_t PDDR;                                    
} volatile *FGPIO_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 



   


 
 
 
 
 
 
 



 




 


 
 
 
 
 
 



   




   




 




 

 
typedef struct FTFA_MemMap {
  uint8_t FSTAT;                                    
  uint8_t FCNFG;                                    
  uint8_t FSEC;                                     
  uint8_t FOPT;                                     
  uint8_t FCCOB3;                                   
  uint8_t FCCOB2;                                   
  uint8_t FCCOB1;                                   
  uint8_t FCCOB0;                                   
  uint8_t FCCOB7;                                   
  uint8_t FCCOB6;                                   
  uint8_t FCCOB5;                                   
  uint8_t FCCOB4;                                   
  uint8_t FCCOBB;                                   
  uint8_t FCCOBA;                                   
  uint8_t FCCOB9;                                   
  uint8_t FCCOB8;                                   
  uint8_t FPROT3;                                   
  uint8_t FPROT2;                                   
  uint8_t FPROT1;                                   
  uint8_t FPROT0;                                   
} volatile *FTFA_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct GPIO_MemMap {
  uint32_t PDOR;                                    
  uint32_t PSOR;                                    
  uint32_t PCOR;                                    
  uint32_t PTOR;                                    
  uint32_t PDIR;                                    
  uint32_t PDDR;                                    
} volatile *GPIO_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 



   


 
 
 
 
 
 
 



 




 


 
 
 
 
 
 



   




   




 




 

 
typedef struct I2C_MemMap {
  uint8_t A1;                                       
  uint8_t F;                                        
  uint8_t C1;                                       
  uint8_t S;                                        
  uint8_t D;                                        
  uint8_t C2;                                       
  uint8_t FLT;                                      
  uint8_t RA;                                       
  uint8_t SMB;                                      
  uint8_t A2;                                       
  uint8_t SLTH;                                     
  uint8_t SLTL;                                     
} volatile *I2C_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 
 



 




 


 
 
 



   




   




 




 

 
typedef struct I2S_MemMap {
  uint32_t TCSR;                                    
  uint8_t RESERVED_0[4];
  uint32_t TCR2;                                    
  uint32_t TCR3;                                    
  uint32_t TCR4;                                    
  uint32_t TCR5;                                    
  uint8_t RESERVED_1[8];
  uint32_t TDR[1];                                  
  uint8_t RESERVED_2[60];
  uint32_t TMR;                                     
  uint8_t RESERVED_3[28];
  uint32_t RCSR;                                    
  uint8_t RESERVED_4[4];
  uint32_t RCR2;                                    
  uint32_t RCR3;                                    
  uint32_t RCR4;                                    
  uint32_t RCR5;                                    
  uint8_t RESERVED_5[8];
  uint32_t RDR[1];                                  
  uint8_t RESERVED_6[60];
  uint32_t RMR;                                     
  uint8_t RESERVED_7[28];
  uint32_t MCR;                                     
  uint32_t MDR;                                     
} volatile *I2S_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct LLWU_MemMap {
  uint8_t PE1;                                      
  uint8_t PE2;                                      
  uint8_t PE3;                                      
  uint8_t PE4;                                      
  uint8_t ME;                                       
  uint8_t F1;                                       
  uint8_t F2;                                       
  uint8_t F3;                                       
  uint8_t FILT1;                                    
  uint8_t FILT2;                                    
} volatile *LLWU_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct LPTMR_MemMap {
  uint32_t CSR;                                     
  uint32_t PSR;                                     
  uint32_t CMR;                                     
  uint32_t CNR;                                     
} volatile *LPTMR_MemMapPtr;



 




 


 



   




 




 

 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct MCG_MemMap {
  uint8_t C1;                                       
  uint8_t C2;                                       
  uint8_t C3;                                       
  uint8_t C4;                                       
  uint8_t C5;                                       
  uint8_t C6;                                       
  uint8_t S;                                        
  uint8_t RESERVED_0[1];
  uint8_t SC;                                       
  uint8_t RESERVED_1[1];
  uint8_t ATCVH;                                    
  uint8_t ATCVL;                                    
  uint8_t C7;                                       
  uint8_t C8;                                       
  uint8_t C9;                                       
  uint8_t C10;                                      
} volatile *MCG_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct MCM_MemMap {
  uint8_t RESERVED_0[8];
  uint16_t PLASC;                                   
  uint16_t PLAMC;                                   
  uint32_t PLACR;                                   
  uint8_t RESERVED_1[48];
  uint32_t CPO;                                     
} volatile *MCM_MemMapPtr;



 




 


 



   




 




 

 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct MTB_MemMap {
  uint32_t POSITION;                                
  uint32_t MASTER;                                  
  uint32_t FLOW;                                    
  uint32_t BASE;                                    
  uint8_t RESERVED_0[3824];
  uint32_t MODECTRL;                                
  uint8_t RESERVED_1[156];
  uint32_t TAGSET;                                  
  uint32_t TAGCLEAR;                                
  uint8_t RESERVED_2[8];
  uint32_t LOCKACCESS;                              
  uint32_t LOCKSTAT;                                
  uint32_t AUTHSTAT;                                
  uint32_t DEVICEARCH;                              
  uint8_t RESERVED_3[8];
  uint32_t DEVICECFG;                               
  uint32_t DEVICETYPID;                             
  uint32_t PERIPHID[8];                             
  uint32_t COMPID[4];                               
} volatile *MTB_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct MTBDWT_MemMap {
  uint32_t CTRL;                                    
  uint8_t RESERVED_0[28];
  struct {                                          
    uint32_t COMP;                                    
    uint32_t MASK;                                    
    uint32_t FCT;                                     
    uint8_t RESERVED_0[4];
  } COMPARATOR[2];
  uint8_t RESERVED_1[448];
  uint32_t TBCTRL;                                  
  uint8_t RESERVED_2[3524];
  uint32_t DEVICECFG;                               
  uint32_t DEVICETYPID;                             
  uint32_t PERIPHID[8];                             
  uint32_t COMPID[4];                               
} volatile *MTBDWT_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct NV_MemMap {
  uint8_t BACKKEY3;                                 
  uint8_t BACKKEY2;                                 
  uint8_t BACKKEY1;                                 
  uint8_t BACKKEY0;                                 
  uint8_t BACKKEY7;                                 
  uint8_t BACKKEY6;                                 
  uint8_t BACKKEY5;                                 
  uint8_t BACKKEY4;                                 
  uint8_t FPROT3;                                   
  uint8_t FPROT2;                                   
  uint8_t FPROT1;                                   
  uint8_t FPROT0;                                   
  uint8_t FSEC;                                     
  uint8_t FOPT;                                     
} volatile *NV_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct NVIC_MemMap {
  uint32_t ISER;                                    
  uint8_t RESERVED_0[124];
  uint32_t ICER;                                    
  uint8_t RESERVED_1[124];
  uint32_t ISPR;                                    
  uint8_t RESERVED_2[124];
  uint32_t ICPR;                                    
  uint8_t RESERVED_3[380];
  uint32_t IP[8];                                   
} volatile *NVIC_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct OSC_MemMap {
  uint8_t CR;                                       
} volatile *OSC_MemMapPtr;



 




 


 



   




 




 

 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct PIT_MemMap {
  uint32_t MCR;                                     
  uint8_t RESERVED_0[220];
  uint32_t LTMR64H;                                 
  uint32_t LTMR64L;                                 
  uint8_t RESERVED_1[24];
  struct {                                          
    uint32_t LDVAL;                                   
    uint32_t CVAL;                                    
    uint32_t TCTRL;                                   
    uint32_t TFLG;                                    
  } CHANNEL[2];
} volatile *PIT_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct PMC_MemMap {
  uint8_t LVDSC1;                                   
  uint8_t LVDSC2;                                   
  uint8_t REGSC;                                    
} volatile *PMC_MemMapPtr;



 




 


 



   




 




 

 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct PORT_MemMap {
  uint32_t PCR[32];                                 
  uint32_t GPCLR;                                   
  uint32_t GPCHR;                                   
  uint8_t RESERVED_0[24];
  uint32_t ISFR;                                    
} volatile *PORT_MemMapPtr;



 




 


 



   




 




 

 
 
 
 



   


 
 
 
 
 
 
 



 




 


 
 
 
 
 
 

 



   




   




 




 

 
typedef struct RCM_MemMap {
  uint8_t SRS0;                                     
  uint8_t SRS1;                                     
  uint8_t RESERVED_0[2];
  uint8_t RPFC;                                     
  uint8_t RPFW;                                     
} volatile *RCM_MemMapPtr;



 




 


 



   




 




 

 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct ROM_MemMap {
  uint32_t ENTRY[3];                                
  uint32_t TABLEMARK;                               
  uint8_t RESERVED_0[4028];
  uint32_t SYSACCESS;                               
  uint32_t PERIPHID4;                               
  uint32_t PERIPHID5;                               
  uint32_t PERIPHID6;                               
  uint32_t PERIPHID7;                               
  uint32_t PERIPHID0;                               
  uint32_t PERIPHID1;                               
  uint32_t PERIPHID2;                               
  uint32_t PERIPHID3;                               
  uint32_t COMPID[4];                               
} volatile *ROM_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 




 

 
typedef struct RTC_MemMap {
  uint32_t TSR;                                     
  uint32_t TPR;                                     
  uint32_t TAR;                                     
  uint32_t TCR;                                     
  uint32_t CR;                                      
  uint32_t SR;                                      
  uint32_t LR;                                      
  uint32_t IER;                                     
} volatile *RTC_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct SCB_MemMap {
  uint8_t RESERVED_0[8];
  uint32_t ACTLR;                                   
  uint8_t RESERVED_1[3316];
  uint32_t CPUID;                                   
  uint32_t ICSR;                                    
  uint32_t VTOR;                                    
  uint32_t AIRCR;                                   
  uint32_t SCR;                                     
  uint32_t CCR;                                     
  uint8_t RESERVED_2[4];
  uint32_t SHPR2;                                   
  uint32_t SHPR3;                                   
  uint32_t SHCSR;                                   
  uint8_t RESERVED_3[8];
  uint32_t DFSR;                                    
} volatile *SCB_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct SIM_MemMap {
  uint32_t SOPT1;                                   
  uint32_t SOPT1CFG;                                
  uint8_t RESERVED_0[4092];
  uint32_t SOPT2;                                   
  uint8_t RESERVED_1[4];
  uint32_t SOPT4;                                   
  uint32_t SOPT5;                                   
  uint8_t RESERVED_2[4];
  uint32_t SOPT7;                                   
  uint8_t RESERVED_3[8];
  uint32_t SDID;                                    
  uint8_t RESERVED_4[12];
  uint32_t SCGC4;                                   
  uint32_t SCGC5;                                   
  uint32_t SCGC6;                                   
  uint32_t SCGC7;                                   
  uint32_t CLKDIV1;                                 
  uint8_t RESERVED_5[4];
  uint32_t FCFG1;                                   
  uint32_t FCFG2;                                   
  uint8_t RESERVED_6[4];
  uint32_t UIDMH;                                   
  uint32_t UIDML;                                   
  uint32_t UIDL;                                    
  uint8_t RESERVED_7[156];
  uint32_t COPC;                                    
  uint32_t SRVCOP;                                  
} volatile *SIM_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct SMC_MemMap {
  uint8_t PMPROT;                                   
  uint8_t PMCTRL;                                   
  uint8_t STOPCTRL;                                 
  uint8_t PMSTAT;                                   
} volatile *SMC_MemMapPtr;



 




 


 



   




 




 

 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct SPI_MemMap {
  uint8_t S;                                        
  uint8_t BR;                                       
  uint8_t C2;                                       
  uint8_t C1;                                       
  uint8_t ML;                                       
  uint8_t MH;                                       
  uint8_t DL;                                       
  uint8_t DH;                                       
  uint8_t RESERVED_0[2];
  uint8_t CI;                                       
  uint8_t C3;                                       
} volatile *SPI_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 



   


 
 
 
 



 




 


 
 
 



   




   




 




 

 
typedef struct SysTick_MemMap {
  uint32_t CSR;                                     
  uint32_t RVR;                                     
  uint32_t CVR;                                     
  uint32_t CALIB;                                   
} volatile *SysTick_MemMapPtr;



 




 


 



   




 




 

 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct TPM_MemMap {
  uint32_t SC;                                      
  uint32_t CNT;                                     
  uint32_t MOD;                                     
  struct {                                          
    uint32_t CnSC;                                    
    uint32_t CnV;                                     
  } CONTROLS[6];
  uint8_t RESERVED_0[20];
  uint32_t STATUS;                                  
  uint8_t RESERVED_1[48];
  uint32_t CONF;                                    
} volatile *TPM_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 



   


 
 
 
 
 



 




 


 
 
 
 

 



   




   




 




 

 
typedef struct TSI_MemMap {
  uint32_t GENCS;                                   
  uint32_t DATA;                                    
  uint32_t TSHD;                                    
} volatile *TSI_MemMapPtr;



 




 


 



   




 




 

 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct UART_MemMap {
  uint8_t BDH;                                      
  uint8_t BDL;                                      
  uint8_t C1;                                       
  uint8_t C2;                                       
  uint8_t S1;                                       
  uint8_t S2;                                       
  uint8_t C3;                                       
  uint8_t D;                                        
  uint8_t C4;                                       
} volatile *UART_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 



   


 
 
 
 



 




 


 
 
 



   




   




 




 

 
typedef struct UART0_MemMap {
  uint8_t BDH;                                      
  uint8_t BDL;                                      
  uint8_t C1;                                       
  uint8_t C2;                                       
  uint8_t S1;                                       
  uint8_t S2;                                       
  uint8_t C3;                                       
  uint8_t D;                                        
  uint8_t MA1;                                      
  uint8_t MA2;                                      
  uint8_t C4;                                       
  uint8_t C5;                                       
} volatile *UART0_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 



   




   




 




 

 
typedef struct USB_MemMap {
  uint8_t PERID;                                    
  uint8_t RESERVED_0[3];
  uint8_t IDCOMP;                                   
  uint8_t RESERVED_1[3];
  uint8_t REV;                                      
  uint8_t RESERVED_2[3];
  uint8_t ADDINFO;                                  
  uint8_t RESERVED_3[3];
  uint8_t OTGISTAT;                                 
  uint8_t RESERVED_4[3];
  uint8_t OTGICR;                                   
  uint8_t RESERVED_5[3];
  uint8_t OTGSTAT;                                  
  uint8_t RESERVED_6[3];
  uint8_t OTGCTL;                                   
  uint8_t RESERVED_7[99];
  uint8_t ISTAT;                                    
  uint8_t RESERVED_8[3];
  uint8_t INTEN;                                    
  uint8_t RESERVED_9[3];
  uint8_t ERRSTAT;                                  
  uint8_t RESERVED_10[3];
  uint8_t ERREN;                                    
  uint8_t RESERVED_11[3];
  uint8_t STAT;                                     
  uint8_t RESERVED_12[3];
  uint8_t CTL;                                      
  uint8_t RESERVED_13[3];
  uint8_t ADDR;                                     
  uint8_t RESERVED_14[3];
  uint8_t BDTPAGE1;                                 
  uint8_t RESERVED_15[3];
  uint8_t FRMNUML;                                  
  uint8_t RESERVED_16[3];
  uint8_t FRMNUMH;                                  
  uint8_t RESERVED_17[3];
  uint8_t TOKEN;                                    
  uint8_t RESERVED_18[3];
  uint8_t SOFTHLD;                                  
  uint8_t RESERVED_19[3];
  uint8_t BDTPAGE2;                                 
  uint8_t RESERVED_20[3];
  uint8_t BDTPAGE3;                                 
  uint8_t RESERVED_21[11];
  struct {                                          
    uint8_t ENDPT;                                    
    uint8_t RESERVED_0[3];
  } ENDPOINT[16];
  uint8_t USBCTRL;                                  
  uint8_t RESERVED_22[3];
  uint8_t OBSERVE;                                  
  uint8_t RESERVED_23[3];
  uint8_t CONTROL;                                  
  uint8_t RESERVED_24[3];
  uint8_t USBTRC0;                                  
  uint8_t RESERVED_25[7];
  uint8_t USBFRMADJUST;                             
} volatile *USB_MemMapPtr;



 




 


 



   




 




 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



   


 
 
 



 




 


 
 

 



   




   




 

  #pragma language=default



   




 




 




   



 











 

 






 











 




































 


 




 

 






 





 



 





 










 



 



 




 

 

 




 



 

 



 




 







 
typedef struct psp_function_call_struct
{

    
   pointer              FP_REGISTER;

    
   void     (* RETURN_ADDRESS)(void);

} PSP_FUNCTION_CALL_STRUCT, * PSP_FUNCTION_CALL_STRUCT_PTR;


 
 


 





 
typedef struct psp_blocked_stack_struct
{
    uint_32 PRIMASK;
    uint_32 R4;
    uint_32 R5;
    uint_32 R6;
    uint_32 R7;
    uint_32 R8;
    uint_32 R9;
    uint_32 R10;
    uint_32 R11;
    uint_32 R0;
    uint_32 R1;
    uint_32 R2;
    uint_32 R3;

    uint_32 R12;
    uint_32 LR;
    uint_32 PC;
    uint_32 PSR;
} PSP_BLOCKED_STACK_STRUCT, * PSP_BLOCKED_STACK_STRUCT_PTR;


 








 
typedef struct psp_int_context_struct
{
     
    struct psp_int_context_struct * PREV_CONTEXT;

     
    uint_32                             EXCEPTION_NUMBER;

     
    uint_32                             ENABLE_SR;

     
    uint_32                             ERROR_CODE;
} PSP_INT_CONTEXT_STRUCT, * PSP_INT_CONTEXT_STRUCT_PTR;


 















 

typedef struct psp_basic_int_frame_struct {
    uint_32 R0;
    uint_32 R1;
    uint_32 R2;
    uint_32 R3;

    uint_32 R12;
    uint_32 LR;
    uint_32 PC;
    uint_32 PSR;
} PSP_BASIC_INT_FRAME_STRUCT, * PSP_BASIC_INT_FRAME_STRUCT_PTR;

 






 
typedef struct psp_stack_start_struct
{
     
    PSP_BLOCKED_STACK_STRUCT    INITIAL_CONTEXT;

    


 
    uint_8                      RESERVED[((~((0x10)-1)) - 5 * sizeof(uint_32)) & 0x7];

     
    pointer                     PREVIOUS_STACK_POINTER;

     
    void                        (* EXIT_ADDRESS)();

     
    uint_32                     PARAMETER;

    

 
     
    pointer                     ZERO_STACK_POINTER;

     
    uint_32                     ZERO_RETURN_ADDRESS;

} PSP_STACK_START_STRUCT, * PSP_STACK_START_STRUCT_PTR;



 


 




 

 












 
typedef struct cortex_syst_struct {
    uint_32 CSR;       
    uint_32 RVR;       
    uint_32 CVR;       
    uint_32 CALIB;     
} CORTEX_SYST_STRUCT, * CORTEX_SYST_STRUCT_PTR;
typedef volatile struct cortex_syst_struct * VCORTEX_SYST_STRUCT_PTR;




 
typedef struct cortex_nvic_struct {
    uint_32 ENABLE[32];
    uint_32 DISABLE[32];
    uint_32 SET[32];
    uint_32 CLR[32];
    uint_32 ACTIVE[32];
    uint_32 rsvd[32];
    uint_32 PRIORITY[32];
} CORTEX_NVIC_STRUCT, * CORTEX_NVIC_STRUCT_PTR;
typedef volatile struct cortex_nvic_struct * VCORTEX_NVIC_STRUCT_PTR;




 
typedef struct cortex_scb_struct {
    uint_32 CPUID;
    uint_32 ICSR;
    uint_32 VTOR;
    uint_32 AIRCR;
    uint_32 SCR;
    uint_32 CCR;
    uint_32 SHPR1;
    uint_32 SHPR2;
    uint_32 SHPR3;
    uint_32 SHCRS;
    uint_32 CFSR;
    uint_32 HFSR;
} CORTEX_SCB_STRUCT, * CORTEX_SCB_STRUCT_PTR;
typedef volatile struct cortex_scb_struct * VCORTEX_SCB_STRUCT_PTR;





 
typedef struct cortex_scs_struct
{
    uchar           filler0[0xe010];
    CORTEX_SYST_STRUCT      SYST;
    uchar           filler1[0xE000E100 - (0xE000E010 + sizeof(CORTEX_SYST_STRUCT))];
    CORTEX_NVIC_STRUCT      NVIC;
    uchar           filler2[0xE000ED00 - (0xE000E100 + sizeof(CORTEX_NVIC_STRUCT))];
    CORTEX_SCB_STRUCT       SCB;
} CORTEX_SCS_STRUCT, * CORTEX_SCS_STRUCT_PTR;
typedef volatile struct cortex_scs_struct * VCORTEX_SCS_STRUCT_PTR;








 
typedef uint_8 _int_level;
typedef uint_8 _int_priority;

 


 


 
_mqx_uint _psp_int_init(_mqx_uint, _mqx_uint);
void _psp_int_install(void);
void __set_MSPI(uint_32);
 
uint_32 _cortex_int_init(_mqx_uint, _int_priority, boolean);
 
uint_32 _cortex_int_enable(_mqx_uint);
 
uint_32 _cortex_int_disable(_mqx_uint);


 
extern void         __enable_interrupt(void);
extern void         __disable_interrupt(void);








 


 

extern void                _int_default_isr(pointer);
extern void                _int_disable(void);
extern void                _int_enable(void);
extern void                _int_exception_isr(pointer);
extern INT_ISR_FPTR        _int_get_default_isr(void);
extern INT_EXCEPTION_FPTR  _int_get_exception_handler(_mqx_uint);
extern INT_ISR_FPTR        _int_get_isr(_mqx_uint);
extern pointer             _int_get_isr_data(_mqx_uint);
extern _mqx_uint           _int_get_isr_depth(void);
extern INT_KERNEL_ISR_FPTR _int_get_kernel_isr(_mqx_uint);
extern _mqx_max_type       _int_get_previous_vector_table(void);
extern _mqx_max_type       _int_get_vector_table(void);
extern _mqx_uint           _int_init(_mqx_uint, _mqx_uint);
extern INT_ISR_FPTR        _int_install_default_isr(INT_ISR_FPTR);
extern INT_KERNEL_ISR_FPTR _int_install_kernel_isr(_mqx_uint, INT_KERNEL_ISR_FPTR);
extern INT_ISR_FPTR        _int_install_isr(_mqx_uint,INT_ISR_FPTR, pointer);
extern INT_ISR_FPTR        _int_install_exception_isr(void);
extern INT_ISR_FPTR        _int_install_unexpected_isr(void);
extern void                _int_kernel_isr(void);
extern INT_EXCEPTION_FPTR  _int_set_exception_handler(_mqx_uint, INT_EXCEPTION_FPTR);
extern pointer             _int_set_isr_data(_mqx_uint, pointer);
extern _mqx_max_type       _int_set_vector_table(_mqx_max_type);
extern void                _int_unexpected_isr(pointer);

 
extern _mqx_uint        _klog_create_at(_mqx_uint, _mqx_uint, pointer);
extern _mqx_uint        _klog_get_interrupt_stack_usage(_mem_size_ptr, _mem_size_ptr);
extern _mqx_uint        _klog_get_task_stack_usage(_task_id, _mem_size_ptr, _mem_size_ptr);
extern void             _klog_control(uint_32, boolean);
extern void             _klog_disable_logging_task(_task_id);
extern boolean          _klog_display(void);
extern void             _klog_enable_logging_task(_task_id);
extern void             _klog_show_stack_usage(void);
extern void             _klog_log(_mqx_uint,_mqx_max_type,_mqx_max_type,_mqx_max_type,_mqx_max_type,_mqx_max_type);
extern void             _klog_log_function(pointer fn);

 
extern void              _mem_zero(pointer, _mem_size);
extern _mqx_uint         _mem_verify(pointer base, pointer extent);
extern _mqx_uint         _mem_test_and_set(uchar_ptr);

extern _mqx_uint         _mqxlite(void);
extern _mqx_uint         _mqxlite_init(MQXLITE_INITIALIZATION_STRUCT const * );

extern const MQX_TICK_STRUCT    _mqx_zero_tick_struct;

extern const uint_32            _mqx_version_number;
extern const char * const       _mqx_vendor;
extern const char * const       _mqx_version;
extern const char * const       _mqx_copyright;
extern const char * const       _mqx_date;
extern const char * const       _mqx_generic_revision;
extern const char * const       _mqx_psp_revision;
extern const uint_32            _mqxlite_version_number;
extern const char * const       _mqxlite_version;

extern void              _mqx_exit(_mqx_uint);
extern void              _mqx_fatal_error(_mqx_uint);
extern _mqx_uint         _mqx_get_counter(void);
extern _mqx_uint         _mqx_get_cpu_type(void);
extern MQXLITE_INITIALIZATION_STRUCT_PTR _mqx_get_initialization(void);
extern pointer           _mqx_get_kernel_data(void);
extern MQX_EXIT_FPTR     _mqx_get_exit_handler(void);
extern _task_id          _mqx_get_system_task_id(void);
extern void              _mqx_idle_task(uint_32);
extern void              _mqx_set_cpu_type(_mqx_uint);
extern void              _mqx_set_exit_handler(MQX_EXIT_FPTR);

extern _mqx_uint         _mqx_get_idle_loop_count(IDLE_LOOP_STRUCT_PTR);


extern _mqx_uint         _sched_get_max_priority(_mqx_uint);
extern _mqx_uint         _sched_get_min_priority(_mqx_uint);
extern void              _sched_yield(void);


extern _mqx_uint         _task_abort(_task_id);
extern void              _task_block(void);
extern _mqx_uint         _task_check_stack(void);
extern _task_id          _task_create_at(_processor_number, _mqx_uint, uint_32, pointer, _mem_size);
extern _mqx_uint         _task_destroy(_task_id);
extern void              _task_disable_fp(void);
extern void              _task_enable_fp(void);
extern _task_id          _task_get_creator(void);
extern pointer           _task_get_environment(_task_id);
extern TASK_EXCEPTION_FPTR _task_get_exception_handler(_task_id);
extern _mqx_uint         _task_get_error(void);
extern _mqx_uint   * _task_get_error_ptr(void);
extern TASK_EXIT_FPTR    _task_get_exit_handler(_task_id);
extern _task_id          _task_get_id(void);
extern _task_id          _task_get_id_from_name(char_ptr);
extern _task_id          _task_get_id_from_td(pointer);
extern _mqx_uint         _task_get_index_from_id(_task_id);
extern uint_32           _task_get_parameter(void);
extern uint_32           _task_get_parameter_for(_task_id);
extern _processor_number _task_get_processor(_task_id);
extern _mqx_uint         _task_get_priority(_task_id, _mqx_uint_ptr);
extern pointer           _task_get_td(_task_id);
extern _mqx_uint         _task_get_template_index(char_ptr);
extern TASK_TEMPLATE_STRUCT_PTR _task_get_template_ptr(_task_id);
extern void              _task_ready(pointer);
extern _mqx_uint         _task_restart(_task_id, uint_32_ptr, boolean);
extern pointer           _task_set_environment(_task_id, pointer);
extern _mqx_uint         _task_set_error(_mqx_uint);
extern TASK_EXCEPTION_FPTR _task_set_exception_handler(_task_id, TASK_EXCEPTION_FPTR);
extern TASK_EXIT_FPTR    _task_set_exit_handler(_task_id, TASK_EXIT_FPTR);
extern uint_32           _task_set_parameter(uint_32);
extern uint_32           _task_set_parameter_for(uint_32, _task_id);
extern _mqx_uint         _task_set_priority(_task_id, _mqx_uint, _mqx_uint_ptr);
extern void              _task_stop_preemption(void);
extern void              _task_start_preemption(void);



extern void             _time_delay_ticks(_mqx_uint);
extern void             _time_delay_for(MQX_TICK_STRUCT_PTR);
extern void             _time_delay_until(MQX_TICK_STRUCT_PTR);
extern _mqx_uint        _time_diff_ticks(MQX_TICK_STRUCT_PTR, MQX_TICK_STRUCT_PTR, MQX_TICK_STRUCT_PTR);
extern int_32           _time_diff_ticks_int32(MQX_TICK_STRUCT_PTR, MQX_TICK_STRUCT_PTR, boolean *);
extern void             _time_get_elapsed_ticks(MQX_TICK_STRUCT_PTR);
extern void             _time_get_elapsed_ticks_fast(MQX_TICK_STRUCT_PTR);
extern uint_32          _time_get_hwticks(void);
extern uint_32          _time_get_hwticks_per_tick(void);
extern void             _time_get_ticks(MQX_TICK_STRUCT_PTR);
extern _mqx_uint        _time_get_ticks_per_sec(void);
extern _mqx_uint        _time_init_ticks(MQX_TICK_STRUCT_PTR, _mqx_uint);
extern void             _time_notify_kernel(void);
extern void             _time_set_hwtick_function(MQX_GET_HWTICKS_FPTR, pointer);
extern void             _time_set_hwticks_per_tick(uint_32);
extern _mqx_uint        _time_set_resolution(_mqx_uint);
extern void             _time_set_ticks(MQX_TICK_STRUCT_PTR);
extern void             _time_set_ticks_per_sec(_mqx_uint);
extern void             _time_set_timer_vector(_mqx_uint);

extern pointer          _crt_tls_reference(void);

 


 










 




































 




 
 











 
typedef struct lwtimer_struct
{

    
   QUEUE_ELEMENT_STRUCT       LINK;

    
   _mqx_uint                  RELATIVE_TICKS;

   


 
   _mqx_uint                  VALID;

    
   LWTIMER_ISR_FPTR           TIMER_FUNCTION;

    
   pointer                    PARAMETER;

    
   pointer                    PERIOD_PTR;

} LWTIMER_STRUCT, * LWTIMER_STRUCT_PTR;













 
typedef struct lwtimer_period_struct
{
    
   QUEUE_ELEMENT_STRUCT       LINK;

   
 
   _mqx_uint                  PERIOD;

    
   _mqx_uint                  EXPIRY;

   
 
   _mqx_uint                  WAIT;

    
   QUEUE_STRUCT               TIMERS;

    
   LWTIMER_STRUCT_PTR         TIMER_PTR;

   
 
   _mqx_uint                  VALID;

} LWTIMER_PERIOD_STRUCT, * LWTIMER_PERIOD_STRUCT_PTR;


 
 


extern _mqx_uint _lwtimer_add_timer_to_queue(LWTIMER_PERIOD_STRUCT_PTR,
   LWTIMER_STRUCT_PTR, _mqx_uint, LWTIMER_ISR_FPTR, pointer);
extern _mqx_uint _lwtimer_cancel_period(LWTIMER_PERIOD_STRUCT_PTR);
extern _mqx_uint _lwtimer_cancel_timer(LWTIMER_STRUCT_PTR);
extern _mqx_uint _lwtimer_create_periodic_queue(LWTIMER_PERIOD_STRUCT_PTR,
   _mqx_uint, _mqx_uint);
extern _mqx_uint _lwtimer_test(pointer *, pointer *);


 






void* osBufferAlloc(uint32_t numBytes);
void osBufferFree(void* buffer);
void TimerMQXLiteCallback(void *argument);
extern void MainThread(void const *argument);
void MainThreadWrapper(void const *argument);

extern const TASK_TEMPLATE_STRUCT MQX_template_list[];

list_t threadList;
uint8_t osHeap[( (5 * sizeof(LWSEM_STRUCT)) + (0 * (sizeof(MUTEX_STRUCT) + sizeof(MUTEX_ATTR_STRUCT))) + (0 * (sizeof(LWTIMER_STRUCT) + sizeof(LWTIMER_PERIOD_STRUCT) + sizeof(void *) + sizeof(void *) + sizeof(os_timer_type))) + (0 * sizeof(LWMSGQ_STRUCT)) + (0 * sizeof(int)) )];
uint8_t *osHeapPtr = osHeap, *lastAllocatedBuffer = ((pointer)0);





 













 
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
  osMainThreadDef.tpriority = (osPriority)((3 + 31) - ((3 + 31)>>1) - MQX_template_list[0]. TASK_PRIORITY);
  osMainThreadDef.tstack = ((pointer)0);
  osMainThreadDef.stacksize = MQX_template_list[0].TASK_STACKSIZE;

  osMainThreadLink.osThreadDefHandle = &osMainThreadDef;
  osMainThreadLink.osThreadId = osThreadGetId();
  osMainThreadLink.osThreadStackHandle = ((pointer)0);
  osMainThreadLink.osThreadSignalHandle = &osMainThreadSignal;

  ListAddTail(&threadList, (listElementHandle_t)&osMainThreadLink.link);

  MainThread(argument);

  while(1);
}















 
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
    return ((pointer)0);
  }

   
  oldPriority = osThreadGetPriority(osThreadGetId());
  osThreadSetPriority(osThreadGetId(), osPriorityRealtime);

  thread_def->instances--;

  stackPtr = thread_def->tstack;
  signalPtr = thread_def->tsignal;
  threadStackPtr = ((pointer)0);

  while(threadStackPtr == ((pointer)0))
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);
    while (threadLinkHandle != ((pointer)0))
    {
      if(stackPtr == threadLinkHandle->osThreadStackHandle)
      {
        break;  
      }
      else
      {
        threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);  
      }
    }
    if(threadLinkHandle == ((pointer)0))
    {
      threadStackPtr = stackPtr;  
      threadSignalPtr = signalPtr;  
      break;
    }
    else
    {
      stackPtr = stackPtr + thread_def->stacksize;  
      signalPtr = signalPtr + sizeof(LWEVENT_STRUCT);  
    }
  }

  threadLinkHandle = thread_def->tlink;

  while(ListGetList((listElementHandle_t)&threadLinkHandle->link) == &threadList)
  {
    threadLinkHandle = threadLinkHandle + 1;  
  }

  TASK_TEMPLATE_INDEX++;

  taskTemplate.TASK_TEMPLATE_INDEX = TASK_TEMPLATE_INDEX;
  taskTemplate.TASK_ADDRESS = (TASK_FPTR)(thread_def->pthread);
  taskTemplate.TASK_STACKSIZE = thread_def->stacksize;
  taskTemplate.TASK_PRIORITY = ((3 + 31) - ((3 + 31)>>1) - thread_def->tpriority);
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

  if(thread_id == ((_task_id)0))
  {
    ListRemoveElement((listElementHandle_t)&threadLinkHandle->link);
    _lwevent_destroy((LWEVENT_STRUCT_PTR)threadSignalPtr);
    thread_def->instances++;
    osThreadSetPriority(osThreadGetId(), oldPriority);
    return ((pointer)0);  
  }
  else
  {
    osThreadSetPriority(osThreadGetId(), oldPriority);
    return thread_id;
  }
}















 
osStatus osThreadTerminate(osThreadId thread_id)
{
  _mqx_uint status;
  osThreadLinkHandle_t threadLinkHandle;
  osPriority oldPriority;

   
  oldPriority = osThreadGetPriority(osThreadGetId());
  osThreadSetPriority(osThreadGetId(), osPriorityRealtime);

  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);
  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);  
    if(threadLinkHandle == ((pointer)0))
    {
      osThreadSetPriority(osThreadGetId(), oldPriority);
      return osErrorParameter;
    }
  }

  threadLinkHandle->osThreadDefHandle->instances++;
  ListRemoveElement((listElementHandle_t)&threadLinkHandle->link);
   
  status = _task_destroy((_task_id)(threadLinkHandle->osThreadId));

  if(status == ((0x0000)|0x12))
  {
    threadLinkHandle->osThreadDefHandle->instances--;
    ListAddTail(&threadList, (listElementHandle_t)&threadLinkHandle->link);
    osThreadSetPriority(osThreadGetId(), oldPriority);
    return osErrorParameter;  
  }

  _lwevent_destroy((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle);

  osThreadSetPriority(osThreadGetId(), oldPriority);
  return osOK;
}














 
osStatus osThreadYield(void)
{
   
  _sched_yield();
  return osOK;
}














 
osThreadId osThreadGetId(void)
{
  osThreadId thread_id;

  thread_id = (void *)_task_get_id();

  return thread_id;
}

















 
osStatus osThreadSetPriority(osThreadId thread_id, osPriority priority)
{
  _mqx_uint newPriority, oldPriority;

   
  if( (priority < osPriorityIdle) || (priority > osPriorityRealtime) )
  {
    return osErrorValue;  
  }

  newPriority = ((3 + 31) - ((3 + 31)>>1) - priority);

  if( _task_get_priority((_task_id)thread_id, &oldPriority) == ((0x0000)|0x12) )
  {
    return osErrorParameter;  
  }
  _task_set_priority((_task_id)thread_id, newPriority, &oldPriority);

  return osOK;
}














 
osPriority osThreadGetPriority(osThreadId thread_id)
{
  _mqx_uint priority;

  if( _task_get_priority((_task_id)thread_id, &priority) == ((0x0000)|0x12))
  {
    return osPriorityError;  
  }
  else
  {
    return (osPriority)((3 + 31) - ((3 + 31)>>1) - priority);
  }
}














 
osStatus osDelay(uint32_t millisec)
{
  _time_delay_ticks(((millisec * _time_get_ticks_per_sec() + 999)/1000));
  return osEventTimeout;  
}














 
osMutexId osMutexCreate (osMutexDef_t *mutex_def)
{
  osMutexId mutex_id;

  MUTEX_ATTR_STRUCT_PTR mutattr;

  (void)mutex_def;

  osInterruptDisable();

  mutex_id =  osBufferAlloc( sizeof(MUTEX_STRUCT) + sizeof(MUTEX_ATTR_STRUCT) );
  if(mutex_id == ((pointer)0))
  {
    osInterruptEnable();
    return ((pointer)0);  
  }

  mutattr = (MUTEX_ATTR_STRUCT_PTR)((uint8_t *)mutex_id + sizeof(MUTEX_STRUCT));

  if (_mutatr_init(mutattr) != (0x00))
  {
    osBufferFree(mutex_id);
    osInterruptEnable();
    return ((pointer)0);  
  }
  if (_mutatr_set_sched_protocol(mutattr, (0x0100)) != (0x00))
  {
    osBufferFree(mutex_id);
    osInterruptEnable();
    return ((pointer)0);  
  }
  if (_mutatr_set_wait_protocol(mutattr, (0x08)) != (0x00))
  {
    osBufferFree(mutex_id);
    osInterruptEnable();
    return ((pointer)0);  
  }

  if (_mutex_init(mutex_id, mutattr) != (0x00))
  {
    osBufferFree(mutex_id);
    osInterruptEnable();
    return ((pointer)0);  
  }

  osInterruptEnable();
  return mutex_id;
}















 
osStatus osMutexRelease(osMutexId  mutex_id)
{
  if( _mutex_unlock(mutex_id) != (0x00) )
  {
    
 
    return osErrorResource;  
  }
  return osOK;
}



















 
osStatus osMutexWait( osMutexId  mutex_id, uint32_t  millisec )
{
  _mqx_uint status;

  if(millisec == 0)
  {
    status = _mutex_try_lock(mutex_id);
  }
  else
  {
    
 
    status = _mutex_lock(mutex_id);
  }

  switch(status)
  {
  case (0x00):
    return osOK;
  case ((0x0000)|0x0D):
    return osErrorISR;  
  case (((0x0000) | 0x0400)|0x10):
    return osErrorParameter;  
  case (((0x0000) | 0x0400)|0x09):
    
 
    return osErrorTimeoutResource;
  case (((0x0000) | 0x0400)|0x06):
    if(millisec == 0)
    {
      return osErrorResource;  
    }
    else
    {
      return osErrorResource;  
    }
  default:
    return osErrorResource;  
  }
}















 
osSemaphoreId osSemaphoreCreate(osSemaphoreDef_t *semaphore_def, int32_t count)
{
  osSemaphoreId semaphore_id;

  (void)semaphore_def;

  osInterruptDisable();

  semaphore_id =  osBufferAlloc( sizeof(LWSEM_STRUCT) );
  if(semaphore_id == ((pointer)0))
  {
    osInterruptEnable();
    return ((pointer)0);  
  }

  if(_lwsem_create(semaphore_id, count) != (0))
  {
    osBufferFree(semaphore_id);
    osInterruptEnable();
    return ((pointer)0);  
  }

  osInterruptEnable();
  return semaphore_id;
}















 
osStatus osSemaphoreRelease(osSemaphoreId semaphore_id)
{
  if(_lwsem_post(semaphore_id) != (0))
  {
    return osErrorParameter; 
 
  }
  else
  {
    return osOK;
  }
}

















 
int32_t osSemaphoreWait(osSemaphoreId semaphore_id, uint32_t millisec)
{
  _mqx_uint status;

  switch(millisec)
  {
  case 0:
    if(_lwsem_poll(semaphore_id) == ((boolean)0))
    {
      return 0;  
    }
    else
    {
      return 1;  
    }
  case 0xFFFFFFFF:
    if(_lwsem_wait(semaphore_id) != (0))
    {
      return -1;  
    }
    else
    {
      return 1;  
    }
  default:
    status = _lwsem_wait_ticks(semaphore_id, ((millisec * _time_get_ticks_per_sec() + 999)/1000));
    switch(status)
    {
    case ((0x0000)|0x37):
      return 0;  
    case (0):
      return 1;  
    default:
      return -1;  
    }
  }
}















 
osMessageQId osMessageCreate(osMessageQDef_t *queue_def, osThreadId thread_id)
{
  osMessageQId queue_id;

  (void)thread_id;

  osInterruptDisable();
  queue_id =  osBufferAlloc( sizeof(LWMSGQ_STRUCT) + (queue_def->queue_sz * sizeof(int)) );
  if(queue_id == ((pointer)0))
  {
    osInterruptEnable();
    return ((pointer)0);  
  }

  if( _lwmsgq_init(queue_id, queue_def->queue_sz, sizeof(int)/sizeof(_mqx_max_type)) != (0) )
  {
    osBufferFree(queue_id);
    osInterruptEnable();
    return ((pointer)0);  
  }

  osInterruptEnable();
  return queue_id;
}

















 
osStatus osMessagePut(osMessageQId queue_id, uint32_t info, uint32_t millisec)
{
  _mqx_uint status;

  
 
  switch(millisec)
  {
  case 0:
    status = _lwmsgq_send(queue_id, (_mqx_max_type_ptr)&info, 0);
    break;
  case 0xFFFFFFFF:
    status = _lwmsgq_send(queue_id, (_mqx_max_type_ptr)&info, (0x01));
    break;
  default:
    status = _lwmsgq_send(queue_id, (_mqx_max_type_ptr)&info, (0x01));
    break;
  }

  switch(status)
  {
  case (0):
    return osOK;  
  case (((0x0000) | 0x0700) | 0x80):
    return osErrorParameter;  
  case (((0x0000) | 0x0700) | 0x81):
    return osErrorResource;  
  default:
    return osErrorResource;  
  }
}





















 
osEvent osMessageGet (osMessageQId queue_id, uint32_t millisec)
{
  _mqx_uint status;
  uint32_t message;
  MQX_TICK_STRUCT ticks;
  osEvent queueNotify;

  switch(millisec)
  {
  case 0:
    status = _lwmsgq_receive(queue_id, (_mqx_max_type_ptr)&message, 0, 0, ((pointer)0));
    break;
  case 0xFFFFFFFF:
    status = _lwmsgq_receive(queue_id, (_mqx_max_type_ptr)&message, (0x04), 0, ((pointer)0));
    break;
  default:
    status = _lwmsgq_receive(queue_id, (_mqx_max_type_ptr)&message, (0x04) | (0x10), ((millisec * _time_get_ticks_per_sec() + 999)/1000), &ticks);
    break;
  }

  switch(status)
  {
  case (0):
    queueNotify.status = osEventMessage;  
    break;
  case (((0x0000) | 0x0700) | 0x80):
    queueNotify.status = osErrorParameter;  
    break;
  case (((0x0000) | 0x0700) | 0x83):
    queueNotify.status = osEventTimeout;  
    break;
  case (((0x0000) | 0x0700) | 0x82):
    queueNotify.status = osOK;  
    break;
  default:
    (void)(((boolean)0));;  
  }
  queueNotify.def.message_id = queue_id;  
  queueNotify.value.v = message;

  return queueNotify;
}















 
int32_t osSignalClear(osThreadId thread_id, int32_t signals)
{
  osThreadLinkHandle_t threadLinkHandle;
  _mqx_uint status;
  int32_t oldSignals;

  if( (signals == 0) || ((uint32_t)(~((1U << 31) - 1U)) & signals) )
  {
    return 0x80000000;  
  }

  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);

  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);
    if(threadLinkHandle == ((pointer)0))
    {
      return 0x80000000;  
    }
  }

  osInterruptDisable();  
  oldSignals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
  status = _lwevent_clear((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, signals);
  osInterruptEnable();

  switch(status)
  {
  case ((0x0000)|0x39):
    return 0x80000000;
  case (0):
    return oldSignals;
  default :
    return 0x80000000;  
  }
}














 
int32_t osSignalGet(osThreadId thread_id)
{
  osThreadLinkHandle_t threadLinkHandle;
  _mqx_uint status;
  int32_t oldSignals;

  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);

  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);
    if(threadLinkHandle == ((pointer)0))
    {
      return 0x80000000;  
    }
  }

  osInterruptDisable();  
  oldSignals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
  status = _lwevent_clear((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, oldSignals);
  osInterruptEnable();

  switch(status)
  {
  case ((0x0000)|0x39):
    return 0x80000000;
  case (0):
    return oldSignals;
  default :
    return 0x80000000;  
  }
}















 
int32_t osSignalSet(osThreadId thread_id, int32_t signals)
{
  osThreadLinkHandle_t threadLinkHandle;
  _mqx_uint status;
  int32_t oldSignals;

  if( (signals == 0) || ((uint32_t)(~((1U << 31) - 1U)) & signals) )
  {
    return 0x80000000;  
  }

  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);

  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);
    if(threadLinkHandle == ((pointer)0))
    {
      return 0x80000000;  
    }
  }

  osInterruptDisable();  
  oldSignals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
  status = _lwevent_set((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, signals);
  osInterruptEnable();

  switch(status)
  {
  case ((0x0000)|0x39):
    return 0x80000000;
  case (0):
    return oldSignals;
  default :
    return 0x80000000;  
  }
}



















 
osEvent osSignalWait(int32_t signals, uint32_t millisec)
{
  osThreadId thread_id;
  osThreadLinkHandle_t threadLinkHandle;
  _mqx_uint status;
  osEvent signalNotify;

  if( (signals != 0) && ((uint32_t)(~((1U << 31) - 1U)) & signals) )
  {
    signalNotify.status = osErrorValue;
    signalNotify.value.signals = 0;
    return signalNotify;  
  }

  thread_id = osThreadGetId();
  threadLinkHandle = (osThreadLinkHandle_t)ListGetHead(&threadList);

  while(threadLinkHandle->osThreadId != thread_id)
  {
    threadLinkHandle = (osThreadLinkHandle_t)ListGetNext((listElementHandle_t)&threadLinkHandle->link);
    if(threadLinkHandle == ((pointer)0))
    {
       
      signalNotify.status = osErrorISR;
      signalNotify.value.signals = 0;
      return signalNotify;
    }
  }

  osInterruptDisable();  

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
                                 (signals)?(signals):((1U << 31) - 1U),
                                 (signals)?(((boolean)1)):(((boolean)0)),
                                 (millisec==0xFFFFFFFF)?0:((millisec * _time_get_ticks_per_sec() + 999)/1000));
    osInterruptDisable();  
    if(((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE & signals == signals)
    {
      status = (0);
    }

    switch(status)
    {
    case (((0x0000) | 0x0300)|0x10):
      signalNotify.value.signals = 0;
      signalNotify.status = osEventTimeout;
      break;
    case (0):
      signalNotify.value.signals = ((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle)->VALUE;
      signalNotify.status = osEventSignal;
      _lwevent_clear((LWEVENT_STRUCT_PTR)threadLinkHandle->osThreadSignalHandle, signalNotify.value.signals);
      break;
    case ((0x0000)|0x0D):
       
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














 
void osInterruptEnable(void)
{
  _int_enable();
}














 
void osInterruptDisable(void)
{
  _int_disable();
}

















 
osIsrFuncPtr_t osInstallIsr(uint32_t vector, osIsrFuncPtr_t isrPtr, void *argument)
{
  return _int_install_isr(vector, isrPtr, argument);
}
















 
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

  if(timer_id == ((pointer)0))
  {
    return ((pointer)0);  
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
















 
osStatus osTimerStart (osTimerId timer_id, uint32_t millisec)
{
  _mqx_uint status;
  LWTIMER_PERIOD_STRUCT_PTR periodStruct;

  periodStruct = (LWTIMER_PERIOD_STRUCT_PTR)((uint8_t*)timer_id+sizeof(LWTIMER_STRUCT));

   
  osInterruptDisable();
  periodStruct->EXPIRY = 0;
  periodStruct->PERIOD = ((millisec * _time_get_ticks_per_sec() + 999)/1000);
  osInterruptEnable();

  _lwtimer_cancel_timer((LWTIMER_STRUCT_PTR)timer_id);
  status = _lwtimer_add_timer_to_queue(
                                       periodStruct,
                                       (LWTIMER_STRUCT_PTR)timer_id,
                                       ((millisec * _time_get_ticks_per_sec() + 999)/1000)-1,
                                       (LWTIMER_ISR_FPTR)TimerMQXLiteCallback,
                                       (void *)timer_id);
  switch(status)
  {
  case (0):
    return osOK;
  case ((0x0000)|0x40):
    return osErrorParameter;
  case ((0x0000)|0x0C):
    return osErrorParameter;  
  default:
    return osErrorResource;  
  }
}
















 
osStatus osTimerStop (osTimerId timer_id)
{
  _mqx_uint status;

  status = _lwtimer_cancel_timer((LWTIMER_STRUCT_PTR)timer_id);
  switch(status)
  {
  case (0):
    return osOK;
  case ((0x0000)|0x40):
    return osErrorParameter;
  default:
    return osErrorResource;  
  }
}





 













 












 
void* osBufferAlloc(uint32_t numBytes)
{
  void *bufferPtr = ((pointer)0);

  if( (( (5 * sizeof(LWSEM_STRUCT)) + (0 * (sizeof(MUTEX_STRUCT) + sizeof(MUTEX_ATTR_STRUCT))) + (0 * (sizeof(LWTIMER_STRUCT) + sizeof(LWTIMER_PERIOD_STRUCT) + sizeof(void *) + sizeof(void *) + sizeof(os_timer_type))) + (0 * sizeof(LWMSGQ_STRUCT)) + (0 * sizeof(int)) ) - (osHeapPtr - osHeap)) >= numBytes )
  {
    bufferPtr = osHeapPtr;
    lastAllocatedBuffer = bufferPtr;
    osHeapPtr += numBytes;
  }

  return bufferPtr;
}














 
void osBufferFree(void* buffer)
{
  if( lastAllocatedBuffer == buffer )
  {
    osHeapPtr = buffer;
  }
}














 
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
