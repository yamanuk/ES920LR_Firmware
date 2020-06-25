






























 






 
































 







 


































 







 

 
 

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






 








 


 

 



 

 

 

 

 

 






 







 





 





 

 
typedef enum{
    gSerialMgrNone_c      = 0,
    gSerialMgrUart_c      = 1,
    gSerialMgrUSB_c       = 2,
    gSerialMgrIICMaster_c = 3,
    gSerialMgrIICSlave_c  = 4,
    gSerialMgrSPIMaster_c = 5,
    gSerialMgrSPISlave_c  = 6
}serialInterfaceType_t;

 
typedef enum {
    gNoBlock_d      = 0,
    gAllowToBlock_d = 1,
}serialBlock_t;


 

 
typedef void (*pSerialCallBack_t)(void*);

 
typedef enum{
    gUARTBaudRate1200_c   =   1200UL,
    gUARTBaudRate2400_c   =   2400UL,
    gUARTBaudRate4800_c   =   4800UL,
    gUARTBaudRate9600_c   =   9600UL,
    gUARTBaudRate19200_c  =  19200UL,
    gUARTBaudRate38400_c  =  38400UL,
    gUARTBaudRate57600_c  =  57600UL,
    gUARTBaudRate115200_c = 115200UL,
    gUARTBaudRate230400_c = 230400UL
}serialUartBaudRate_t;

 
typedef enum{
    gSPI_BaudRate_100000_c  = 100000,
    gSPI_BaudRate_200000_c  = 200000,
    gSPI_BaudRate_400000_c  = 400000,
    gSPI_BaudRate_800000_c  = 800000,
    gSPI_BaudRate_1000000_c = 1000000,
    gSPI_BaudRate_2000000_c = 2000000,
    gSPI_BaudRate_4000000_c = 4000000,
    gSPI_BaudRate_8000000_c = 8000000
}serialSpiBaudRate_t;

 
typedef enum{
    gIIC_BaudRate_50000_c  = 50000,
    gIIC_BaudRate_100000_c = 100000,
    gIIC_BaudRate_200000_c = 200000,
    gIIC_BaudRate_400000_c = 400000,
}serialIicBaudRate_t;

 
typedef enum{
   gSerial_Success_c              = 0,
   gSerial_InvalidParameter_c     = 1,
   gSerial_InvalidInterface_c     = 2,
   gSerial_MaxInterfacesReached_c = 3,
   gSerial_InterfaceNotReady_c    = 4,
   gSerial_InterfaceInUse_c       = 5,
   gSerial_InternalError_c        = 6,
   gSerial_SemCreateError_c       = 7,
   gSerial_OutOfMemory_c          = 8,
   gSerial_OsError_c              = 9,
}serialStatus_t;

 
typedef uint8_t bufIndex_t;





 

 
typedef struct SerialManagetMsg_tag{
    pSerialCallBack_t txCallback;
    void             *pTxParam;
    uint8_t          *pData;
    uint16_t          dataSize;
    uint8_t           flags;
}SerialMsg_t;

 
typedef struct serial_tag{
    void                  *serialIf;
    serialInterfaceType_t  serialType;
    uint8_t                serialChannel;
     
    bufIndex_t             rxIn;
    bufIndex_t             rxOut;
    pSerialCallBack_t      rxCallback;
    void                  *pRxParam;
    uint8_t                rxBuffer[64];
     
    SerialMsg_t            txQueue[10];
    osSemaphoreId          txSyncSem;
    osSemaphoreId          txQueueSem;
    uint8_t                txBlockedTasks;
    uint8_t                txIn;
    uint8_t                txOut;
    uint8_t                txCurrent;
    uint8_t                flags;
}serial_t;





 





 
void SerialManager_Init( void );

serialStatus_t Serial_InitInterface (uint8_t *pInterfaceId,
                                     serialInterfaceType_t interfaceType,
                                     uint8_t channel);
serialStatus_t Serial_SetBaudRate (uint8_t iInterfaceId, uint32_t baudRate);

serialStatus_t Serial_RxBufferByteCount (uint8_t InterfaceId, uint16_t *bytesCount);
serialStatus_t Serial_SetRxCallBack (uint8_t InterfaceId, pSerialCallBack_t cb, void *pRxParam);
serialStatus_t Serial_Read (uint8_t InterfaceId, uint8_t *pData, uint16_t bytesToRead,
                            uint16_t *bytesRead);

serialStatus_t Serial_SyncWrite (uint8_t InterfaceId, uint8_t *pBuf, uint16_t bufLen);
serialStatus_t Serial_AsyncWrite (uint8_t InterfaceId, uint8_t *pBuf, uint16_t bufLen,
                                  pSerialCallBack_t cb, void *pTxParam);

serialStatus_t Serial_Print (uint8_t InterfaceId, char * pString, serialBlock_t allowToBlock);
serialStatus_t Serial_PrintHex (uint8_t InterfaceId, uint8_t *hex, uint8_t len, uint8_t flags);
serialStatus_t Serial_PrintDec (uint8_t InterfaceId, uint32_t nr);
serialStatus_t Serial_PrintBin( uint8_t InterfaceId, uint8_t *data, uint8_t len, serialBlock_t allowToBlock );
serialStatus_t Serial_EnableLowPowerWakeup( serialInterfaceType_t interfaceType);
serialStatus_t Serial_DisableLowPowerWakeup( serialInterfaceType_t interfaceType);
bool_t Serial_IsWakeUpSource( serialInterfaceType_t interfaceType);






























 






 





 








 

typedef uint32_t panicId_t;

typedef struct
{
    panicId_t id;
    uint32_t location;
    uint32_t extra1;
    uint32_t extra2;
    uint32_t linkRegister;
    uint32_t cpsr_contents;    
    uint8_t stack_dump[4];     
} panicData_t;






 






 
void panic
(
    panicId_t id,
    uint32_t location,
    uint32_t extra1,
    uint32_t extra2
);
































 







 































 







 







 





 
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





 




 


 

 
 
 







 
 

 





 
 
typedef enum
{
  MEM_SUCCESS_c = 0,                     
  MEM_INIT_ERROR_c,                      
  MEM_ALLOC_ERROR_c,                     
  MEM_FREE_ERROR_c,                      
  MEM_UNKNOWN_ERROR_c                    
}memStatus_t;





 
 
memStatus_t MEM_Init(void);
 
uint32_t MEM_GetAvailableBlocks(uint32_t size);
 
memStatus_t MEM_BufferFree(void* buffer);
 
void* MEM_BufferAlloc(uint32_t numBytes);
 
uint16_t MEM_BufferGetSize(void* buffer);
 
uint32_t MEM_WriteReadTest(void);





 






 



 
typedef __packed struct listHeader_tag
{
  listElement_t link;
  struct pools_tag *pParentPool;
}listHeader_t;

 
typedef __packed struct pools_tag
{
  list_t anchor; 
  uint16_t nextBlockSize;
  uint16_t blockSize;
}pools_t;

 
typedef __packed struct poolInfo_tag
{
  uint16_t blockSize;
  uint16_t poolSize;
 
}poolInfo_t;





 


































 







 





 





 
 

 

 
 







 
listStatus_t ListAddTailMsg    ( listHandle_t list, void* pMsg );
listStatus_t ListAddHeadMsg    ( listHandle_t list, void* pMsg );
listStatus_t ListAddPrevMsg    ( void* pMsg, void* pNewMsg );
listStatus_t ListRemoveMsg     ( void* pMsg );
void *ListRemoveHeadMsg( listHandle_t list );
void *ListGetHeadMsg   ( listHandle_t list );
void *ListGetNextMsg   ( void* pMsg );

 
































 







 







 





 





 





 












 

void FLib_MemCpy (void* pDst,     
                  void* pSrc,     
                  uint32_t cBytes 
                  );


void FLib_MemCpyAligned32bit (void* from_ptr,
                              void* to_ptr,
                              register uint32_t number_of_bytes);


void FLib_MemCpyDir (void* pBuf1,
                     void* pBuf2,
                     bool_t dir,
                     uint32_t n);












 
void FLib_MemCpyReverseOrder (void* pDst,      
                              void* pSrc,      
                              uint32_t cBytes   
                             );












 
bool_t FLib_MemCmp (void* pData1,   
                    void* pData2,   
                    uint32_t cBytes 
                   );












 
 void FLib_MemSet (void* pData,     
                   uint8_t value,   
                   uint32_t cBytes  
                  );











 
void FLib_MemInPlaceCpy (void* pDst,      
                         void* pSrc,      
                         uint32_t cBytes   
                        );











 
void FLib_MemCopy16Unaligned (void* pDst,      
                              uint16_t val16   
                             );











 
void FLib_MemCopy32Unaligned (void* pDst,      
                              uint32_t val32   
                             );











 
void FLib_MemCopy64Unaligned (void* pDst,     
                              uint64_t val64  
                             );











 
void FLib_AddOffsetToPointer (void** pPtr,
                              uint32_t offset);













 












 









 













































































 










 



 


 





























 





 



 


 
 






















 







 



 


 








 


  #pragma system_include



 










 



  #pragma system_include



 


 


#pragma language=save
#pragma language=extended

__intrinsic __nounwind void    __iar_builtin_no_operation(void);

__intrinsic __nounwind void    __iar_builtin_disable_interrupt(void);
__intrinsic __nounwind void    __iar_builtin_enable_interrupt(void);

typedef unsigned int __istate_t;

__intrinsic __nounwind __istate_t __iar_builtin_get_interrupt_state(void);
__intrinsic __nounwind void __iar_builtin_set_interrupt_state(__istate_t);

 
__intrinsic __nounwind unsigned int __iar_builtin_get_PSR( void );
__intrinsic __nounwind unsigned int __iar_builtin_get_IPSR( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_MSP( void );
__intrinsic __nounwind void         __iar_builtin_set_MSP( unsigned int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_PSP( void );
__intrinsic __nounwind void         __iar_builtin_set_PSP( unsigned int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_PRIMASK( void );
__intrinsic __nounwind void         __iar_builtin_set_PRIMASK( unsigned int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_CONTROL( void );
__intrinsic __nounwind void         __iar_builtin_set_CONTROL( unsigned int );

 
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_FAULTMASK( void );
__intrinsic __nounwind void         __iar_builtin_set_FAULTMASK(unsigned int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_get_BASEPRI( void );
__intrinsic __nounwind void         __iar_builtin_set_BASEPRI( unsigned int );

 
__intrinsic __nounwind void __iar_builtin_disable_irq(void);
__intrinsic __nounwind void __iar_builtin_enable_irq(void);

__intrinsic __nounwind void __iar_builtin_disable_fiq(void);
__intrinsic __nounwind void __iar_builtin_enable_fiq(void);


 

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SWP( unsigned int, volatile unsigned int * );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned char __iar_builtin_SWPB( unsigned char, volatile unsigned char * );

typedef unsigned int __ul;
typedef unsigned int __iar_builtin_uint;


 

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void __iar_builtin_CDP (unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) opc1, unsigned __constrange(0,15) CRd, unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opc2) ;
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void __iar_builtin_CDP2(unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) opc1, unsigned __constrange(0,15) CRd, unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opc2) ;

 
__intrinsic __nounwind void          __iar_builtin_MCR( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __iar_builtin_uint src,
                                unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 )  ;
__intrinsic __nounwind unsigned int __iar_builtin_MRC( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 )  ;
__intrinsic __nounwind void          __iar_builtin_MCR2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1, __iar_builtin_uint src,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 ) ;
__intrinsic __nounwind unsigned int __iar_builtin_MRC2( unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opcode_1,
                                 unsigned __constrange(0,15) CRn, unsigned __constrange(0,15) CRm, unsigned __constrange(0,8) opcode_2 ) ;

__intrinsic __nounwind void __iar_builtin_MCRR (unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opc1, unsigned long long src, unsigned __constrange(0,15) CRm) ;
__intrinsic __nounwind void __iar_builtin_MCRR2(unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opc1, unsigned long long src, unsigned __constrange(0,15) CRm) ;

__intrinsic __nounwind unsigned long long __iar_builtin_MRRC (unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opc1, unsigned __constrange(0,15) CRm) ;
__intrinsic __nounwind unsigned long long __iar_builtin_MRRC2(unsigned __constrange(0,15) coproc, unsigned __constrange(0,8) opc1, unsigned __constrange(0,15) CRm) ;

 
__intrinsic __nounwind void __iar_builtin_LDC  ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src) ;
__intrinsic __nounwind void __iar_builtin_LDCL ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src) ;
__intrinsic __nounwind void __iar_builtin_LDC2 ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src) ;
__intrinsic __nounwind void __iar_builtin_LDC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src) ;

 
__intrinsic __nounwind void __iar_builtin_STC  ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst) ;
__intrinsic __nounwind void __iar_builtin_STCL ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst) ;
__intrinsic __nounwind void __iar_builtin_STC2 ( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst) ;
__intrinsic __nounwind void __iar_builtin_STC2L( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst) ;

 
__intrinsic __nounwind void __iar_builtin_LDC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_LDCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_LDC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_LDC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint const *src,
                                unsigned __constrange(0,255) option);

 
__intrinsic __nounwind void __iar_builtin_STC_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst,
                              unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_STCL_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_STC2_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst,
                               unsigned __constrange(0,255) option);

__intrinsic __nounwind void __iar_builtin_STC2L_noidx( unsigned __constrange(0,15) coproc, unsigned __constrange(0,15) CRn, volatile __iar_builtin_uint *dst,
                                unsigned __constrange(0,255) option);


 
__intrinsic __nounwind unsigned int       __iar_builtin_rsr(__spec_string const char * special_register)   ;
__intrinsic __nounwind unsigned long long __iar_builtin_rsr64(__spec_string const char * special_register) ;
__intrinsic __nounwind void*              __iar_builtin_rsrp(__spec_string const char * special_register)  ;

 
__intrinsic __nounwind void __iar_builtin_wsr(__spec_string const char * special_register, unsigned int value)         ;
__intrinsic __nounwind void __iar_builtin_wsr64(__spec_string const char * special_register, unsigned long long value) ;
__intrinsic __nounwind void __iar_builtin_wsrp(__spec_string const char * special_register, const void *value)         ;

 
__intrinsic __nounwind unsigned int __iar_builtin_get_APSR( void );
__intrinsic __nounwind void         __iar_builtin_set_APSR( unsigned int );

 
__intrinsic __nounwind unsigned int __iar_builtin_get_CPSR( void );
__intrinsic __nounwind void         __iar_builtin_set_CPSR( unsigned int );

 
__intrinsic __nounwind unsigned int __iar_builtin_get_FPSCR( void );
__intrinsic __nounwind void __iar_builtin_set_FPSCR( unsigned int );

 
 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CLZ(unsigned int) ;
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_ROR(unsigned int, unsigned int) ;
__intrinsic __nounwind unsigned int __iar_builtin_RRX(unsigned int);

 
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QADD( signed int, signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QDADD( signed int, signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QSUB( signed int, signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QDSUB( signed int, signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_QDOUBLE( signed int );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int        __iar_builtin_QFlag( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int   __iar_builtin_acle_QFlag(void);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void  __iar_builtin_set_QFlag(int);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void  __iar_builtin_ignore_QFlag(void);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int         __iar_builtin_QCFlag( void );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind void __iar_builtin_reset_QC_flag( void );

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_SMUL( signed short, signed short );

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_REV( unsigned int );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind signed int __iar_builtin_REVSH( short );

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_REV16( unsigned int );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_RBIT( unsigned int );

__intrinsic __nounwind unsigned char  __iar_builtin_LDREXB( volatile unsigned char const * );
__intrinsic __nounwind unsigned short __iar_builtin_LDREXH( volatile unsigned short const * );
__intrinsic __nounwind unsigned int  __iar_builtin_LDREX ( volatile unsigned int const * );
__intrinsic __nounwind unsigned long long __iar_builtin_LDREXD( volatile unsigned long long const * );

__intrinsic __nounwind unsigned int  __iar_builtin_STREXB( unsigned char, volatile unsigned char * );
__intrinsic __nounwind unsigned int  __iar_builtin_STREXH( unsigned short, volatile unsigned short * );
__intrinsic __nounwind unsigned int  __iar_builtin_STREX ( unsigned int, volatile unsigned int * );
__intrinsic __nounwind unsigned int  __iar_builtin_STREXD( unsigned long long, volatile unsigned long long * );

__intrinsic __nounwind void __iar_builtin_CLREX( void );

__intrinsic __nounwind void __iar_builtin_SEV( void );
__intrinsic __nounwind void __iar_builtin_WFE( void );
__intrinsic __nounwind void __iar_builtin_WFI( void );
__intrinsic __nounwind void __iar_builtin_YIELD( void );

__intrinsic __nounwind void __iar_builtin_PLI( volatile void const * );
__intrinsic __nounwind void __iar_builtin_PLD( volatile void const * );

__intrinsic __nounwind void __iar_builtin_PLIx( volatile void const *, unsigned int __constrange(0,2), unsigned int __constrange(0,1));
__intrinsic __nounwind void __iar_builtin_PLDx( volatile void const *, unsigned int __constrange(0, 1), unsigned int __constrange(0, 2), unsigned int __constrange(0, 1));
__intrinsic __nounwind void __iar_builtin_PLDW( volatile void const * );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind signed int   __iar_builtin_SSAT     (signed int val, unsigned int __constrange( 1, 32 ) sat );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USAT     (signed int val, unsigned int __constrange( 0, 31 ) sat );

 
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SEL( unsigned int op1, unsigned int op2 );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SADD8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SADD16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSUB8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSUB16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SADDSUBX (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSUBADDX (unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHADD8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHADD16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHSUB8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHSUB16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHADDSUBX(unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHSUBADDX(unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QADD8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QADD16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QSUB8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QSUB16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QADDSUBX (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QSUBADDX (unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UADD8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UADD16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USUB8    (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USUB16   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UADDSUBX (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USUBADDX (unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHADD8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHADD16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHSUB8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHSUB16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHADDSUBX(unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHSUBADDX(unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQADD8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQADD16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQSUB8   (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQSUB16  (unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQADDSUBX(unsigned int pair1, unsigned int pair2);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQSUBADDX(unsigned int pair1, unsigned int pair2);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USAD8(unsigned int x, unsigned int y );
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USADA8(unsigned int x, unsigned int y,
                                   unsigned int acc );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSAT16   (unsigned int pair,
                                      unsigned int __constrange( 1, 16 ) sat );
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USAT16   (unsigned int pair,
                                      unsigned int __constrange( 0, 15 ) sat );

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMUAD (unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMUSD (unsigned int x, unsigned int y);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMUADX(unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMUSDX(unsigned int x, unsigned int y);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLAD (unsigned int x, unsigned int y, int sum);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLSD (unsigned int x, unsigned int y, int sum);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLADX(unsigned int x, unsigned int y, int sum);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLSDX(unsigned int x, unsigned int y, int sum);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALD (unsigned int pair1,
                                 unsigned int pair2,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALDX(unsigned int pair1,
                                 unsigned int pair2,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLSLD (unsigned int pair1,
                                 unsigned int pair2,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLSLDX(unsigned int pair1,
                                 unsigned int pair2,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_PKHBT(unsigned int x,
                                  unsigned int y,
                                  unsigned __constrange(0,31) count);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_PKHTB(unsigned int x,
                                  unsigned int y,
                                  unsigned __constrange(0,32) count);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLABB(unsigned int x, unsigned int y, int acc);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLABT(unsigned int x, unsigned int y, int acc);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLATB(unsigned int x, unsigned int y, int acc);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLATT(unsigned int x, unsigned int y, int acc);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLAWB(int x, unsigned int y, int acc);
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMLAWT(int x, unsigned int y, int acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMLA (int x, int y, int acc);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMLAR(int x, int y, int acc);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMLS (int x, int y, int acc);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMLSR(int x, int y, int acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMUL (int x, int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMMULR(int x, int y);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULBB(unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULBT(unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULTB(unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULTT(unsigned int x, unsigned int y);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULWB(int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SMULWT(int x, unsigned int y);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SXTAB (int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind int __iar_builtin_SXTAH (int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UXTAB (unsigned int x, unsigned int y);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UXTAH (unsigned int x, unsigned int y);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned long long __iar_builtin_UMAAL(unsigned int x,
                                       unsigned int y,
                                       unsigned int a,
                                       unsigned int b);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALBB(unsigned int x,
                                 unsigned int y,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALBT(unsigned int x,
                                 unsigned int y,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALTB(unsigned int x,
                                 unsigned int y,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind long long __iar_builtin_SMLALTT(unsigned int x,
                                 unsigned int y,
                                 long long acc);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UXTB16(unsigned int x);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UXTAB16(unsigned int acc, unsigned int x);

_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SXTB16(unsigned int x);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SXTAB16(unsigned int acc, unsigned int x);

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SASX(unsigned int, unsigned int) ;
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SSAX(unsigned int, unsigned int) ;
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHASX(unsigned int, unsigned int) ;
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_SHSAX(unsigned int, unsigned int) ;
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QASX(unsigned int, unsigned int) ;
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_QSAX(unsigned int, unsigned int) ;

_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UASX(unsigned int, unsigned int) ;
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_USAX(unsigned int, unsigned int) ;
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHASX(unsigned int, unsigned int) ;
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UHSAX(unsigned int, unsigned int) ;
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQASX(unsigned int, unsigned int) ;
_Pragma("function_effects = hidden_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_UQSAX(unsigned int, unsigned int) ;

 
__intrinsic __nounwind void __iar_builtin_DMB(void);
__intrinsic __nounwind void __iar_builtin_DSB(void);
__intrinsic __nounwind void __iar_builtin_ISB(void);
__intrinsic __nounwind void __iar_builtin_DMBx(unsigned int __constrange(1, 15)) ;
__intrinsic __nounwind void __iar_builtin_DSBx(unsigned int __constrange(1, 15)) ;
__intrinsic __nounwind void __iar_builtin_ISBx(unsigned int __constrange(1, 15)) ;

 
__intrinsic __nounwind unsigned int __iar_builtin_TT(unsigned int);
__intrinsic __nounwind unsigned int __iar_builtin_TTT(unsigned int);
__intrinsic __nounwind unsigned int __iar_builtin_TTA(unsigned int);
__intrinsic __nounwind unsigned int __iar_builtin_TTAT(unsigned int);

__intrinsic __nounwind unsigned int __get_LR(void);
__intrinsic __nounwind void __set_LR(unsigned int);

__intrinsic __nounwind unsigned int __get_SP(void);
__intrinsic __nounwind void __set_SP(unsigned int);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VSQRT_F32(float x);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VSQRT_F64(double x);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VFMA_F32(float x, float y, float z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VFMS_F32(float x, float y, float z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VFNMA_F32(float x, float y, float z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VFNMS_F32(float x, float y, float z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VFMA_F64(double x, double y, double z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VFMS_F64(double x, double y, double z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VFNMA_F64(double x, double y, double z);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VFNMS_F64(double x, double y, double z);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32B(unsigned int crc, unsigned char data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32H(unsigned int crc, unsigned short data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32W(unsigned int crc, unsigned int data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32CB(unsigned int crc, unsigned char data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32CH(unsigned int crc, unsigned short data);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind unsigned int __iar_builtin_CRC32CW(unsigned int crc, unsigned int data);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VMAXNM_F32(float a, float b);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VMINNM_F32(float a, float b);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VMAXNM_F64(double a, double b);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VMINNM_F64(double a, double b);

 
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTA_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTM_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTN_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTP_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTX_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTR_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind float __iar_builtin_VRINTZ_F32(float a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTA_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTM_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTN_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTP_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTX_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTR_F64(double a);
_Pragma("function_effects = no_state, always_returns") __intrinsic __nounwind double __iar_builtin_VRINTZ_F64(double a);

#pragma language=restore













 

  #pragma system_include

 

 

 

 


 




   




 

 

 

 

 

 

 

 

 



 

 

 

   

 

 

 



 









 

 





 
    typedef unsigned char           bool;
typedef unsigned char           byte;
typedef unsigned short          word;
typedef unsigned long           dword;
typedef unsigned long long      dlong;
typedef unsigned char           TPE_ErrCode;
typedef float                   TPE_Float;
typedef char                    char_t;

 
typedef signed char             int8;
typedef signed short int        int16;
typedef signed long int         int32;

typedef unsigned char           uint8;
typedef unsigned short int      uint16;
typedef unsigned long int       uint32;


 
 
 

 

 


 

 






 

 

 

 

 

 

 






 





 
typedef uint32_t LDD_TPinMask;          
typedef uint16_t LDD_TError;            
typedef uint32_t LDD_TEventMask;        
typedef uint8_t LDD_TClockConfiguration;  
typedef void LDD_TDeviceData;           
typedef void* LDD_TDeviceDataPtr;       
typedef void LDD_TData;                 
typedef void LDD_TUserData;             

 
typedef enum {
  DOM_NONE,
  DOM_RUN,
  DOM_WAIT,
  DOM_SLEEP,
  DOM_STOP
} LDD_TDriverOperationMode;

typedef uint16_t LDD_TDriverState;      
typedef void LDD_TCallbackParam;        
typedef void (* LDD_TCallback)(LDD_TCallbackParam *CallbackParam);  

extern LDD_TDeviceData *PE_LDD_DeviceDataList[];  


 
extern void PE_FillMemory(register void* SourceAddressPtr, register uint8_t c, register uint32_t len);






 
 
typedef void *LDD_RTOS_TISRParameter;

 
typedef struct {
  void (*isrFunction)(LDD_RTOS_TISRParameter);  
  LDD_RTOS_TISRParameter isrData;       
} LDD_RTOS_TISRVectorSettings;






 






 

 
typedef enum {
  DIR_UP,                               
  DIR_DOWN                              
} LDD_TimerUnit_TCounterDirection;

 
typedef enum                          {
  OUTPUT_NONE,                          
  OUTPUT_TOGGLE,                        
  OUTPUT_CLEAR,                         
  OUTPUT_SET                            
} LDD_TimerUnit_TOutAction;

 
typedef enum  {
  EDGE_NONE,                            
  EDGE_RISING,                          
  EDGE_FALLING,                         
  EDGE_BOTH                             
} LDD_TimerUnit_TEdge;

typedef float LDD_TimerUnit_Tfloat;     





 





 

typedef float LDD_PPG_Tfloat;           





 





 





 





 





 





 





 

typedef float LDD_RealTime_Tfloat;      





 

 
typedef struct {
  uint16_t Hour;                        
  uint16_t Min;                         
  uint16_t Sec;                         
  uint16_t Sec100;                      
} LDD_TimeDate_TTimeRec;

 
typedef struct {
  uint16_t Year;                        
  uint16_t Month;                       
  uint16_t Day;                         
  uint16_t DayOfWeek;                   
} LDD_TimeDate_TDateRec;





 



typedef uint32_t LDD_SERIAL_TError;     

typedef uint8_t LDD_SERIAL_TDataWidth;  

typedef uint16_t LDD_SERIAL_TSize;      

typedef uint8_t LDD_SERIAL_TBaudMode;   

 
typedef enum {
  LDD_SERIAL_PARITY_UNDEF,              
  LDD_SERIAL_PARITY_NONE,               
  LDD_SERIAL_PARITY_ODD,                
  LDD_SERIAL_PARITY_EVEN,               
  LDD_SERIAL_PARITY_MARK,               
  LDD_SERIAL_PARITY_SPACE               
} LDD_SERIAL_TParity;

 
typedef enum {
  LDD_SERIAL_STOP_BIT_LEN_UNDEF,        
  LDD_SERIAL_STOP_BIT_LEN_1,            
  LDD_SERIAL_STOP_BIT_LEN_1_5,          
  LDD_SERIAL_STOP_BIT_LEN_2             
} LDD_SERIAL_TStopBitLen;

 
typedef struct {
  uint32_t ReceivedChars;               
  uint32_t SentChars;                   
  uint32_t ReceivedBreaks;              
  uint32_t ParityErrors;                
  uint32_t FramingErrors;               
  uint32_t OverrunErrors;               
  uint32_t NoiseErrors;                 
} LDD_SERIAL_TStats;

 
typedef enum {
  LOOPMODE_UNDEF,                       
  LOOPMODE_NORMAL,                      
  LOOPMODE_AUTO_ECHO,                   
  LOOPMODE_LOCAL_LOOPBACK,              
  LOOPMODE_REMOTE_LOOPBACK              
} LDD_SERIAL_TLoopMode;






 






typedef uint32_t LDD_ADC_TErrorMask;    

 
typedef struct {
  uint32_t Channel0_31PinMask;          
  uint32_t Channel32_63PinMask;         
  uint16_t TriggerPinMask;              
  uint8_t  VoltRefPinMask;              
} LDD_ADC_TPinMask;

 
typedef struct {
  uint8_t ChannelIdx;                   
} LDD_ADC_TSample;

 
typedef enum {
  LDD_ADC_LESS_THAN                     = 0x00u,  
  LDD_ADC_GREATER_THAN_OR_EQUAL         = 0x01u,  
  LDD_ADC_INSIDE_RANGE_INCLUSIVE        = 0x02u,  
  LDD_ADC_INSIDE_RANGE_NOT_INCLUSIVE    = 0x03u,  
  LDD_ADC_OUTSIDE_RANGE_INCLUSIVE       = 0x04u,  
  LDD_ADC_OUTSIDE_RANGE_NOT_INCLUSIVE   = 0x05u  
} LDD_ADC_TCompareMode;





 




typedef uint16_t LDD_I2C_TSize;         
typedef uint16_t LDD_I2C_TAddr;         
typedef uint16_t LDD_I2C_TErrorMask;    
typedef bool LDD_I2C_TMode;             

 
typedef enum {
  LDD_I2C_ADDRTYPE_7BITS,               
  LDD_I2C_ADDRTYPE_10BITS,              
  LDD_I2C_ADDRTYPE_GENERAL_CALL         
} LDD_I2C_TAddrType;

 
typedef enum {
  LDD_I2C_NO_SEND_STOP,                 
  LDD_I2C_SEND_STOP                     
} LDD_I2C_TSendStop;

 
typedef enum {
  LDD_I2C_BUSY,                         
  LDD_I2C_IDLE                          
} LDD_I2C_TBusState;

 
typedef enum {
  LDD_I2C_ACK_BYTE,                     
  LDD_I2C_NACK_BYTE                     
} LDD_I2C_TAckType;

 
typedef struct {
  uint32_t MasterSentChars;             
  uint32_t MasterReceivedChars;         
  uint32_t MasterNacks;                 
  uint32_t ArbitLost;                   
  uint32_t SlaveSentChars;              
  uint32_t SlaveReceivedChars;          
  uint32_t SlaveTxUnderrun;             
  uint32_t SlaveRxOverrun;              
  uint32_t SlaveGeneralCallAddr;        
  uint32_t SlaveSmBusCallAddr;          
  uint32_t SlaveSmBusAlertResponse;     
  uint32_t SCLLowTimeout;               
  uint32_t SDALowTimeout;               
} LDD_I2C_TStats;






 


typedef uint8_t LDD_SegLCD_TPinIndex;   
typedef uint8_t LDD_SegLCD_TFrontplaneData;  
typedef uint8_t LDD_SegLCD_TFaultValue;  

 
typedef enum {
  LDD_SEGLCD_BLINK_OFF,                 
  LDD_SEGLCD_BLINK_ALL,                 
  LDD_SEGLCD_BLINK_ALL_ALTERNATE        
} LDD_SegLCD_TBlinking;

 
typedef enum {
  LDD_SEGLCD_BLANK_STATE,               
  LDD_SEGLCD_NORMAL_STATE,              
  LDD_SEGLCD_ALTERNATE_STATE            
} LDD_SegLCD_TSetBlank;

 
typedef enum {
  LDD_SEGLCD_BACKPLANE_PIN,             
  LDD_SEGLCD_FRONTPLANE_PIN             
} LDD_SegLCD_TPinType;






 



typedef uint32_t LDD_GPIO_TBitField;    

 
typedef enum {
  LDD_GPIO_DISABLED = 0x00u,            
  LDD_GPIO_LOW      = 0x00080000u,      
  LDD_GPIO_HIGH     = 0x000C0000u,      
  LDD_GPIO_RISING   = 0x00090000u,      
  LDD_GPIO_FALLING  = 0x000A0000u,      
  LDD_GPIO_BOTH     = 0x000B0000u       
} LDD_GPIO_TEventCondition;             






 





 



typedef uint8_t LDD_ETH_TMACAddress[6];  

 
typedef enum {
  LDD_ETH_FULL_DUPLEX,                  
  LDD_ETH_HALF_DUPLEX                   
} LDD_ETH_TDuplexMode;

 
typedef enum {
  LDD_ETH_PROMISC,                      
  LDD_ETH_REJECT_BC,                    
  LDD_ETH_ACCEPT_BC                     
} LDD_ETH_TFilterMode;

 
typedef enum {
  LDD_ETH_ENABLED,                      
  LDD_ETH_ENABLED_WITH_WAKEUP,          
  LDD_ETH_DISABLED                      
} LDD_ETH_TSleepMode;

 
typedef struct {
  uint8_t  *DataPtr;                    
  uint16_t Size;                        
} LDD_ETH_TBufferDesc;

typedef LDD_ETH_TBufferDesc* LDD_ETH_TBufferDescPtr;  

 
typedef struct {
  uint32_t TxRMONDropEvents;            
  uint32_t TxRMONOctets;                
  uint32_t TxRMONPackets;               
  uint32_t TxRMONBroadcastPackets;      
  uint32_t TxRMONMulticastPackets;      
  uint32_t TxRMONCRCAlignErrors;        
  uint32_t TxRMONUndersizePackets;      
  uint32_t TxRMONOversizePackets;       
  uint32_t TxRMONFragments;             
  uint32_t TxRMONJabbers;               
  uint32_t TxRMONCollisions;            
  uint32_t TxRMONPackets64Octets;       
  uint32_t TxRMONPackets65To127Octets;  
  uint32_t TxRMONPackets128To255Octets;  
  uint32_t TxRMONPackets256To511Octets;  
  uint32_t TxRMONPackets512To1023Octets;  
  uint32_t TxRMONPackets1024To2047Octets;  
  uint32_t TxRMONPacketsGreaterThan2048Octets;  
  uint32_t TxIEEEDrop;                  
  uint32_t TxIEEEFrameOK;               
  uint32_t TxIEEESingleCollision;       
  uint32_t TxIEEEMultipleCollisions;    
  uint32_t TxIEEEDeferralDelay;         
  uint32_t TxIEEELateCollision;         
  uint32_t TxIEEEExcessiveCollision;    
  uint32_t TxIEEEFIFOUnderrun;          
  uint32_t TxIEEECarrierSenseError;     
  uint32_t TxIEEESQEError;              
  uint32_t TxIEEEPauseFrame;            
  uint32_t TxIEEEOctetsOK;              
  uint32_t RxRMONDropEvents;            
  uint32_t RxRMONOctets;                
  uint32_t RxRMONPackets;               
  uint32_t RxRMONBroadcastPackets;      
  uint32_t RxRMONMulticastPackets;      
  uint32_t RxRMONCRCAlignErrors;        
  uint32_t RxRMONUndersizePackets;      
  uint32_t RxRMONOversizePackets;       
  uint32_t RxRMONFragments;             
  uint32_t RxRMONJabbers;               
  uint32_t RxRMONPackets64Octets;       
  uint32_t RxRMONPackets65To127Octets;  
  uint32_t RxRMONPackets128To255Octets;  
  uint32_t RxRMONPackets256To511Octets;  
  uint32_t RxRMONPackets512To1023Octets;  
  uint32_t RxRMONPackets1024To2047Octets;  
  uint32_t RxRMONPacketsGreaterThan2048Octets;  
  uint32_t RxIEEEDrop;                  
  uint32_t RxIEEEFrameOK;               
  uint32_t RxIEEECRCError;              
  uint32_t RxIEEEAlignmentError;        
  uint32_t RxIEEEFIFOOverflow;          
  uint32_t RxIEEEPauseFrame;            
  uint32_t RxIEEEOctetsOK;              
} LDD_ETH_TStats;





 

typedef uint8_t LDD_CAN_TMBIndex;       
typedef uint32_t LDD_CAN_TAccMask;      
typedef uint32_t LDD_CAN_TMessageID;    
typedef uint8_t LDD_CAN_TErrorCounter;  
typedef uint32_t LDD_CAN_TErrorMask;    
typedef uint16_t LDD_CAN_TBufferMask;   





 
typedef enum {
  LDD_CAN_MB_RX_NOT_ACTIVE = 0x00U,
  LDD_CAN_MB_RX_FULL       = 0x02U,
  LDD_CAN_MB_RX_EMPTY      = 0x04U,
  LDD_CAN_MB_RX_OVERRUN    = 0x06U,
  LDD_CAN_MB_RX_BUSY       = 0x01U,
  LDD_CAN_MB_RX_RANSWER    = 0x0AU
} LDD_CAN_TRxBufferState;

 
typedef enum {
  LDD_CAN_DATA_FRAME,                   
  LDD_CAN_REMOTE_FRAME,                 
  LDD_CAN_RESPONSE_FRAME                
} LDD_CAN_TFrameType;

 
typedef struct {
  uint32_t TxFrames;                    
  uint32_t TxWarnings;                  
  uint32_t RxFrames;                    
  uint32_t RxWarnings;                  
  uint32_t BusOffs;                     
  uint32_t Wakeups;                     
  uint32_t Bit0Errors;                  
  uint32_t Bit1Errors;                  
  uint32_t AckErrors;                   
  uint32_t CrcErrors;                   
  uint32_t FormErrors;                  
  uint32_t BitStuffErrors;              
  uint32_t Errors;                      
} LDD_CAN_TStats;

 
typedef struct {
  LDD_CAN_TMessageID MessageID;         
  LDD_CAN_TFrameType FrameType;         
  uint8_t *Data;                        
  uint8_t  Length;                      
  uint16_t TimeStamp;                   
  uint8_t  LocPriority;                 
} LDD_CAN_TFrame;





 

 

 

 

 

 

 

 

 



 
 

 
 
 
 

 

 



 






 



 

 

 



 
typedef enum {
  LDD_USB_LOW_SPEED     = 0x00u,        
  LDD_USB_FULL_SPEED    = 0x01u,        
  LDD_USB_HIGH_SPEED    = 0x02u,        
  LDD_USB_SPEED_UNKNOWN = 0xFFu         
} LDD_USB_TBusSpeed;

 
typedef enum {
  LDD_USB_CONTROL      = 0x00u,         
  LDD_USB_ISOCHRONOUS  = 0x01u,         
  LDD_USB_BULK         = 0x02u,         
  LDD_USB_INTERRUPT    = 0x03u          
} LDD_USB_TTransferType;

 
typedef enum {
  LDD_USB_TRANSFER_NONE               = 0x00u,  
  LDD_USB_TRANSFER_DONE               = 0x01u,  
  LDD_USB_TRANSFER_ERROR_CANCELLED    = 0x02u,  
  LDD_USB_TRANSFER_ERROR_STALLED      = 0x03u,  
  LDD_USB_TRANSFER_ERROR_BUS_TIMEOUT  = 0x04u,  
  LDD_USB_TRANSFER_ERROR_DATA         = 0x05u,  
  LDD_USB_TRANSFER_ERROR_PID          = 0x06u,  
  LDD_USB_TRANSFER_ERROR_EOF          = 0x07u,  
  LDD_USB_TRANSFER_ERROR_CRC16        = 0x08u,  
  LDD_USB_TRANSFER_ERROR_DFN8         = 0x09u,  
  LDD_USB_TRANSFER_ERROR_DMA          = 0x0Au,  
  LDD_USB_TRANSFER_ERROR_BTS          = 0x0Bu,  
  LDD_USB_TRANSFER_ERROR              = 0x0Fu,  
  LDD_USB_TRANSFER_QUEUED             = 0x10u,  
  LDD_USB_TRANSFER_PENDING            = 0x30u  
} LDD_USB_TTransferState;

 
typedef struct LDD_USB_TSDP_Struct {
  uint8_t   bmRequestType;              
  uint8_t   bRequest;                   
  uint16_t  wValue;                     
  uint16_t  wIndex;                     
  uint16_t  wLength;                    
} LDD_USB_TSDP;

 
typedef struct LDD_USB_TEpDescriptor_Struct {
  uint8_t   bLength;                    
  uint8_t   bDescriptorType;            
  uint8_t   bEndpointAddress;           
  uint8_t   bmAttributes;               
  uint16_t  wMaxPacketSize;             
  uint8_t   bInterval;                  
} LDD_USB_TEpDescriptor;

 
typedef struct LDD_USB_TDevDescriptor_Struct {
  uint8_t   bLength;                    
  uint8_t   bDescriptorType;            
  uint16_t  bcdUSB;                     
  uint8_t   bDeviceClass;               
  uint8_t   bDeviceSubClass;            
  uint8_t   bDeviceProtocol;            
  uint8_t   bMaxPacketSize0;            
  uint16_t  idVendor;                   
  uint16_t  idProduct;                  
  uint16_t  bcdDevice;                  
  uint8_t   iManufacturer;              
  uint8_t   iProduct;                   
  uint8_t   iSerialNumber;              
  uint8_t   bNumConfigurations;         
} LDD_USB_TDevDescriptor;


 
struct LDD_USB_Device_TTD_Struct;

 
typedef void (LDD_USB_Device_TTransferDoneCalback)(LDD_TDeviceData *DevDataPtr, struct LDD_USB_Device_TTD_Struct *TrParamPtr);

 
typedef struct LDD_USB_Device_TTD_Head_Struct {
  uint8_t    EpNum;                     
  LDD_TData *BufferPtr;                 
  uint16_t   BufferSize;                
  uint8_t    Flags;                     
} LDD_USB_Device_TTD_Head;

 
typedef struct LDD_USB_Device_TTD_Struct {
   
  LDD_USB_Device_TTD_Head              Head;  
   
   
  LDD_USB_TTransferState               TransferState;  
  uint16_t                             TransmittedDataSize;  
  LDD_USB_Device_TTransferDoneCalback *CallbackFnPtr;  
  uint8_t                             *ParamPtr;  
} LDD_USB_Device_TTD;

 
typedef enum {
  LDD_USB_DEVICE_DISABLED                = (0x100u + 0x00u),  
  LDD_USB_DEVICE_DISABLED_BY_OTG         = (0x100u + 0x01u),  
  LDD_USB_DEVICE_VBUS_OFF                = (0x100u + 0x02u),  
  LDD_USB_DEVICE_VBUS_ON                 = (0x100u + 0x03u),  
  LDD_USB_DEVICE_ENABLED                 = (0x100u + 0x04u),  
  LDD_USB_DEVICE_SUSPENDED               = (0x100u + 0x05u),  
  LDD_USB_DEVICE_SUSPENDED_RESUME_READY  = (0x100u + 0x06u),  
  LDD_USB_DEVICE_RESUME_PENDING          = (0x100u + 0x07u)  
} LDD_USB_Device_TState;

 
typedef enum {
  LDD_USB_HOST_DISABLED                = (0x100u + 0x00u),  
  LDD_USB_HOST_DISABLED_BY_OTG         = (0x100u + 0x01u),  
  LDD_USB_HOST_PORT_POWERED_OFF        = (0x100u + 0x02u),  
  LDD_USB_HOST_PORT_DISCONNECTED       = (0x100u + 0x03u),  
  LDD_USB_HOST_PORT_DISABLED           = (0x100u + 0x04u),  
  LDD_USB_HOST_PORT_RESETING           = (0x100u + 0x05u),  
  LDD_USB_HOST_PORT_RESET_RECOVERING   = (0x100u + 0x06u),  
  LDD_USB_HOST_PORT_ENABLED            = (0x100u + 0x07u),  
  LDD_USB_HOST_PORT_SUSPENDED          = (0x100u + 0x08u),  
  LDD_USB_HOST_PORT_RESUME_READY       = (0x100u + 0x09u),  
  LDD_USB_HOST_PORT_RESUMING           = (0x100u + 0x0Au),  
  LDD_USB_HOST_PORT_RESUME_RECOVERING  = (0x100u + 0x0Bu)  
} LDD_USB_Host_TState;

 
typedef enum {
  LDD_USB_OTG_DISABLED                   = (0x100u + 0x00u),  
  LDD_USB_OTG_ENABLED                    = (0x100u + 0x01u),  
  LDD_USB_OTG_A_IDLE                     = (0x100u + 0x02u),  
  LDD_USB_OTG_A_WAIT_VRISE               = (0x100u + 0x03u),  
  LDD_USB_OTG_A_WAIT_VFALL               = (0x100u + 0x05u),  
  LDD_USB_OTG_A_WAIT_BCON                = (0x100u + 0x07u),  
  LDD_USB_OTG_A_VBUS_ERROR               = (0x100u + 0x09u),  
  LDD_USB_OTG_A_SUSPEND                  = (0x100u + 0x0Au),  
  LDD_USB_OTG_B_IDLE                     = (0x100u + 0x0Cu),  
  LDD_USB_OTG_B_SRP_INIT                 = (0x100u + 0x0Eu),  
  LDD_USB_OTG_B_WAIT_ACON                = (0x100u + 0x0Fu),  
  LDD_USB_OTG_A_HOST                     = (0x100u + 0x10u),  
  LDD_USB_OTG_A_PERIPHERAL               = (0x100u + 0x11u),  
  LDD_USB_OTG_B_HOST                     = (0x100u + 0x12u),  
  LDD_USB_OTG_B_PERIPHERAL               = (0x100u + 0x13u)  
} LDD_USB_Otg_TState;

 
typedef enum {
  LDD_USB_OTG_CMD_SET_A_BUS_REQUEST,    
  LDD_USB_OTG_CMD_CLR_A_BUS_REQUEST,    
  LDD_USB_OTG_CMD_SET_B_BUS_REQUEST,    
  LDD_USB_OTG_CMD_CLR_B_BUS_REQUEST,    
  LDD_USB_OTG_CMD_SET_A_BUS_DROP,       
  LDD_USB_OTG_CMD_CLR_A_BUS_DROP,       
  LDD_USB_OTG_CMD_SET_A_SUSPEND_REQUEST,  
  LDD_USB_OTG_CMD_CLR_A_SUSPEND_REQUEST,  
  LDD_USB_OTG_CMD_SET_A_SET_B_HNP_EN_REQUEST,  
  LDD_USB_OTG_CMD_CLR_A_SET_B_HNP_EN_REQUEST,  
  LDD_USB_OTG_CMD_SET_B_HNP_EN_REQUEST,  
  LDD_USB_OTG_CMD_CLR_B_HNP_EN_REQUEST  
} LDD_USB_Otg_TCmd;

 
typedef enum {
  LDD_USB_HOST_PORT_CMD_POWER_ON,       
  LDD_USB_HOST_PORT_CMD_POWER_OFF,      
  LDD_USB_HOST_PORT_CMD_RESET,          
  LDD_USB_HOST_PORT_CMD_RESUME,         
  LDD_USB_HOST_PORT_CMD_SUSPEND,        
  LDD_USB_HOST_PORT_CMD_DISABLE         
} LDD_USB_Host_TPortControlCmd;

 
typedef void LDD_USB_Host_TPipeHandle;  
typedef void LDD_USB_Host_TTransferHandle;  

 
typedef struct LDD_USB_Host_TPipeDescr_Struct {
  uint8_t                DevAddress;    
  LDD_USB_TBusSpeed      DevSpeed;      
  uint8_t                EpNumber;      
  uint8_t                EpDir;         
  LDD_USB_TTransferType  TransferType;  
  uint16_t               MaxPacketSize;  
  uint8_t                TrPerUFrame;   
  uint32_t               Interval;      
  uint32_t               NAKCount;      
  uint8_t                Flags;         
} LDD_USB_Host_TPipeDescr;

 
typedef void (LDD_USB_Host_TTransferDoneCalback)(
  LDD_TDeviceData        *DevDataPtr,   
  LDD_TData              *BufferPtr,    
  uint16_t                BufferSize,   
  uint8_t                *ParamPtr,     
  LDD_USB_TTransferState  Status        
);

 
typedef struct LDD_USB_Host_TTD_Struct {
  LDD_TData                         *BufferPtr;  
  uint16_t                           BufferSize;  
  uint8_t                            Flags;  
  LDD_USB_Host_TTransferDoneCalback *CallbackFnPtr;  
  uint8_t                           *ParamPtr;  
  LDD_USB_TSDP                      *SDPPrt;  
} LDD_USB_Host_TTD;

 

 

 

 

 

 

 


 

 

 
typedef struct LDD_USB_TGetDecriptorRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint8_t            bDescriptorIndex;  
  uint8_t            bDescriptorType;   
  uint16_t           wLanguageID;       
  uint16_t           wLength;           
} LDD_USB_TGetDecriptorRequest;

 
typedef struct LDD_USB_TEndpointStatusRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint16_t           wValue;            
  uint8_t            bEndpoint;         
  uint8_t            bIndexHigh;        
  uint16_t           wLength;           
} LDD_USB_TEndpointStatusRequest;

 
typedef struct LDD_USB_TEndpointFeatureRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint16_t           wFeatureSelector;  
  uint8_t            bEndpoint;         
  uint8_t            bIndexHigh;        
  uint16_t           wLength;           
} LDD_USB_TEndpointFeatureRequest;

 
typedef struct LDD_USB_TInterfaceFeatureRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint16_t           wFeatureSelector;  
  uint16_t           wInterface;        
  uint16_t           wLength;           
} LDD_USB_TInterfaceFeatureRequest;

 
typedef struct LDD_USB_TDeviceFeatureRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint16_t           wFeatureSelector;  
  uint16_t           wIndex;            
  uint16_t           wLength;           
} LDD_USB_TDeviceFeatureRequest;

 
typedef struct LDD_USB_TGetInterfaceRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint16_t           wWalue;            
  uint16_t           wInterface;        
  uint16_t           wLength;           
} LDD_USB_TGetInterfaceRequest;

 
typedef struct LDD_USB_TSetInterfaceRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint16_t           wAltSet;           
  uint16_t           wInterface;        
  uint16_t           wLength;           
} LDD_USB_TSetInterfaceRequest;

 
typedef struct LDD_USB_TSetAddressRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint8_t            DeviceAddress;     
  uint8_t            bValueHigh;        
  uint16_t           wIndex;            
  uint16_t           wLength;           
} LDD_USB_TSetAddressRequest;

 
typedef struct LDD_USB_TSetConfigRequest_Struct {
  uint8_t            bmRequestType;     
  uint8_t            bRequest;          
  uint8_t            bValueHigh;        
  uint8_t            ConfigNumber;      
  uint16_t           wIndex;            
  uint16_t           wLength;           
} LDD_USB_TSetConfigRequest;





 


 
typedef enum {
  LDD_DAC_BUFFER_NORMAL_MODE          = 0x00U,  
  LDD_DAC_BUFFER_SWING_MODE           = 0x01U,  
  LDD_DAC_BUFFER_SCAN_MODE            = 0x02U  
} LDD_DAC_TBufferMode;

 
typedef enum {
  LDD_DAC_BUFFER_WATERMARK_L1         = 0x00U,
  LDD_DAC_BUFFER_WATERMARK_L2         = 0x01U,
  LDD_DAC_BUFFER_WATERMARK_L3         = 0x02U,
  LDD_DAC_BUFFER_WATERMARK_L4         = 0x03U
} LDD_DAC_TBufferWatermark;


typedef void* LDD_DAC_TDataPtr;         
typedef uint32_t LDD_DAC_TData;         
typedef uint32_t LDD_DAC_TErrorMask;    
typedef uint32_t LDD_DAC_TArrayLength;  





 


 
typedef enum {
  LDD_FLASH_READ_1S_BLOCK             = 0x00u,  
  LDD_FLASH_READ_1S_SECTION           = 0x01u,  
  LDD_FLASH_WRITE_BYTE                = 0x04u,  
  LDD_FLASH_WRITE_WORD                = 0x05u,  
  LDD_FLASH_WRITE_LONG_WORD           = 0x06u,  
  LDD_FLASH_WRITE_PHRASE              = 0x07u,  
  LDD_FLASH_ERASE_FLASH_BLOCK         = 0x08u,  
  LDD_FLASH_ERASE_SECTOR              = 0x09u,  
  LDD_FLASH_ERASE_ALL_FLASH_BLOCKS    = 0x44u  
} LDD_FLASH_TCommand;

 
typedef enum {
  LDD_FLASH_NO_OPERATION,               
  LDD_FLASH_READ,                       
  LDD_FLASH_WRITE,                      
  LDD_FLASH_ERASE,                      
  LDD_FLASH_ERASE_BLOCK,                
  LDD_FLASH_VERIFY_ERASED_BLOCK         
} LDD_FLASH_TOperationType;

 
typedef enum {
  LDD_FLASH_FAILED                    = 0x00u,  
  LDD_FLASH_STOP                      = 0x01u,  
  LDD_FLASH_IDLE                      = 0x02u,  
  LDD_FLASH_STOP_REQ                  = 0x03u,  
  LDD_FLASH_START                     = 0x04u,  
  LDD_FLASH_RUNNING                   = 0x05u  
} LDD_FLASH_TOperationStatus;

typedef uint8_t LDD_FLASH_TErrorFlags;  

typedef uint32_t LDD_FLASH_TAddress;    

typedef uint32_t LDD_FLASH_TDataSize;   

typedef uint16_t LDD_FLASH_TErasableUnitSize;  

 
typedef struct {
  LDD_FLASH_TOperationType CurrentOperation;  
  LDD_FLASH_TCommand       CurrentCommand;  
  LDD_FLASH_TErrorFlags    CurrentErrorFlags;  
  LDD_FLASH_TAddress       CurrentAddress;  
  LDD_TData               *CurrentDataPtr;  
  LDD_FLASH_TDataSize      CurrentDataSize;  
} LDD_FLASH_TErrorStatus;





 


 

 

 

 

 
typedef enum {
  LDD_ANALOGCOMP_INPUT_0 = 0x00U,       
  LDD_ANALOGCOMP_INPUT_1 = 0x01U,       
  LDD_ANALOGCOMP_INPUT_2 = 0x02U,       
  LDD_ANALOGCOMP_INPUT_3 = 0x03U,       
  LDD_ANALOGCOMP_INPUT_4 = 0x04U,       
  LDD_ANALOGCOMP_INPUT_5 = 0x05U,       
  LDD_ANALOGCOMP_INPUT_6 = 0x06U,       
  LDD_ANALOGCOMP_INPUT_7 = 0x07U,       
  LDD_ANALOGCOMP_INPUT_DISABLED = 0x08U  
} LDD_AnalogComp_TComparatorInput;

 
typedef enum {
  LDD_ANALOGCOMP_NO_EDGE = 0x00U,       
  LDD_ANALOGCOMP_FALLING_EDGE = 0x02U,  
  LDD_ANALOGCOMP_RISING_EDGE = 0x04U,   
  LDD_ANALOGCOMP_BOTH_EDGES = 0x06U     
} LDD_AnalogComp_TCompareStatus;

 
typedef enum {
  LDD_ANALOGCOMP_RISING_EDGE_MODE = 0x10U,  
  LDD_ANALOGCOMP_FALLING_EDGE_MODE = 0x08U,  
  LDD_ANALOGCOMP_BOTH_EDGES_MODE = 0x18U  
} LDD_AnalogComp_TComparatorMode;

typedef uint8_t LDD_AnalogComp_TOutputValue;  





 




 
typedef enum {
  LDD_SDHC_SD,                          
  LDD_SDHC_SDIO,                        
  LDD_SDHC_SDCOMBO,                     
  LDD_SDHC_MMC,                         
  LDD_SDHC_CE_ATA                       
} LDD_SDHC_TCardType;

 
typedef struct {
  uint16_t MaxBlockLength;              
  bool     MisalignBlock;               
  bool     PartialBlock;                
} LDD_SDHC_TCardAccess;

 
typedef struct {
  uint16_t SectorSize;                  
  uint8_t  Pattern;                     
} LDD_SDHC_TCardErase;

 
typedef struct {
  uint16_t GroupSize;                   
  bool     Permanent;                   
} LDD_SDHC_TCardWriteProtect;

 
typedef struct {
  uint8_t              DataWidths;      
  uint8_t              Operations;      
  bool                 HighSpeed;       
  bool                 HighCapacity;    
  bool                 LowVoltage;      
  LDD_SDHC_TCardAccess Read;            
  LDD_SDHC_TCardAccess Write;           
  LDD_SDHC_TCardErase  Erase;           
  LDD_SDHC_TCardWriteProtect WriteProtect;  
} LDD_SDHC_TCardCaps;

 
typedef struct {
  LDD_SDHC_TCardType Type;              
  uint16_t           BlockLength;       
  uint32_t           BlockCount;        
  LDD_SDHC_TCardCaps Caps;              
} LDD_SDHC_TCardInfo;

 
typedef enum {
  LDD_SDHC_READ,                        
  LDD_SDHC_WRITE                        
} LDD_SDHC_TTransferOperation;

 
typedef struct {
  uint16_t Size;                        
  uint8_t  *DataPtr;                    
} LDD_SDHC_TBufferDesc;

 
typedef enum {
  LDD_SDHC_LOW_VOLTAGE,                 
  LDD_SDHC_HIGH_VOLTAGE                 
} LDD_SDHC_TVoltage;

 
typedef enum {
  LDD_SDHC_GROUP,                       
  LDD_SDHC_CARD                         
} LDD_SDHC_TWriteProtectType;

 
typedef enum {
  LDD_SDHC_DISABLED,                    
  LDD_SDHC_RESET,                       
  LDD_SDHC_IDLE,                        
  LDD_SDHC_VOLTAGE_VALIDATION,          
  LDD_SDHC_CARD_REGISTRATION,           
  LDD_SDHC_CARD_SELECTION,              
  LDD_SDHC_CARD_INFO_RETRIEVAL,         
  LDD_SDHC_TRANSFER,                    
  LDD_SDHC_ERASION,                     
  LDD_SDHC_IO_REG_TRANSFER,             
  LDD_SDHC_DATA_WIDTH_SELECTION,        
  LDD_SDHC_BUS_CLOCK_SELECTION,         
  LDD_SDHC_WRITE_PROTECTION_SETUP,      
  LDD_SDHC_WRITE_PROTECTION_RETRIEVAL   
} LDD_SDHC_TStatus;

 
typedef enum {
  LDD_SDHC_ERR_OK,                      
  LDD_SDHC_ERR_DMA,                     
  LDD_SDHC_ERR_NOT_SUPPORTED,           
  LDD_SDHC_ERR_TIMEOUT,                 
  LDD_SDHC_ERR_COMMAND_CRC,             
  LDD_SDHC_ERR_DATA_CRC,                
  LDD_SDHC_ERR_ADDRESS_OUT_OF_RANGE,    
  LDD_SDHC_ERR_ADDRESS_MISALIGN,        
  LDD_SDHC_ERR_BLOCK_LEN_ERROR,         
  LDD_SDHC_ERR_WP_VIOLATION,            
  LDD_SDHC_ERR_CARD_IS_LOCKED,          
  LDD_SDHC_ERR_WP_ERASE_SKIP,           
  LDD_SDHC_ERR_INTERNAL_FAILURE,        
  LDD_SDHC_ERR_CARD_FAILURE             
} LDD_SDHC_TError;





 



 


 

typedef void  LDD_DMA_TData;
typedef uint8_t  LDD_DMA_TTransactionSize;  
typedef uint32_t LDD_DMA_TTransactionCount;
typedef uint32_t LDD_DMA_TRequestCount;
typedef uint32_t LDD_DMA_TTransferDataSize;

typedef uint32_t LDD_DMA_TAddress;      
typedef int32_t  LDD_DMA_TAddressOffset;  
typedef uint32_t LDD_DMA_TByteCount;    
typedef uint8_t  LDD_DMA_TTransferSize;  
typedef uint8_t  LDD_DMA_TModuloSize;   
                                        
typedef uint8_t  LDD_DMA_TTriggerSource;  
typedef uint8_t  LDD_DMA_TChannelNumber;  
typedef uint8_t  LDD_DMA_TRecordNumber;  
typedef uint16_t LDD_DMA_TChannelMask;  
typedef uint8_t  LDD_DMA_TChannelPriority;  
typedef uint8_t  LDD_DMA_TOuterLoopCount;  
typedef uint8_t  LDD_DMA_TAfterRequest;  
typedef uint8_t  LDD_DMA_TAfterTransfer;  
typedef uint8_t  LDD_DMA_TBandwidthControl;  
typedef uint32_t LDD_DMA_TErrorFlags;   

 
typedef enum {
  LDD_DMA_IDLE,                         
  LDD_DMA_BUSY,                         
  LDD_DMA_DONE,                         
  LDD_DMA_ERROR                         
} LDD_DMA_TChannelStatus;

 
typedef enum {
  LDD_DMA_TRANSFER_IDLE,                
  LDD_DMA_TRANSFER_BUSY,                
  LDD_DMA_TRANSFER_ERROR                
} LDD_DMA_TTransferState;

 
typedef enum {
  LDD_DMA_CYCLE_STEAL_TRANSFERS,        
  LDD_DMA_SINGLE_TRANSFER,              
  LDD_DMA_NESTED_TRANSFERS              
} LDD_DMA_TTransferMode;

 
typedef enum {
  LDD_DMA_SW_TRIGGER,                   
  LDD_DMA_HW_TRIGGER,                   
  LDD_DMA_ALWAYS_ENABLED_TRIGGER        
} LDD_DMA_TTriggerType;

 
typedef enum {
  LDD_DMA_LINKING_DISABLED,             
  LDD_DMA_CYCLE_STEAL_AND_TRANSFER_COMPLETE_LINKING,  
  LDD_DMA_CYCLE_STEAL_LINKING,          
  LDD_DMA_TRANSFER_COMPLETE_LINKING     
} LDD_DMA_TChannelLinkingMode;

 
typedef struct {
  LDD_DMA_TChannelNumber ChannelNumber;  
  LDD_DMA_TErrorFlags ErrorFlags;       
} LDD_DMA_TError;

 
typedef struct {
  LDD_TUserData                  *UserDataPtr;  
  LDD_DMA_TAddress               SourceAddress;  
  bool                           SourceAddressIncrement;  
  LDD_DMA_TTransferSize          SourceTransferSize;  
  LDD_DMA_TModuloSize            SourceModuloSize;  
  LDD_DMA_TAddress               DestinationAddress;  
  bool                           DestinationAddressIncrement;  
  LDD_DMA_TTransferSize          DestinationTransferSize;  
  LDD_DMA_TModuloSize            DestinationModuloSize;  
  LDD_DMA_TTransferMode          TransferMode;  
  LDD_DMA_TByteCount             ByteCount;  
  bool                           AutoAlign;  
  LDD_DMA_TChannelLinkingMode    ChannelLinkingMode;  
  LDD_DMA_TChannelNumber         InnerLoopLinkedChannel;  
  LDD_DMA_TChannelNumber         OuterLoopLinkedChannel;  
  bool                           ChannelAutoSelection;  
  LDD_DMA_TChannelNumber         ChannelNumber;  
  LDD_DMA_TTriggerType           TriggerType;  
  LDD_DMA_TTriggerSource         TriggerSource;  
  bool                           PeriodicTrigger;  
  bool                           DisableAfterRequest;  
  bool                           AsynchronousRequests;  
  bool                           Interrupts;  
  bool                           OnComplete;  
  bool                           OnError;  
  void (*OnCompleteEventPtr)(LDD_TUserData* UserDataPtr);  
  void (*OnErrorEventPtr)(LDD_TUserData* UserDataPtr);  
  bool                           ChannelEnabled;  
} LDD_DMA_TTransferDescriptor;

typedef LDD_DMA_TTransferDescriptor *LDD_DMA_TTransferDescriptorPtr;  





 




typedef uint32_t LDD_SPIMASTER_TError;  

 
typedef struct {
  uint32_t RxChars;                     
  uint32_t TxChars;                     
  uint32_t RxParityErrors;              
  uint32_t RxOverruns;                  
} LDD_SPIMASTER_TStats;





 




typedef uint32_t LDD_SPISLAVE_TError;   

 
typedef struct {
  uint32_t RxChars;                     
  uint32_t TxChars;                     
  uint32_t RxParityErrors;              
  uint32_t RxOverruns;                  
  uint32_t TxUnderruns;                 
} LDD_SPISLAVE_TStats;





 







typedef uint8_t LDD_SSI_TSectionMask;   

typedef uint32_t LDD_SSI_TError;        

typedef uint32_t LDD_SSI_TComStatus;    

 
typedef struct {
  LDD_TData *Channel0Ptr;               
  LDD_TData *Channel1Ptr;               
} LDD_SSI_TDataBlocks;

 
typedef enum {
  LDD_SSI_READ_COMMAND  = 0x08u,
  LDD_SSI_WRITE_COMMAND = 0x10u
} LDD_SSI_TAC97CommandType;

 
typedef struct {
  LDD_SSI_TAC97CommandType Type;        
  uint32_t Address;                     
  uint32_t Data;                        
} LDD_SSI_TAC97Command;

 
typedef struct {
  uint32_t RxChars;                     
  uint32_t TxChars;                     
  uint32_t RxOverruns;                  
  uint32_t TxUnderruns;                 
  uint32_t RxChars1;                    
  uint32_t TxChars1;                    
  uint32_t RxOverruns1;                 
  uint32_t TxUnderruns1;                
} LDD_SSI_TStats;





 


 
typedef struct {
  uint32_t Second;                      
  uint32_t Minute;                      
  uint32_t Hour;                        
  uint32_t DayOfWeek;                   
  uint32_t Day;                         
  uint32_t Month;                       
  uint32_t Year;                        
} LDD_RTC_TTime;







 


 
typedef enum  {
  LDD_CRC_NO_TRANSPOSE = 0,             
  LDD_CRC_BITS = 1,                     
  LDD_CRC_BITS_AND_BYTES = 2,           
  LDD_CRC_BYTES = 3                     
} LDD_CRC_TTransposeType;

 
typedef enum  {
  LDD_CRC_16,                           
  LDD_CRC_CCITT,                        
  LDD_CRC_MODBUS_16,                    
  LDD_CRC_KERMIT,                       
  LDD_CRC_DNP,                          
  LDD_CRC_32,                           
  LDD_CRC_USER                          
} LDD_CRC_TCRCStandard;

 
typedef struct  {
  bool Width32bit;                      
  bool ResultXORed;                     
  uint16_t SeedLow;                     
  uint16_t SeedHigh;                    
  uint16_t PolyLow;                     
  uint16_t PolyHigh;                    
  LDD_CRC_TTransposeType InputTransposeMode;  
  LDD_CRC_TTransposeType OutputTransposeMode;  
} LDD_CRC_TUserCRCStandard;





 











 



 
typedef enum {
  LDD_RNG_SLEEP_ENABLED,                
  LDD_RNG_SLEEP_DISABLED                
} LDD_RNG_TSleepMode;





 


 
 






 

 

 

typedef uint32_t LDD_NFC_TTargetID;     

 
typedef enum {
  LDD_NFC_CMD_NONE            = 0x00U,  
  LDD_NFC_CMD_RESET           = 0x01U,  
  LDD_NFC_CMD_ERASE           = 0x02U,  
  LDD_NFC_CMD_READ_ID         = 0x03U,  
  LDD_NFC_CMD_READ_PAGES      = 0x04U,  
  LDD_NFC_CMD_WRITE_PAGES     = 0x05U,  
  LDD_NFC_CMD_ERASE_BLOCKS    = 0x06U,  
  LDD_NFC_CMD_READ_RAW_PAGE   = 0x07U,  
  LDD_NFC_CMD_WRITE_RAW_PAGE  = 0x08U   
} LDD_NFC_TeCmd;





 




 
typedef struct {
  LDD_TData *Address;                   
  uint16_t Width;                       
  uint16_t Height;                      
  uint16_t Format;                      
} LDD_LCDC_TBitmap;

 
typedef struct {
  uint16_t X;                           
  uint16_t Y;                           
  uint16_t Width;                       
  uint16_t Height;                      
} LDD_LCDC_TWindow;

 
typedef enum {
  LDD_LCDC_DISABLED = 0,                
  LDD_LCDC_ALWAYS_1,                    
  LDD_LCDC_ALWAYS_0,                    
  LDD_LCDC_COLOR,                       
  LDD_LCDC_INVERTED,                    
  LDD_LCDC_INVERTED_COLOR,              
  LDD_LCDC_AND,                         
  LDD_LCDC_OR,                          
  LDD_LCDC_XOR
} LDD_LCDC_CursorOperation;

 
typedef enum {
  LDD_LCDC_PLANE_COMMON,                
  LDD_LCDC_PLANE_0,                     
  LDD_LCDC_PLANE_1                      
} LDD_LCDC_TPlaneID;






 




 







 




















 






 



 





 







 





















 






 



 



 


 



 







 
 












































 








 




 

 

 



 
 




 




 

 
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



   




 




 




   



 



 

 

 








 

 


typedef struct  {
  uint32_t cpu_core_clk_hz;             
  uint32_t cpu_bus_clk_hz;              
  uint32_t cpu_flexbus_clk_hz;          
  uint32_t cpu_flash_clk_hz;            
  uint32_t cpu_usb_clk_hz;              
  uint32_t cpu_pll_fll_clk_hz;          
  uint32_t cpu_mcgir_clk_hz;            
  uint32_t cpu_oscer_clk_hz;            
  uint32_t cpu_erclk32k_clk_hz;         
  uint32_t cpu_mcgff_clk_hz;            
} TCpuClockConfiguration;

 
extern const TCpuClockConfiguration PE_CpuClockConfigurations[0x02U];

   
  typedef void (*const tIsrFunc)(void);
  typedef struct {
    void * __ptr;
    tIsrFunc __fun[0x2F];
  } tVectorTable;

  extern const tVectorTable __vector_table;
  extern const tVectorTable __vect_table;

 
 
extern volatile uint8_t SR_reg;         
 
extern volatile uint8_t SR_lock;





 










 
 
LDD_TError Cpu_SetClockConfiguration(LDD_TClockConfiguration ModeID);




 







 
 
LDD_TClockConfiguration Cpu_GetClockConfiguration(void);











 
void PE_low_level_init(void);

void Cpu_Interrupt(void);








 

 
int __low_level_init(void);
 








 

 


 



 







 



 

 

 

 


 
typedef struct {
  uint16_t SerFlag;                     
  LDD_SERIAL_TBaudMode BaudMode;        
  bool EnMode;                          
  uint16_t BaudDivisorSpeed1;           
  uint16_t InpRecvDataNum;              
  uint8_t *InpDataPtr;                  
  uint16_t InpDataNumReq;               
  uint16_t OutSentDataNum;              
  uint8_t *OutDataPtr;                  
  uint16_t OutDataNumReq;               
  LDD_RTOS_TISRVectorSettings SavedISRSettings;  
  LDD_TUserData *UserDataPtr;           
} UARTA_TDeviceData;

typedef UARTA_TDeviceData *UARTA_TDeviceDataPtr ;  




 















 
 
LDD_TDeviceData* UARTA_Init(LDD_TUserData *UserDataPtr);




 

























 
 
LDD_TError UARTA_ReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size);




 


























 
 
LDD_TError UARTA_SendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size);




 



































 
 
LDD_TError UARTA_SelectBaudRate(LDD_TDeviceData *DeviceDataPtr, LDD_SERIAL_TBaudMode Mode);










 
 
void UARTA_Interrupt(LDD_RTOS_TISRParameter _isrParameter);











 
void UARTA_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration);

 


 


 







 


 
 

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






 






 






 
static void SerialManagerTask(void const *argument);
serialStatus_t Serial_WriteInternal (uint8_t InterfaceId);
uint16_t Serial_ReadInternal(uint8_t InterfaceId, uint8_t *pData, uint16_t dataSize);

void SerialManager_RxNotify(LDD_TUserData *UserDataPtr);
void SerialManager_TxNotify(LDD_TUserData *UserDataPtr);

static inline serialStatus_t Serial_WriteCommon( uint8_t InterfaceId,
                                  uint8_t *pBuf,
                                  uint16_t bufLen,
                                  pSerialCallBack_t cb,
                                  void *pTxParam,
                                  uint8_t extraFlags);
static void Serial_TxQueueMaintenance(serial_t *pSer);





 
 
typedef enum{
    gSMGR_Rx_c     = (1<<0),
    gSMGR_TxDone_c = (1<<1),
    gSMGR_TxNew_c  = (1<<2)
}serialEventType_t;





 
extern void (*SerialManager_RxNotify_fptr)(LDD_TUserData*);
extern void (*SerialManager_TxNotify_fptr)(LDD_TUserData*);
extern void (*SerialManager_IICErrorNotify_fptr)(LDD_TUserData*);





 
osThreadLink_t osThreadLink_SerialManagerTask[1] = {0}; uint8_t osThread_SerialManagerTask_stack[(700)*(1)]; uint8_t osThread_SerialManagerTask_signal[36 * (1)]; osThreadDef_t os_thread_def_SerialManagerTask = { (SerialManagerTask), (osPriorityBelowNormal), (1), (700), osThread_SerialManagerTask_stack, osThread_SerialManagerTask_signal, osThreadLink_SerialManagerTask, {"SerialManagerTask"}};
osThreadId  gSerialManagerTaskId = (( void * )( 0x0UL ));
serial_t    mSerials[1];





 




 
void SerialManager_Init( void )
{
     
    if( gSerialManagerTaskId )
        return;


    SerialManager_RxNotify_fptr = SerialManager_RxNotify;
    SerialManager_TxNotify_fptr = SerialManager_TxNotify;

     
    FLib_MemSet( mSerials, 0x00, sizeof(mSerials) );

    gSerialManagerTaskId = osThreadCreate(&os_thread_def_SerialManagerTask, (( void * )( 0x0UL )));
}






 
static void SerialManagerTask(void const *argument)
{
    uint16_t i;
    uint8_t ev;

    for( i = 0; i < 1; i++ )
        mSerials[i].txCurrent = (0xFF);

    while( 1 )
    {
         
        osSignalWait( 0, 0xFFFFFFFF );

        for( i = 0; i < 1; i++ )
        {
            osInterruptDisable();
            ev = mSerials[i].flags;
            mSerials[i].flags = 0;
            osInterruptEnable();

            if ( (ev & gSMGR_Rx_c) &&
                 ((( void * )( 0x0UL )) != mSerials[i].rxCallback) )
            {
                mSerials[i].rxCallback( mSerials[i].pRxParam );
            }

            if( ev & gSMGR_TxDone_c )
            {
                Serial_TxQueueMaintenance(&mSerials[i]);
            }


             
            if(
                ( mSerials[i].txCurrent == (0xFF) ) &&
                ( mSerials[i].txQueue[mSerials[i].txOut].flags & (1<<0) ) &&
                ( mSerials[i].txQueue[mSerials[i].txOut].dataSize )
              )
            {
                mSerials[i].txCurrent = mSerials[i].txOut;
                if ( gSerial_Success_c != Serial_WriteInternal( i ) )
                {
                    SerialManager_TxNotify( (LDD_TUserData *)i );
                }
            }

        }
    }  
}










 
serialStatus_t Serial_InitInterface( uint8_t *pInterfaceId,
                                     serialInterfaceType_t interfaceType,
                                     uint8_t channel )
{
    uint8_t i;

    *pInterfaceId = (0xFF);

    for ( i=0; i<1; i++ )
    {
        if ( (mSerials[i].serialType == interfaceType) &&
            (mSerials[i].serialChannel == channel) )
        {
             
            return gSerial_InterfaceInUse_c;
        }
        else if ( mSerials[i].serialType == gSerialMgrNone_c )
        {
            mSerials[i].serialChannel = channel;
            switch ( interfaceType )
            {
            case gSerialMgrUart_c:
                switch(mSerials[i].serialChannel)
                {
                case 1:
                    mSerials[i].serialIf = UARTA_Init( (void*)i );
                    break;
                default:
                    return gSerial_InvalidInterface_c;
                }
                if ((( void * )( 0x0UL )) == mSerials[i].serialIf)
                {
                    return gSerial_InternalError_c;
                }
                else
                {
                     
                    switch(mSerials[i].serialChannel)
                    {
                    case 1:
                        UARTA_ReceiveBlock( mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1 );
                        break;
                    default:
                        return gSerial_InvalidInterface_c;
                    }
                }
                break;
            default:
                return gSerial_InvalidInterface_c;
            }

            mSerials[i].txSyncSem = osSemaphoreCreate((( void * )( 0x0UL )), 0);
            if ( (( void * )( 0x0UL )) == mSerials[i].txSyncSem )
                return gSerial_SemCreateError_c;

            mSerials[i].txQueueSem = osSemaphoreCreate((( void * )( 0x0UL )), 0);
            if ( (( void * )( 0x0UL )) == mSerials[i].txQueueSem )
                return gSerial_SemCreateError_c;

            mSerials[i].serialType = interfaceType;
            *pInterfaceId = i;
            return gSerial_Success_c;
        }
    }

     
    return gSerial_MaxInterfacesReached_c;
}












 
serialStatus_t Serial_AsyncWrite( uint8_t InterfaceId,
                                  uint8_t *pBuf,
                                  uint16_t bufLen,
                                  pSerialCallBack_t cb,
                                  void *pTxParam )
{
    return Serial_WriteCommon(InterfaceId, pBuf, bufLen, cb, pTxParam, 0);
}











 
serialStatus_t Serial_SyncWrite( uint8_t InterfaceId,
                                 uint8_t *pBuf,
                                 uint16_t bufLen )
{
    serialStatus_t status = gSerial_Success_c;
    uint8_t flags = (1<<1);
    volatile serial_t *pSer = &mSerials[InterfaceId];

     
    if( osThreadGetId() == gSerialManagerTaskId )
        flags = 0;

    status  = Serial_WriteCommon(InterfaceId, pBuf, bufLen, (( void * )( 0x0UL )), (( void * )( 0x0UL )), flags);

    if( gSerial_Success_c == status )
    {
         
        if( flags & (1<<1) )
        {
            osSemaphoreWait( pSer->txSyncSem, 0xFFFFFFFF );
        }
        else
        {
            while(pSer->txCurrent != (0xFF));
        }
    }
    return status;
}











 
serialStatus_t Serial_Read( uint8_t InterfaceId,
                            uint8_t *pData,
                            uint16_t dataSize,
                            uint16_t *bytesRead )
{
    if ( (InterfaceId >= 1) ||
        ((( void * )( 0x0UL )) == pData) || ((( void * )( 0x0UL )) == bytesRead) || (0 == dataSize) )
        return gSerial_InvalidParameter_c;

    switch ( mSerials[InterfaceId].serialType )
    {
    case gSerialMgrUart_c:
        *bytesRead = Serial_ReadInternal( InterfaceId, pData, dataSize );
        return gSerial_Success_c;
        break;
    default:
        return gSerial_InvalidInterface_c;
    }
}









 
serialStatus_t Serial_RxBufferByteCount( uint8_t InterfaceId, uint16_t *bytesCount )
{
    if ( (InterfaceId >= 1) ||
        ((( void * )( 0x0UL )) == bytesCount) )
        return  gSerial_InvalidParameter_c;
    if( mSerials[InterfaceId].rxIn >= mSerials[InterfaceId].rxOut )
    {
        *bytesCount = mSerials[InterfaceId].rxIn - mSerials[InterfaceId].rxOut;
    }
    else
    {
        *bytesCount = 64 - mSerials[InterfaceId].rxOut + mSerials[InterfaceId].rxIn;
    }
    return gSerial_Success_c;
}










 
serialStatus_t Serial_SetRxCallBack( uint8_t InterfaceId, pSerialCallBack_t cb, void *pRxParam )
{
    if ( InterfaceId >= 1 )
        return gSerial_InvalidParameter_c;
    mSerials[InterfaceId].rxCallback = cb;
    mSerials[InterfaceId].pRxParam = pRxParam;
    return gSerial_Success_c;
}









 
serialStatus_t Serial_SetBaudRate( uint8_t InterfaceId, uint32_t baudRate  )
{
    if ( (InterfaceId >= 1) ||
        (0 == baudRate) )
        return gSerial_InvalidParameter_c;
    switch ( mSerials[InterfaceId].serialType )
    {
    LDD_SERIAL_TBaudMode baudRateInternal;
    case gSerialMgrUart_c:
        switch ( baudRate )
        {
        case gUARTBaudRate1200_c:
            baudRateInternal = 0u;
            break;
        case gUARTBaudRate2400_c:
            baudRateInternal = 1u;
            break;
        case gUARTBaudRate4800_c:
            baudRateInternal = 2u;
            break;
        case gUARTBaudRate9600_c:
            baudRateInternal = 3u;
            break;
        case gUARTBaudRate19200_c:
            baudRateInternal = 4u;
            break;
        case gUARTBaudRate38400_c:
            baudRateInternal = 5u;
            break;
        case gUARTBaudRate57600_c:
            baudRateInternal = 6u;
            break;
        case gUARTBaudRate115200_c:
            baudRateInternal = 7u;
            break;
        case gUARTBaudRate230400_c:
            baudRateInternal = 8u;
            break;
        default:
            return gSerial_InvalidParameter_c;
        }

        switch(mSerials[InterfaceId].serialChannel)
        {
            case 1:
                if( 0x00U != UARTA_SelectBaudRate( mSerials[InterfaceId].serialIf, baudRateInternal ) )
                    return gSerial_InternalError_c;
                break;
            default:
                return gSerial_InvalidInterface_c;
        }
        break;
    default:
        return gSerial_InvalidInterface_c;
    }
    return gSerial_Success_c;
}










 
serialStatus_t Serial_PrintBin( uint8_t InterfaceId, uint8_t *data, uint8_t len, serialBlock_t allowToBlock )
{
    if ( allowToBlock )
    {
        return Serial_SyncWrite( InterfaceId, data, len );
    }
    else
    {
        return Serial_AsyncWrite( InterfaceId, data, len, (( void * )( 0x0UL )), (( void * )( 0x0UL )) );
    }
}










 
serialStatus_t Serial_Print( uint8_t InterfaceId, char* pString, serialBlock_t allowToBlock )
{
    if ( allowToBlock )
    {
        return Serial_SyncWrite( InterfaceId, (uint8_t*)pString, strlen(pString) );
    }
    else
    {
        return Serial_AsyncWrite( InterfaceId, (uint8_t*)pString, strlen(pString), (( void * )( 0x0UL )), (( void * )( 0x0UL )) );
    }
}













 
serialStatus_t Serial_PrintHex( uint8_t InterfaceId,
                                uint8_t *hex,
                                uint8_t len,
                                uint8_t flags )
{
    uint8_t i=0;
    serialStatus_t status;
    uint8_t hexString[6]; 


 

    if ( !(flags & (1<<0)) )
        hex = hex + (len-1);

    while ( len )
    {
         
        i=0;
        hexString[i++] = (uint8_t)( (((*hex)>>4) & 0x0F) + (((((*hex)>>4) & 0x0F) <= 9) ? '0' : ('A' -10)) );
        hexString[i++] = (uint8_t)( ((*hex) & 0x0F) + ((((*hex) & 0x0F) <= 9) ? '0' : ('A' -10)) );

        if ( flags & (1<<2) )
        {
            hexString[i++] = ',';
        }
        if ( flags & (1<<3) )
        {
            hexString[i++] = ' ';
        }
        hex = hex + (flags & (1<<0) ? 1 : -1);
        len--;

        if ( (len == 0) && (flags & (1<<1)) )
        {
            hexString[i++] = '\n';
            hexString[i++] = '\r';
        }

         
        status = Serial_SyncWrite( InterfaceId, (uint8_t*)hexString, (uint8_t)i) ;
        if ( gSerial_Success_c != status )
            return status;
    }
    return gSerial_Success_c;
}











 
serialStatus_t Serial_PrintDec( uint8_t InterfaceId, uint32_t nr )
{
    uint8_t i = 12-1;
    uint8_t decString[12];

    if ( nr == 0 )
    {
        decString[i] = '0';
    }
    else
    {
        while ( nr )
        {
            decString[i] = '0' + (uint8_t)(nr % 10);
            nr = nr / 10;
            i--;
        }
        i++;
    }

     
    return Serial_SyncWrite( InterfaceId, (uint8_t*)&decString[i], 12-i );
}















 

serialStatus_t Serial_EnableLowPowerWakeup( serialInterfaceType_t interfaceType )
{
    serialStatus_t status = gSerial_InvalidInterface_c;
    if(interfaceType == gSerialMgrUart_c)
    {
        UART_MemMapPtr uartMapPtr;
        uartMapPtr = (UART_MemMapPtr)0x4006A000U;
        ((uartMapPtr)->BDH)   &= ~(0x40u);
        
        ((uartMapPtr)->S2)   = ((uartMapPtr)->S2) & (~0x80u);
        
        ((uartMapPtr)->BDH)   |= 0x40u;
        status = gSerial_Success_c;

    }
    return status;
}














 

serialStatus_t Serial_DisableLowPowerWakeup( serialInterfaceType_t interfaceType)
{
    serialStatus_t status = gSerial_InvalidInterface_c;
    if(interfaceType == gSerialMgrUart_c)
    {
        UART_MemMapPtr uartMapPtr;
        uartMapPtr = (UART_MemMapPtr)0x4006A000U;
        ((uartMapPtr)->BDH)  &= ~(0x40u);
        ((uartMapPtr)->S2)   = ((uartMapPtr)->S2) & (~0x80u);
        status = gSerial_Success_c;

    }
    return status;
}














 

bool_t Serial_IsWakeUpSource( serialInterfaceType_t interfaceType)
{
    bool_t status = 0;
    if(interfaceType == gSerialMgrUart_c)
    {
        UART_MemMapPtr uartMapPtr;
        uartMapPtr = (UART_MemMapPtr)0x4006A000U;
        if( (((uartMapPtr)->S2) & 0x40u ) == 0x40u )
        {
            status = 1;
        }

    }
    return status;
}






 







 
serialStatus_t Serial_WriteInternal( uint8_t InterfaceId )
{
    serial_t *pSer = &mSerials[InterfaceId];
    uint16_t idx = pSer->txCurrent;
    LDD_TError status = 0;

    (void)status;

    switch ( mSerials[InterfaceId].serialType )
    {
    case gSerialMgrUart_c:
        switch(mSerials[InterfaceId].serialChannel)
        {
            case 1:
                status = UARTA_SendBlock( pSer->serialIf,
                                          pSer->txQueue[idx].pData,
                                          pSer->txQueue[idx].dataSize );
                break;
            default:
                return gSerial_InvalidInterface_c;
        }
        if ( status == 0x00U  )
        {
            return gSerial_Success_c;
        }
        else
        {
            return gSerial_InternalError_c;
        }
        break;



    default:
        return gSerial_InvalidInterface_c;
    }
}










 
void SerialManager_RxNotify( LDD_TUserData *pData )
{
    uint32_t i = (uint32_t)pData;

    if( ++(mSerials[i]. rxIn) >= (64) ) (mSerials[i]. rxIn) = 0;;

    
    {
        switch( mSerials[i].serialType )
        {
        case gSerialMgrUart_c:
            switch( mSerials[i].serialChannel )
            {
            case 1:
                UARTA_ReceiveBlock( mSerials[i].serialIf, &mSerials[i].rxBuffer[mSerials[i].rxIn], 1 );
                break;
            default:
                break;
            }
            break;
        case gSerialMgrIICSlave_c:
            break;
        case gSerialMgrIICMaster_c:
            break;
        case gSerialMgrSPISlave_c:
            break;

        }
    }


    mSerials[i].flags |= gSMGR_Rx_c;
    osSignalSet( gSerialManagerTaskId, gSMGR_Rx_c );
}










 
void SerialManager_TxNotify( LDD_TUserData *pData )
{
    volatile serial_t *pSer = &mSerials[(uint32_t)pData];
    uint32_t idx = pSer->txCurrent;

    pSer->flags |= gSMGR_TxDone_c;
    pSer->txQueue[idx].dataSize = 0; 
    if( ++(idx) >= (10) ) (idx) = 0;;

     
    if( idx != pSer->txIn )
    {
        pSer->txCurrent = idx;
        if ( gSerial_Success_c != Serial_WriteInternal( (uint32_t)pData ) )
            pSer->txCurrent = (0xFF);
    }
    else
    {
        pSer->txCurrent = (0xFF);
    }
    osSignalSet( gSerialManagerTaskId, gSMGR_TxDone_c );
}










 










 
uint16_t Serial_ReadInternal( uint8_t InterfaceId,
                             uint8_t *pData,
                             uint16_t dataSize )
{
    uint16_t bytes;
    serial_t *pSer = &mSerials[InterfaceId];

    Serial_RxBufferByteCount(InterfaceId, &bytes);

    if( bytes > 0 )
    {
        uint16_t i;

        if( bytes > dataSize )
            bytes = dataSize;

         
        for( i=0; i<bytes; i++ )
        {
            pData[i] = pSer->rxBuffer[pSer->rxOut++];
            if ( pSer->rxOut >= 64 )
            {
                pSer->rxOut = 0;
            }
        }
    }

    return bytes;
}














 
static inline serialStatus_t Serial_WriteCommon( uint8_t id,
                                   uint8_t *pBuf,
                                   uint16_t bufLen,
                                   pSerialCallBack_t cb,
                                   void *pTxParam,
                                   uint8_t extraFlags)
{
    SerialMsg_t *pMsg = (( void * )( 0x0UL ));
    serial_t *pSer = &mSerials[id];
    osThreadId taskId = osThreadGetId();

    if( ((( void * )( 0x0UL )) == pBuf) || (0 == bufLen) ||
        (id >= 1) ||
        (pSer->serialType == gSerialMgrNone_c) )
    {
        return gSerial_InvalidParameter_c;
    }

    if( taskId == gSerialManagerTaskId )
        Serial_TxQueueMaintenance(pSer);

    if( pSer->txQueue[pSer->txIn].flags )
    {
        if( taskId != gSerialManagerTaskId )
        {
            pSer->txBlockedTasks++;
            osSemaphoreWait( pSer->txQueueSem, 0xFFFFFFFF );
        }
        else
        {
            while( pSer->txQueue[pSer->txIn].flags )
                Serial_TxQueueMaintenance(pSer);
        }
    }

     
    osInterruptDisable();
    if( 0 == pSer->txQueue[pSer->txIn].flags )
    {
        pMsg = &pSer->txQueue[pSer->txIn];
        pMsg->flags      = (1<<0) | extraFlags;
        pMsg->dataSize   = bufLen;
        pMsg->pData      = (void*)pBuf;
        pMsg->txCallback = cb;
        pMsg->pTxParam   = pTxParam;
        if( ++(pSer->txIn) >= (10) ) (pSer->txIn) = 0;;
    }
    osInterruptEnable();

    if( pMsg )
    {
         
        if( pSer->txCurrent == (0xFF) )
        {
            pSer->txCurrent = pSer->txOut;
            if ( gSerial_Success_c != Serial_WriteInternal( id ) )
            {
                SerialManager_TxNotify( (LDD_TUserData *)id );
            }
        }
        else
        {
            osSignalSet( gSerialManagerTaskId, gSMGR_TxNew_c );
        }
        return gSerial_Success_c;
    }

    return gSerial_OutOfMemory_c;
}







 
static void Serial_TxQueueMaintenance(serial_t *pSer)
{
    while( (pSer->txQueue[pSer->txOut].flags & (1<<0)) &&
           (pSer->txQueue[pSer->txOut].dataSize == 0) )
    {
        pSer->txQueue[pSer->txOut].flags &= ~(1<<0);

         
        if( pSer->txQueue[pSer->txOut].txCallback )
        {
            pSer->txQueue[pSer->txOut].txCallback( pSer->txQueue[pSer->txOut].pTxParam );
        }

         
        if( pSer->txQueue[pSer->txOut].flags & (1<<1) )
        {
            osSemaphoreRelease( pSer->txSyncSem );
        }

         
        pSer->txQueue[pSer->txOut].flags = 0;

        if( ++(pSer->txOut) >= (10) ) (pSer->txOut) = 0;;
        if( pSer->txBlockedTasks )
        {
            pSer->txBlockedTasks--;
            osSemaphoreRelease( pSer->txQueueSem );
        }
    }
}

