








 

 
 

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

  






 
 
 


  #pragma system_include

 
 

 

  #pragma system_include














 



 
  typedef _Sizet size_t;

typedef unsigned int __data_size_t;











 


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






 









 











 




































 







 

 
 

  #pragma system_include

 
 

 

  #pragma system_include














 




 
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




extern const uint32_t gDataRate[10][6];

typedef enum smacErrors_tag
{
    gErrorNoError_c = 0,
    gErrorBusy_c,
    gErrorChannelBusy_c,
    gErrorNoAck_c,
    gErrorOutOfRange_c,
    gErrorNoResourcesAvailable_c,
    gErrorNoValidCondition_c,
    gErrorCorrupted_c,
    gErrorMaxError_c
} smacErrors_t;

typedef enum bandWidth_tag
{
    BANDWIDTH7_8    = 0,
    BANDWIDTH10_4,
    BANDWIDTH15_6,
    BANDWIDTH20_8,
    BANDWIDTH31_25,
    BANDWIDTH41_7,
    BANDWIDTH62_5,
    BANDWIDTH125,
    BANDWIDTH250,
    BANDWIDTH500
} bandWidth;

typedef struct txContextConfig_tag
{
    bool_t      ccaBeforeTx;
    bool_t      autoAck;
    uint8_t     retryCountCCAFail;
    uint8_t     retryCountAckFail;
} txContextConfig_t;

typedef struct smacPdu_tag
{
    uint8_t     smacPdu[1];
} smacPdu_t;

typedef struct smacHeader_tag
{
    uint8_t     totalLength;
    uint8_t     frameControl;
    uint8_t     data_type;
    uint8_t     seqNo;
    uint8_t     panId_l;
    uint8_t     panId_h;
    uint8_t     destAddr_l;
    uint8_t     destAddr_h;
    uint8_t     srcAddr_l;
    uint8_t     srcAddr_h;
} smacHeader_t;

typedef struct txPacket_tag
{
    smacHeader_t  smacHeader;
    smacPdu_t     smacPdu;
} txPacket_t;

typedef struct rxPacket_tag
{
    smacHeader_t  smacHeader;
    smacPdu_t     smacPdu;
} rxPacket_t;

typedef smacErrors_t (*SMAC_APP_Handler_t)(uint8_t, uint8_t);

void SMAC_Init( void );
smacErrors_t SMAC_RxStart( rxPacket_t* data );
smacErrors_t SMAC_TxPacket( txPacket_t* data, uint8_t length );
smacErrors_t SMAC_ConfigureTxContext( txContextConfig_t* pTxConfig );
smacErrors_t SMAC_RegisterHandler( SMAC_APP_Handler_t smacToAppHandler );
smacErrors_t SMAC_FillHeader( smacHeader_t* pHeader, uint16_t destAddr );
smacErrors_t SMAC_SetSrcAddress( uint16_t srcAddr );
smacErrors_t SMAC_SetPanID( uint16_t panID );
smacErrors_t SMAC_SetOpMode( uint8_t opMode );
smacErrors_t SMAC_SetChannel( uint8_t ch, uint8_t bw );
smacErrors_t SMAC_GetChannel( uint8_t* ch, uint8_t* bw );
smacErrors_t SMAC_SetRFPower( int8_t power );
smacErrors_t SMAC_GetRFPower( int8_t* power );
smacErrors_t SMAC_GetLastPktRssi( int16_t* rssi );
smacErrors_t SMAC_GetRssi( int16_t* rssi );
smacErrors_t SMAC_SetCodingRate( uint8_t cr );
smacErrors_t SMAC_GetCodingRate( uint8_t* cr );
smacErrors_t SMAC_SetSpreadingFactor( uint8_t sf );
smacErrors_t SMAC_GetSpreadingFactor( uint8_t* sf );
smacErrors_t SMAC_SetContinuous( uint8_t enable );
float SMAC_GetSymbolTime( uint8_t bw, uint8_t sf );
































 







 































 







 







 





 
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































 






 









 





 





 





 







 




 




 





 





 





 





 





 





 





 





 





 





 





 





 





 







 





 





 





 





 





 
typedef uint16_t tmrTimerTicks16_t;





 
typedef uint32_t tmrTimerTicks32_t;





 
typedef uint64_t tmrTimerTicks64_t;




 
typedef uint32_t    tmrTimeInMilliseconds_t;




 
typedef uint32_t    tmrTimeInMinutes_t;




 
typedef uint32_t    tmrTimeInSeconds_t;




 
typedef uint8_t     tmrTimerID_t;




 
typedef uint8_t     tmrTimerType_t;




 
typedef void ( *pfTmrCallBack_t ) ( void * );






 

 





 







 
extern void TMR_Init
(
    void
);






 
extern void TMR_NotifyClkChanged
(
    uint32_t clkKhz
);






 
extern tmrTimerID_t TMR_AllocateTimer
(
    void
);






 
extern bool_t TMR_AreAllTimersOff
(
    void
);








 
extern void TMR_FreeTimer
(
    tmrTimerID_t timerID
);







 
extern bool_t TMR_IsTimerActive
(
    tmrTimerID_t timerID
);







 
extern bool_t TMR_IsTimerReady
(
    tmrTimerID_t timerID
);







 
extern uint32_t TMR_GetRemainingTime
(
    tmrTimerID_t tmrID
);













 
extern void TMR_StartTimer
(
    tmrTimerID_t timerID,
    tmrTimerType_t timerType,
    tmrTimeInMilliseconds_t timeInMilliseconds,
    void (*pfTimerCallBack)(void *),
    void *param
);




















 
extern void TMR_StartLowPowerTimer
(
    tmrTimerID_t timerId,
    tmrTimerType_t timerType,
    uint32_t timeIn,
    void (*pfTmrCallBack)(void *),
    void *param
);











 
extern void TMR_StartMinuteTimer
(
    tmrTimerID_t timerId,
    tmrTimeInMinutes_t timeInMinutes,
    void (*pfTmrCallBack)(void *),
    void *param
);











 
extern void TMR_StartSecondTimer
(
    tmrTimerID_t timerId,
    tmrTimeInSeconds_t timeInSeconds,
    void (*pfTmrCallBack)(void *),
    void *param
);










 
extern void TMR_StartIntervalTimer
(
    tmrTimerID_t timerID,
    tmrTimeInMilliseconds_t timeInMilliseconds,
    void (*pfTimerCallBack)(void *),
    void *param
);










 
extern void TMR_StartSingleShotTimer
(
    tmrTimerID_t timerID,
    tmrTimeInMilliseconds_t timeInMilliseconds,
    void (*pfTimerCallBack)(void *),
    void *param
);









 
extern void TMR_StopTimer
(
    tmrTimerID_t timerID
);








 
extern void TMR_Thread
(
    void const *param
);







 
extern void TMR_EnableTimer
(
    tmrTimerID_t tmrID
);









 
extern uint16_t TMR_NotCountedTicksBeforeSleep
(
    void
);








 
extern void TMR_SyncLpmTimers
(
    uint32_t sleepDurationTmrTicks
);







 
void TMR_MakeTMRThreadReady
(
 void
);






 
extern tmrTimerTicks32_t TmrTicksFromMilliseconds
(
    tmrTimeInMilliseconds_t milliseconds
);






 
extern uint32_t TMR_GetTimerFreq(void);







 








 







 







 








 

 







 











 
bool_t TMR_RTCIsOscStarted(void);







 
void TMR_RTCInit(void);






 
uint64_t TMR_RTCGetTimestamp(void);






 
void TMR_RTCSetTime(uint64_t microseconds);






 
void TMR_RTCSetAlarm(uint64_t seconds, pfTmrCallBack_t callback, void *param);






 
void TMR_RTCSetAlarmRelative(uint32_t seconds, pfTmrCallBack_t callback, void *param);






 































 







 







 





 





 





 












 

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



   




 




 




   



 


 


 



 
typedef union
{
    uint8_t all[12];
    struct
    {
        uint8_t fccob3;
        uint8_t fccob2;
        uint8_t fccob1;
        uint8_t fccob0;
        uint8_t fccob7;
        uint8_t fccob6;
        uint8_t fccob5;
        uint8_t fccob4;
        uint8_t fccobB;
        uint8_t fccobA;
        uint8_t fccob9;
        uint8_t fccob8;
    }regs;

    struct
    {
        uint32_t fccob3210;
        uint32_t fccob7654;
        uint32_t fccobBA98;
    }regsLong;
}FCC0B_STR;

 
void  FLASH_Init( void );
uint32_t FLASH_EraseSector( uint32_t destination );
uint32_t FLASH_ProgramLongWord( uint32_t destination, uint32_t data );
uint32_t FLASH_ProgramSectionByLongs( uint32_t destination, uint32_t* pSource, uint32_t size );
uint16_t FLASH_ReadShortWord( uint32_t offset );
uint32_t FLASH_ReadLongWord( uint32_t offset );










 










 






 






 










 






 

void DoConfiguration( void );
void CommRxCallBack( void* );











 






 







 






 
extern txPacket_t*  gAppTxPacket;
extern rxPacket_t*  gAppRxPacket;
extern uint8_t      gSendingType;





 

void DoOperation( void );
void SetRadioRxOnNoTimeOut( void );
void Switch_Interrupt( void* );
smacErrors_t SendPacket( uint8_t*, uint8_t );
void WaitSendTimerCallBack ( void* );


 







 

















 

typedef struct tagTERMINAL_PARAM
{
    uint8_t     Once[8];             
    uint32_t    Baudrate;            
    uint32_t    SleepTime;           
    int32_t     Power;               
    uint32_t    SendTime;            
    uint8_t     SendData[52];        
    uint32_t    rsv_1[13];
    uint16_t    Ack;                 
    uint16_t    Bw;                  
    uint16_t    Channel;             
    uint16_t    DstId;               
    uint16_t    EndId;               
    uint16_t    HopCnt;              
    uint16_t    Mode;                
    uint16_t    Node;                
    uint16_t    Operation;           
    uint16_t    PanId;               
    uint16_t    RcvId;               
    uint16_t    Retry;               
    uint16_t    Route[2];            
    uint16_t    Rssi;                
    uint16_t    Sf;                  
    uint16_t    Sleep;               
    uint16_t    SrcId;               
    uint16_t    TransMode;           
    uint16_t    Format;              
} TERMINAL_PARAM;

extern TERMINAL_PARAM   mTermParam;
extern uint8_t          CommDataBuffer[256];
extern uint8_t          SendDataBuffer[256];
extern uint16_t         CommDataIndex;
extern bool_t           evDataFromUART;
extern bool_t           gEnterIdle;
extern tmrTimerID_t     IntervalTmr;
extern tmrTimerID_t     WaitSendTmr;
extern tmrTimerID_t     SendTimeTmr;
extern uint8_t          mAppSer;
extern osThreadId       myAppId;
extern tmrTimerID_t     UartCheckTmr;
extern uint8_t          SendDataLen;






 

void Debug_Print( char* pString );
void Debug_PrintDec( uint32_t nr );
void Debug_PrintHex( uint8_t* hex, uint8_t len, uint8_t flags );
void Terminal_Print( char* pString );
void Terminal_PrintDec( uint32_t nr );
void Terminal_PrintHex( uint8_t* hex, uint8_t len, uint8_t flags );
void Terminal_PrintBin( uint8_t* data, uint8_t len );
void Processor_Print( char* pString );
void Processor_PrintDec( uint32_t nr );
void Processor_PrintHex( uint8_t* hex, uint8_t len, uint8_t flags );
void Processor_PrintBin( uint8_t* data, uint8_t len );
void SettingDefaultValue( void );


 





































 



 


 

 


 





















































































 




 















 



 



 

 

 

 

 


 

 


 




 







 






















































































 





 



 




 







 






 






 





 





 









 





 







 





 





 





 














 








 







 








 






 








 











 





 






 








 







 






 








 









 




 





 





 





 




 





 





 




 




 





 







 





 




 




 




 




 





 






 





 




 








 





 






 






 





 





 





 




 





 




 




 





 





 





 





 





 





 





 





 






 





 





 








 









 







 





 





 





 





 




 




 






 




 



 




 



 




 



 



 




 
 
 





 

 


 

 


 





























 




 


 





 


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

 


 










 






 







 
static uint8_t SelectMode( void );
static void PrintMessage( uint8_t* const pu8Menu[] );
static void CommShowModeSel( void );
static void CommShowPrompt( void );

static void CommExecSelectNode( int, int );
static void CommExecSelectBandWidth( int, int );
static void CommExecSetSpreadingFactor( int, int );
static void CommExecSetChannel( int, int );
static void CommExecSetPanId( int, int );
static void CommExecSetSourceId( int, int );
static void CommExecSetDestinationId( int, int );
static void CommExecSetAck( int, int );
static void CommExecSetRetry( int, int );
static void CommExecSelectTransMode( int, int );
static void CommExecSelectRcvId( int, int );
static void CommExecSelectRssi( int, int );
static void CommExecSelectOperation( int, int );
static void CommExecSelectBaudrate( int, int );
static void CommExecSelectSleep( int, int );
static void CommExecSetSleepTime( int, int );
static void CommExecSetPower( int, int );
static void CommExecSetFormat( int, int );
static void CommExecSetSendTime( int, int );
static void CommExecSetSendData( int, int );
static void CommExecVersion( int, int );
static void CommExecSaveParameter( int, int );
static void CommExecLoadParameter( int, int );
static void CommExecShow( int, int );
static void CommExecHelp( int, int );






 
static uint8_t const cu8ModeSel[] = { "Select Mode [1.terminal or 2.processor]" };
static uint8_t const cu8Prompt[]  = { "LORA > " };
static uint8_t const cu8Version[] = { "VER 1.12" };

uint8_t* const cu8Logo[] = {
    "\r\n",
    "\r\n",
    "\r Software Version : ",
    "VER 1.12",
    "\r\n",
    ((pointer)0)
};

uint8_t* const cu8MainMenu[] = {
    "\r\n\r Configuration Mode\n",
    "\r------------------------------------------\n",
    "\r a. node        select Coordinator or EndDevice\n",
    "\r b. bw          select Band Width\n",
    "\r c. sf          set Spreading Factor\n",
    "\r d. channel     set channel\n",
    "\r e. panid       set PAN ID\n",
    "\r f. ownid       set Own Node ID\n",
    "\r g. dstid       set Destination ID\n",
    "\r l. ack         set Acknowledge Mode\n",
    "\r m. retry       set send retry count\n",
    "\r n. transmode   select Transfer Mode\n",
    "\r o. rcvid       set received Node ID information\n",
    "\r p. rssi        set RSSI information\n",
    "\r q. operation   select Configuration or Operation\n",
    "\r r. baudrate    select UART baudrate\n",
    "\r s. sleep       select Sleep Mode\n",
    "\r t. sleeptime   set Sleep Wakeup Timer value\n",
    "\r u. power       set Output Power\n",
    "\r v. version     software version\n",
    "\r w. save        save parameters\n",
    "\r x. load        load default parameters\n",
    "\r y. show        show parameters\n",
    "\r z. start       Transite Operation\n",
    "\r A. format      set Data Format\n",
    "\r B. sendtime    set test send interval\n",
    "\r C. senddata    set test send data\n",
    "\r ?. help        help\n",
    "\r\n",
    ((pointer)0)
};

uint8_t* const cuOnOffMenu[] = {
    "\r\n  1. ON",
    "\r\n  2. OFF",
    "\r\n",
    "\r\n  select number > ",
    ((pointer)0)
};

uint8_t* const cuBaudrateMenu[] = {
    "\r\n  1. 9600",
    "\r\n  2. 19200",
    "\r\n  3. 38400",
    "\r\n  4. 57600",
    "\r\n  5. 115200",
    "\r\n  6. 230400",
    "\r\n",
    "\r\n  select number > ",
    ((pointer)0)
};

uint8_t* const cuNodeMenu[] = {
    "\r\n  1. Coordinator",
    "\r\n  2. EndDevice",
    "\r\n",
    "\r\n  select number > ",
    ((pointer)0)
};

uint8_t* const cuOperationMenu[] = {
    "\r\n  1. Configuration",
    "\r\n  2. Operation",
    "\r\n",
    "\r\n  select number > ",
    ((pointer)0)
};

uint8_t* const cuBwMenu[] = {
    "\r\n  3. 62.5kHz",
    "\r\n  4. 125kHz",
    "\r\n  5. 250kHz",
    "\r\n  6. 500kHz",
    "\r\n",
    "\r\n  select number > ",
    ((pointer)0)
};

uint8_t* const cuSleepMenu[] = {
    "\r\n  1. No Sleep",
    "\r\n  2. Timer Wakeup",
    "\r\n  3. INT Wakeup",
    "\r\n",
    "\r\n  select number > ",
    ((pointer)0)
};

uint8_t* const cuTransMenu[] = {
    "\r\n  1. Payload",
    "\r\n  2. Frame",
    "\r\n",
    "\r\n  select number > ",
    ((pointer)0)
};

uint8_t* const cuFormatMenu[] = {
    "\r\n  1. ASCII",
    "\r\n  2. BINARY",
    "\r\n",
    "\r\n  select number > ",
    ((pointer)0)
};

struct
{
    char    sname[4];
    char    name[12];
    void    (*func)(int, int);
} const command1[] = {
                  { "a"     , "node"        , CommExecSelectNode         },   
                  { "b"     , "bw"          , CommExecSelectBandWidth    },   
                  { "c"     , "sf"          , CommExecSetSpreadingFactor },   
                  { "d"     , "channel"     , CommExecSetChannel         },   
                  { "e"     , "panid"       , CommExecSetPanId           },   
                  { "f"     , "ownid"       , CommExecSetSourceId        },   
                  { "g"     , "dstid"       , CommExecSetDestinationId   },   
                  { "l"     , "ack"         , CommExecSetAck             },   
                  { "m"     , "retry"       , CommExecSetRetry           },   
                  { "n"     , "transmode"   , CommExecSelectTransMode    },   
                  { "o"     , "rcvid"       , CommExecSelectRcvId        },   
                  { "p"     , "rssi"        , CommExecSelectRssi         },   
                  { "q"     , "operation"   , CommExecSelectOperation    },   
                  { "r"     , "baudrate"    , CommExecSelectBaudrate     },   
                  { "s"     , "sleep"       , CommExecSelectSleep        },   
                  { "t"     , "sleeptime"   , CommExecSetSleepTime       },   
                  { "u"     , "power"       , CommExecSetPower           },   
                  { "v"     , "version"     , CommExecVersion            },   
                  { "w"     , "save"        , CommExecSaveParameter      },   
                  { "x"     , "load"        , CommExecLoadParameter      },   
                  { "y"     , "show"        , CommExecShow               },   
                  { "A"     , "format"      , CommExecSetFormat          },   
                  { "B"     , "sendtime"    , CommExecSetSendTime        },   
                  { "C"     , "senddata"    , CommExecSetSendData        },   
                  { "?"     , "help"        , CommExecHelp               },   
                  { "\0"    , "\0"          , 0                          }
              };






 
void IsChar( void )
{
    while( !evDataFromUART )
    {
        ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;
    }
    evDataFromUART = ((boolean)0);
}










 
void DoConfiguration( void )
{
    int32_t i;
    int     ret;
    uint8_t mode;
    uint8_t tmpcmd[16];


    mode = SelectMode();
    if( 1 == mode )
    {
        PrintMessage( cu8Logo );
        PrintMessage( cu8MainMenu );
    }

    tmpcmd[15] = 0;

    while( 1 )
    {
        ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;

        CommShowPrompt();

        IsChar();

        for( i = 0; i < 15; i++ )
        {
            if( ('\0' == CommDataBuffer[i]) || (' ' == CommDataBuffer[i]) )
            {
                tmpcmd[i] = '\0';
                break;
            }
            else
            {
                tmpcmd[i] = CommDataBuffer[i];
            }
        }

        for( i = 0; command1[i].func != 0; i++ )
        {
            ret = strcmp( command1[i].name, (char*)tmpcmd );
            if( 0 == ret )
            {
                command1[i].func( i, strlen(command1[i].name) );
                break;
            }

            ret = strcmp( command1[i].sname, (char*)tmpcmd );
            if( 0 == ret )
            {
                command1[i].func( i, strlen(command1[i].sname) );
                break;
            }
        }

        if( 0 == strcmp( "start", (char*)CommDataBuffer ) )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            return;
        }

        if( 0 == strcmp( "z", (char*)CommDataBuffer ) )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            return;
        }

        if( (0 == command1[i].func) && (2 == mTermParam.Mode) )
        {
            Serial_Print( mAppSer, "NG 001\r\n", gAllowToBlock_d );
        }
    }
}










 
void CommRxCallBack( void* param )
{
    uint16_t readBytes;

    while( gSerial_Success_c == Serial_Read(mAppSer, &CommDataBuffer[CommDataIndex], 1, &readBytes) )
    {
        if( 0 == readBytes )
        {
            break;
        }

        if( ('\r' == CommDataBuffer[CommDataIndex-1]) && ('\n' == CommDataBuffer[CommDataIndex]) )
        {
            CommDataBuffer[CommDataIndex-1] = '\0';
            CommDataBuffer[CommDataIndex]   = '\0';

            CommDataIndex = 0;

            evDataFromUART = ((boolean)1);
        }
        else if( '\b' == CommDataBuffer[CommDataIndex] )
        {
            CommDataBuffer[CommDataIndex] = '\0';

            if( 0 < CommDataIndex )
            {
                CommDataIndex--;
                CommDataBuffer[CommDataIndex] = '\0';
            }
        }
        else
        {
            CommDataIndex++;
            if( 256 <= CommDataIndex )
            {
                CommDataIndex = 0;
            }
        }
    }
}






 










 
static uint8_t SelectMode( void )
{
    int     ret;


    CommShowModeSel();

     
    while( 1 )
    {
        IsChar();

        ret = strcmp( "terminal", (char*)CommDataBuffer );
        if( 0 == ret )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            mTermParam.Mode = 1;
            break;
        }

        ret = strcmp( "processor", (char*)CommDataBuffer );
        if( 0 == ret )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            mTermParam.Mode = 2;
            break;
        }

        ret = strcmp( "1", (char*)CommDataBuffer );
        if( 0 == ret )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            mTermParam.Mode = 1;
            break;
        }

        ret = strcmp( "2", (char*)CommDataBuffer );
        if( 0 == ret )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            mTermParam.Mode = 2;
            break;
        }

        Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
    }

    return( mTermParam.Mode );
}










 
static void PrintMessage( uint8_t* const pu8Menu[] )
{
    uint8_t u8Index = 0;

    while( pu8Menu[u8Index] )
    {
        ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;
        Serial_Print( mAppSer, (char*)pu8Menu[u8Index], gAllowToBlock_d );
        u8Index++;
    }
}










 
static void CommShowModeSel( void )
{
    Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );
    Serial_Print( mAppSer, (char*)cu8ModeSel, gAllowToBlock_d );
    Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );
}










 
static void CommShowPrompt( void )
{
    uint8_t u8lineLen = 20;
    uint8_t u8Index;


     
    if( 1 == mTermParam.Mode )
    {
        for( u8Index = 0; u8Index < u8lineLen; u8Index++ )
        {
            Serial_Print( mAppSer, "\b", gAllowToBlock_d );
        }
        for( u8Index = 0; u8Index < u8lineLen; u8Index++ )
        {
            Serial_Print( mAppSer, " ", gAllowToBlock_d );
        }
        for( u8Index = 0; u8Index < u8lineLen; u8Index++ )
        {
            Serial_Print( mAppSer, "\b", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, (char*)cu8Prompt, gAllowToBlock_d );
    }
}











 
static void CommExecSelectNode( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuNodeMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.Node = 1;
            Serial_Print( mAppSer, "\r\n  Coordinator is selected.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Node = 2;
            Serial_Print( mAppSer, "\r\n  EndDevice is selected.", gAllowToBlock_d );
            break;


        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        if( (1 == tmpMode) || (2 == tmpMode) )
        {
            mTermParam.Node = tmpMode;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSelectBandWidth( int index, int nameLen )
{
    uint8_t maxChannel = 0;
    uint8_t tmpBw = 0;
    uint8_t findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuBwMenu );

        IsChar();

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( ((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) )
            {
                tmpBw += (CommDataBuffer[findIndex] - '0');
            }
            else
            {
                tmpBw = 0xff;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpBw *= 10;
        }

        switch( tmpBw )
        {
        case 3:
            mTermParam.Bw = BANDWIDTH62_5;
            maxChannel    = 15;
            Serial_Print( mAppSer, "\r\n  62.5kHz is selected.", gAllowToBlock_d );
            break;

        case 4:
            mTermParam.Bw = BANDWIDTH125;
            maxChannel    = 15;
            Serial_Print( mAppSer, "\r\n  125kHz is selected.", gAllowToBlock_d );
            break;

        case 5:
            mTermParam.Bw = BANDWIDTH250;
            maxChannel    = 7;
            Serial_Print( mAppSer, "\r\n  250kHz is selected.", gAllowToBlock_d );
            break;

        case 6:
            mTermParam.Bw = BANDWIDTH500;
            maxChannel    = 5;
            Serial_Print( mAppSer, "\r\n  500kHz is selected.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "  Effective Bitrate is ", gAllowToBlock_d );
        Serial_PrintDec( mAppSer, gDataRate[mTermParam.Bw][mTermParam.Sf-7] );
        Serial_Print( mAppSer, "bps.", gAllowToBlock_d );

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( ((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) )
            {
                tmpBw += (CommDataBuffer[nameLen+1+findIndex] - '0');
            }
            else
            {
                tmpBw = 0xff;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpBw *= 10;
        }

        switch( tmpBw )
        {
        case 3:
        case 4:
            mTermParam.Bw = tmpBw + 3;
            maxChannel    = 15;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 5:
            mTermParam.Bw = tmpBw + 3;
            maxChannel    = 7;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 6:
            mTermParam.Bw = tmpBw + 3;
            maxChannel    = 5;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
            break;
        }
    }

    
    if( maxChannel < mTermParam.Channel )
    {
        mTermParam.Channel = 1;
    }
}











 
static void CommExecSetSpreadingFactor( int index, int nameLen )
{
    uint8_t     tmpCount = 0;
    uint8_t     findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set Spreading Factor (7 - 12) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( ((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) )
            {
                tmpCount += (CommDataBuffer[findIndex] - '0');
            }
            else
            {
                tmpCount = 0xff;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpCount *= 10;
        }

        if( (7 <= tmpCount) && (tmpCount <= 12) )
        {
            mTermParam.Sf = tmpCount;

            Serial_Print( mAppSer, "\r\n  spreading factor is ", gAllowToBlock_d );
            Serial_PrintDec( mAppSer, mTermParam.Sf );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  spreading factor is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "  Effective Bitrate is ", gAllowToBlock_d );
        Serial_PrintDec( mAppSer, gDataRate[mTermParam.Bw][mTermParam.Sf-7] );
        Serial_Print( mAppSer, "bps.", gAllowToBlock_d );

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( ((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) )
            {
                tmpCount += (CommDataBuffer[nameLen+1+findIndex] - '0');
            }
            else
            {
                tmpCount = 0xff;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpCount *= 10;
        }

        if( (7 <= tmpCount) && (tmpCount <= 12) )
        {
            mTermParam.Sf = tmpCount;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetChannel( int index, int nameLen )
{
    uint8_t tmpChannel = 0;
    uint8_t maxChannel = 0;
    uint8_t findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        if( BANDWIDTH250 == mTermParam.Bw )
        {
            maxChannel = 7;
            Serial_Print( mAppSer, "\r\n  please set channel (1 - 7) > ", gAllowToBlock_d );
        }
        else if( BANDWIDTH500 == mTermParam.Bw )
        {
            maxChannel = 5;
            Serial_Print( mAppSer, "\r\n  please set channel (1 - 5) > ", gAllowToBlock_d );
        }
        else
        {
            maxChannel = 15;
            Serial_Print( mAppSer, "\r\n  please set channel (1 - 15) > ", gAllowToBlock_d );
        }

        IsChar();

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( ((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) )
            {
                tmpChannel += (CommDataBuffer[findIndex] - '0');
            }
            else
            {
                tmpChannel = 0;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpChannel *= 10;
        }

        if( (0 < tmpChannel) && (tmpChannel <= maxChannel) )
        {
            mTermParam.Channel = tmpChannel;

            Serial_Print( mAppSer, "\r\n  channel is ", gAllowToBlock_d );
            Serial_PrintDec( mAppSer, mTermParam.Channel );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  channel is invalid.", gAllowToBlock_d );
        }

       Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        if( BANDWIDTH250 == mTermParam.Bw )
        {
            maxChannel = 7;
        }
        else if( BANDWIDTH500 == mTermParam.Bw )
        {
            maxChannel = 5;
        }
        else
        {
            maxChannel = 15;
        }

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( ((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) )
            {
                tmpChannel += (CommDataBuffer[nameLen+1+findIndex] - '0');
            }
            else
            {
                tmpChannel = 0;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpChannel *= 10;
        }

        if( (0 < tmpChannel) && (tmpChannel <= maxChannel) )
        {
            mTermParam.Channel = tmpChannel;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetPanId( int index, int nameLen )
{
    uint16_t    tmpId = 0;
    uint8_t     findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set PAN ID (0001 - FFFE) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( (((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) || ((CommDataBuffer[findIndex] >= 'A') && (CommDataBuffer[findIndex] <= 'F')) || ((CommDataBuffer[findIndex] >= 'a') && (CommDataBuffer[findIndex] <= 'f'))) )
            {
                tmpId |= ( ('a' <= CommDataBuffer[findIndex]) ? (CommDataBuffer[findIndex] - 'a' + 10) : (('A' <= CommDataBuffer[findIndex]) ? (CommDataBuffer[findIndex] - 'A' + 10) : (CommDataBuffer[findIndex] - '0')) );
            }
            else
            {
                findIndex = 4;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpId <<= 4;
        }

        if( ((0 != tmpId) && (0xFFFF != tmpId)) && (findIndex < 4) )
        {
            mTermParam.PanId = tmpId;

            Serial_Print( mAppSer, "\r\n  PAN ID is 0x", gAllowToBlock_d );
            Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.PanId, 2, 0 );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  PAN ID is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( (((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) || ((CommDataBuffer[nameLen+1+findIndex] >= 'A') && (CommDataBuffer[nameLen+1+findIndex] <= 'F')) || ((CommDataBuffer[nameLen+1+findIndex] >= 'a') && (CommDataBuffer[nameLen+1+findIndex] <= 'f'))) )
            {
                tmpId |= ( ('a' <= CommDataBuffer[nameLen+1+findIndex]) ? (CommDataBuffer[nameLen+1+findIndex] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1+findIndex]) ? (CommDataBuffer[nameLen+1+findIndex] - 'A' + 10) : (CommDataBuffer[nameLen+1+findIndex] - '0')) );
            }
            else
            {
                findIndex = 4;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpId <<= 4;
        }

        if( ((0 != tmpId) && (0xFFFF != tmpId)) && (findIndex < 4) )
        {
            mTermParam.PanId = tmpId;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetSourceId( int index, int nameLen )
{
    uint16_t    tmpId = 0;
    uint8_t     findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set Own Node ID (0000 - FFFE) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( (((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) || ((CommDataBuffer[findIndex] >= 'A') && (CommDataBuffer[findIndex] <= 'F')) || ((CommDataBuffer[findIndex] >= 'a') && (CommDataBuffer[findIndex] <= 'f'))) )
            {
                tmpId |= ( ('a' <= CommDataBuffer[findIndex]) ? (CommDataBuffer[findIndex] - 'a' + 10) : (('A' <= CommDataBuffer[findIndex]) ? (CommDataBuffer[findIndex] - 'A' + 10) : (CommDataBuffer[findIndex] - '0')) );
            }
            else
            {
                findIndex = 4;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpId <<= 4;
        }

        if( (0xFFFF != tmpId) && (findIndex < 4) )
        {
            mTermParam.SrcId = tmpId;

            Serial_Print( mAppSer, "\r\n  Own Node ID is 0x", gAllowToBlock_d );
            Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.SrcId, 2, 0 );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  Own Node ID is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( (((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) || ((CommDataBuffer[nameLen+1+findIndex] >= 'A') && (CommDataBuffer[nameLen+1+findIndex] <= 'F')) || ((CommDataBuffer[nameLen+1+findIndex] >= 'a') && (CommDataBuffer[nameLen+1+findIndex] <= 'f'))) )
            {
                tmpId |= ( ('a' <= CommDataBuffer[nameLen+1+findIndex]) ? (CommDataBuffer[nameLen+1+findIndex] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1+findIndex]) ? (CommDataBuffer[nameLen+1+findIndex] - 'A' + 10) : (CommDataBuffer[nameLen+1+findIndex] - '0')) );
            }
            else
            {
                findIndex = 4;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpId <<= 4;
        }

        if( (0xFFFF != tmpId) && (findIndex < 4) )
        {
            mTermParam.SrcId = tmpId;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetDestinationId( int index, int nameLen )
{
    uint16_t    tmpId = 0;
    uint8_t     findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set Destination ID (0000 - FFFF) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( (((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) || ((CommDataBuffer[findIndex] >= 'A') && (CommDataBuffer[findIndex] <= 'F')) || ((CommDataBuffer[findIndex] >= 'a') && (CommDataBuffer[findIndex] <= 'f'))) )
            {
                tmpId |= ( ('a' <= CommDataBuffer[findIndex]) ? (CommDataBuffer[findIndex] - 'a' + 10) : (('A' <= CommDataBuffer[findIndex]) ? (CommDataBuffer[findIndex] - 'A' + 10) : (CommDataBuffer[findIndex] - '0')) );
            }
            else
            {
                findIndex = 4;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpId <<= 4;
        }

        if( findIndex < 4 )
        {
            mTermParam.DstId = tmpId;

            Serial_Print( mAppSer, "\r\n  Destination ID is 0x", gAllowToBlock_d );
            Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.DstId, 2, 0 );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  Destination ID is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( (((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) || ((CommDataBuffer[nameLen+1+findIndex] >= 'A') && (CommDataBuffer[nameLen+1+findIndex] <= 'F')) || ((CommDataBuffer[nameLen+1+findIndex] >= 'a') && (CommDataBuffer[nameLen+1+findIndex] <= 'f'))) )
            {
                tmpId |= ( ('a' <= CommDataBuffer[nameLen+1+findIndex]) ? (CommDataBuffer[nameLen+1+findIndex] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1+findIndex]) ? (CommDataBuffer[nameLen+1+findIndex] - 'A' + 10) : (CommDataBuffer[nameLen+1+findIndex] - '0')) );
            }
            else
            {
                findIndex = 4;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpId <<= 4;
        }

        if( findIndex < 4 )
        {
            mTermParam.DstId = tmpId;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}












 
static void CommExecSetAck( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuOnOffMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.Ack = 1;
            Serial_Print( mAppSer, "\r\n  Acknowledge is ON.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Ack = 2;
            Serial_Print( mAppSer, "\r\n  Acknowledge is OFF.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        if( (1 == tmpMode) || (2 == tmpMode) )
        {
            mTermParam.Ack = tmpMode;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetRetry( int index, int nameLen )
{
    uint8_t tmpCount = 0;
    uint8_t findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set retry count (0 - 10) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( ((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) )
            {
                tmpCount += (CommDataBuffer[findIndex] - '0');
            }
            else
            {
                tmpCount = 0xff;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpCount *= 10;
        }

        if( tmpCount <= 10 )
        {
            mTermParam.Retry = tmpCount;

            Serial_Print( mAppSer, "\r\n  retry count is ", gAllowToBlock_d );
            Serial_PrintDec( mAppSer, mTermParam.Retry );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  retry count is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( ((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) )
            {
                tmpCount += (CommDataBuffer[nameLen+1+findIndex] - '0');
            }
            else
            {
                tmpCount = 0xff;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpCount *= 10;
        }

        if( tmpCount <= 10 )
        {
            mTermParam.Retry = tmpCount;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSelectTransMode( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuTransMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.TransMode = 1;
            Serial_Print( mAppSer, "\r\n  Payload Mode is selected.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.TransMode = 2;
            Serial_Print( mAppSer, "\r\n  Frame Mode is selected.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        if( (1 == tmpMode) || (2 == tmpMode) )
        {
            mTermParam.TransMode = tmpMode;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSelectRcvId( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuOnOffMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.RcvId = 1;
            Serial_Print( mAppSer, "\r\n  Receive Node ID information is ON.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.RcvId = 2;
            Serial_Print( mAppSer, "\r\n  Receive Node ID information is OFF.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        if( (1 == tmpMode) || (2 == tmpMode) )
        {
            mTermParam.RcvId = tmpMode;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSelectRssi( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuOnOffMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.Rssi = 1;
            Serial_Print( mAppSer, "\r\n  RSSI information is ON.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Rssi = 2;
            Serial_Print( mAppSer, "\r\n  RSSI information is OFF.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        if( (1 == tmpMode) || (2 == tmpMode) )
        {
            mTermParam.Rssi = tmpMode;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSelectOperation( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuOperationMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.Operation = 1;
            Serial_Print( mAppSer, "\r\n  Configuration is selected.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Operation = 2;
            Serial_Print( mAppSer, "\r\n  Operation is selected.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        if( (1 == tmpMode) || (2 == tmpMode) )
        {
            mTermParam.Operation = tmpMode;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSelectBaudrate( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuBaudrateMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.Baudrate = gUARTBaudRate9600_c;
            Serial_Print( mAppSer, "\r\n  9600 baud is selected.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Baudrate = gUARTBaudRate19200_c;
            Serial_Print( mAppSer, "\r\n  19200 baud is selected.", gAllowToBlock_d );
            break;

        case 3:
            mTermParam.Baudrate = gUARTBaudRate38400_c;
            Serial_Print( mAppSer, "\r\n  38400 baud is selected.", gAllowToBlock_d );
            break;

        case 4:
            mTermParam.Baudrate = gUARTBaudRate57600_c;
            Serial_Print( mAppSer, "\r\n  57600 baud is selected.", gAllowToBlock_d );
            break;

        case 5:
            mTermParam.Baudrate = gUARTBaudRate115200_c;
            Serial_Print( mAppSer, "\r\n  115200 baud is selected.", gAllowToBlock_d );
            break;

        case 6:
            mTermParam.Baudrate = gUARTBaudRate230400_c;
            Serial_Print( mAppSer, "\r\n  230400 baud is selected.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.Baudrate = gUARTBaudRate9600_c;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Baudrate = gUARTBaudRate19200_c;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 3:
            mTermParam.Baudrate = gUARTBaudRate38400_c;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 4:
            mTermParam.Baudrate = gUARTBaudRate57600_c;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 5:
            mTermParam.Baudrate = gUARTBaudRate115200_c;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 6:
            mTermParam.Baudrate = gUARTBaudRate230400_c;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
            break;
        }
    }

    Serial_SetBaudRate( mAppSer, mTermParam.Baudrate );
}











 
static void CommExecSelectSleep( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuSleepMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.Sleep = 1;
            Serial_Print( mAppSer, "\r\n  No Sleep Mode is selected.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Sleep = 2;
            Serial_Print( mAppSer, "\r\n  Timer Wakeup Mode is selected.", gAllowToBlock_d );
            break;

        case 3:
            mTermParam.Sleep = 3;
            Serial_Print( mAppSer, "\r\n  INT Wakeup Mode is selected.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        if( (1 == tmpMode) || (2 == tmpMode) || (3 == tmpMode) )
        {
            mTermParam.Sleep = tmpMode;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetSleepTime( int index, int nameLen )
{
    uint32_t tmpValue = 0;
    uint8_t findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set sleep time (1 - 864000) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 6; findIndex++ )
        {
            if( ((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) )
            {
                tmpValue += (CommDataBuffer[findIndex] - '0');
            }
            else
            {
                tmpValue = 0;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpValue *= 10;
        }

        if( (0 < tmpValue) && (tmpValue <= 864000) )
        {
            mTermParam.SleepTime = tmpValue;

            Serial_Print( mAppSer, "\r\n  sleep time is ", gAllowToBlock_d );
            Serial_PrintDec( mAppSer, mTermParam.SleepTime );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  sleep time is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 6; findIndex++ )
        {
            if( ((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) )
            {
                tmpValue += (CommDataBuffer[nameLen+1+findIndex] - '0');
            }
            else
            {
                tmpValue = 0;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpValue *= 10;
        }

        if( (0 < tmpValue) && (tmpValue <= 864000) )
        {
            mTermParam.SleepTime = tmpValue;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetPower( int index, int nameLen )
{
    int32_t tmpValue = 0;
    uint8_t findIndex;
    bool_t  isMinus = ((boolean)0);


     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set output power (-4 - 13) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 3; findIndex++ )
        {
            if( (0 == findIndex) && ('-' == CommDataBuffer[0]) )
            {
                isMinus = ((boolean)1);
                continue;
            }

            if( ((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) )
            {
                tmpValue += (CommDataBuffer[findIndex] - '0');
            }
            else
            {
                tmpValue = 0xff;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpValue *= 10;
        }

        if( ((boolean)1) == isMinus )
        {
            tmpValue = -tmpValue;
        }

        if( (-4 <= tmpValue) && (tmpValue <= 13) )
        {
            mTermParam.Power = tmpValue;

            Serial_Print( mAppSer, "\r\n  output power is ", gAllowToBlock_d );
            if( ((boolean)1) == isMinus )
            {
                Serial_Print( mAppSer, "-", gAllowToBlock_d );
                Serial_PrintDec( mAppSer, -mTermParam.Power );
            }
            else
            {
                Serial_PrintDec( mAppSer, mTermParam.Power );
            }
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  output power is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 3; findIndex++ )
        {
            if( (0 == findIndex) && ('-' == CommDataBuffer[nameLen+1]) )
            {
                isMinus = ((boolean)1);
                continue;
            }

            if( ((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) )
            {
                tmpValue += (CommDataBuffer[nameLen+1+findIndex] - '0');
            }
            else
            {
                tmpValue = 0xff;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpValue *= 10;
        }

        if( ((boolean)1) == isMinus )
        {
            tmpValue = -tmpValue;
        }

        if( (-4 <= tmpValue) && (tmpValue <= 13) )
        {
            mTermParam.Power = tmpValue;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetFormat( int index, int nameLen )
{
    uint8_t tmpMode = 0;


     
    if( 1 == mTermParam.Mode )
    {
        PrintMessage( cuFormatMenu );

        IsChar();

        if( (((CommDataBuffer[0] >= '0') && (CommDataBuffer[0] <= '9')) || ((CommDataBuffer[0] >= 'A') && (CommDataBuffer[0] <= 'F')) || ((CommDataBuffer[0] >= 'a') && (CommDataBuffer[0] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'a' + 10) : (('A' <= CommDataBuffer[0]) ? (CommDataBuffer[0] - 'A' + 10) : (CommDataBuffer[0] - '0')) );
        }

        switch( tmpMode )
        {
        case 1:
            mTermParam.Format = 1;
            Serial_Print( mAppSer, "\r\n  ASCII format is selected.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Format = 2;
            Serial_Print( mAppSer, "\r\n  BINARY format is selected.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        if( (((CommDataBuffer[nameLen+1] >= '0') && (CommDataBuffer[nameLen+1] <= '9')) || ((CommDataBuffer[nameLen+1] >= 'A') && (CommDataBuffer[nameLen+1] <= 'F')) || ((CommDataBuffer[nameLen+1] >= 'a') && (CommDataBuffer[nameLen+1] <= 'f'))) )
        {
            tmpMode = ( ('a' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'a' + 10) : (('A' <= CommDataBuffer[nameLen+1]) ? (CommDataBuffer[nameLen+1] - 'A' + 10) : (CommDataBuffer[nameLen+1] - '0')) );
        }

        if( (1 == tmpMode) || (2 == tmpMode) )
        {
            mTermParam.Format = tmpMode;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetSendTime( int index, int nameLen )
{
    uint32_t tmpValue = 0;
    uint8_t findIndex;


     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set send time (0 - 86400) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 5; findIndex++ )
        {
            if( ((CommDataBuffer[findIndex] >= '0') && (CommDataBuffer[findIndex] <= '9')) )
            {
                tmpValue += (CommDataBuffer[findIndex] - '0');
            }
            else
            {
                tmpValue = 0xFFFFFFFF;
                break;
            }

            if( '\0' == CommDataBuffer[findIndex+1] )
            {
                break;
            }

            tmpValue *= 10;
        }

        if( tmpValue <= 86400 )
        {
            mTermParam.SendTime = tmpValue;

            Serial_Print( mAppSer, "\r\n  send time is ", gAllowToBlock_d );
            Serial_PrintDec( mAppSer, mTermParam.SendTime );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  send time is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        for( findIndex = 0; findIndex < 5; findIndex++ )
        {
            if( ((CommDataBuffer[nameLen+1+findIndex] >= '0') && (CommDataBuffer[nameLen+1+findIndex] <= '9')) )
            {
                tmpValue += (CommDataBuffer[nameLen+1+findIndex] - '0');
            }
            else
            {
                tmpValue = 0xFFFFFFFF;
                break;
            }

            if( '\0' == CommDataBuffer[nameLen+1+findIndex+1] )
            {
                break;
            }

            tmpValue *= 10;
        }

        if( tmpValue <= 86400 )
        {
            mTermParam.SendTime = tmpValue;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}











 
static void CommExecSetSendData( int index, int nameLen )
{
     
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set send data > ", gAllowToBlock_d );

        IsChar();

        FLib_MemCpy( mTermParam.SendData, CommDataBuffer, 50 );
        mTermParam.SendData[50] = '\0';


        Serial_Print( mAppSer, "\r\n  send data is ", gAllowToBlock_d );
        Serial_Print( mAppSer, (char*)mTermParam.SendData, gAllowToBlock_d );
        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
     
    else
    {
        FLib_MemCpy( mTermParam.SendData, &CommDataBuffer[nameLen+1], 50 );
        mTermParam.SendData[50] = '\0';
        Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
    }
}











 
static void CommExecVersion( int index, int nameLen )
{
    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, (char*)cu8Version, gAllowToBlock_d );
    Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );

    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );
    }
}











 
static void CommExecSaveParameter( int index, int nameLen )
{
    uint32_t    length;
    uint32_t    ret;


    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\nsave parameter ...", gAllowToBlock_d );
    }

    _int_disable();

    ret = FLASH_EraseSector( 0x1F000 );
    if( 0 != ret )
    {
        if( 1 == mTermParam.Mode )
        {
            Serial_Print( mAppSer, " FlashROM erase error\r\n\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 003\r\n", gAllowToBlock_d );
        }

        _int_enable();

        return;
    }

    length = sizeof(mTermParam) + ((sizeof(mTermParam) % 4) ? (4 - sizeof(mTermParam) % 4) : 0);

    ret = FLASH_ProgramSectionByLongs( 0x1F000, (uint32_t*)&mTermParam, (length / sizeof(uint32_t)) );
    if( 0 != ret )
    {
        if( 1 == mTermParam.Mode )
        {
            Serial_Print( mAppSer, " FlashROM write error\r\n\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 004\r\n", gAllowToBlock_d );
        }

        _int_enable();

        return;
    }

    _int_enable();

    if( 1 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, " Done\r\n\r\n", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
    }
}











 
static void CommExecLoadParameter( int index, int nameLen )
{
    SettingDefaultValue();

    if( 2 == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
    }

    Serial_SetBaudRate( mAppSer, mTermParam.Baudrate );
}











 
static void CommExecShow( int index, int nameLen )
{
    Serial_Print( mAppSer, "\r\n  configuration setting is below.", gAllowToBlock_d );
    Serial_Print( mAppSer, "\r\n  -------------------------------------", gAllowToBlock_d );

    Serial_Print( mAppSer, "\r\n  Node                        : ", gAllowToBlock_d );
    if( 1 == mTermParam.Node )
    {
        Serial_Print( mAppSer, "Coordinator", gAllowToBlock_d );
    }
    else if( 2 == mTermParam.Node )
    {
        Serial_Print( mAppSer, "EndDevice", gAllowToBlock_d );
    }

    ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;

    Serial_Print( mAppSer, "\r\n  Band Width                  : ", gAllowToBlock_d );
    if( BANDWIDTH31_25 == mTermParam.Bw )
    {
        Serial_Print( mAppSer, "31.25kHz", gAllowToBlock_d );
    }
    else if( BANDWIDTH41_7 == mTermParam.Bw )
    {
        Serial_Print( mAppSer, "41.7kHz", gAllowToBlock_d );
    }
    else if( BANDWIDTH62_5 == mTermParam.Bw )
    {
        Serial_Print( mAppSer, "62.5kHz", gAllowToBlock_d );
    }
    else if( BANDWIDTH125 == mTermParam.Bw )
    {
        Serial_Print( mAppSer, "125kHz", gAllowToBlock_d );
    }
    else if( BANDWIDTH250 == mTermParam.Bw )
    {
        Serial_Print( mAppSer, "250kHz", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "500kHz", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  Spreading Factor            : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.Sf );

    Serial_Print( mAppSer, "\r\n  Effective Bitrate           : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, gDataRate[mTermParam.Bw][mTermParam.Sf-7] );
    Serial_Print( mAppSer, "bps", gAllowToBlock_d );

    Serial_Print( mAppSer, "\r\n  Channel                     : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.Channel );

    Serial_Print( mAppSer, "\r\n  PAN ID                      : ", gAllowToBlock_d );
    Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.PanId, 2, 0 );

    Serial_Print( mAppSer, "\r\n  Own Node ID                 : ", gAllowToBlock_d );
    Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.SrcId, 2, 0 );

    Serial_Print( mAppSer, "\r\n  Destination ID              : ", gAllowToBlock_d );
    Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.DstId, 2, 0 );


    ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;

    Serial_Print( mAppSer, "\r\n  Acknowledge                 : ", gAllowToBlock_d );
    if( 1 == mTermParam.Ack )
    {
        Serial_Print( mAppSer, "ON", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "OFF", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  Retry count                 : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.Retry );

    Serial_Print( mAppSer, "\r\n  Transfer Mode               : ", gAllowToBlock_d );
    if( 1 == mTermParam.TransMode )
    {
        Serial_Print( mAppSer, "Payload", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "Frame", gAllowToBlock_d );
    }

    ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;

    Serial_Print( mAppSer, "\r\n  Receive Node ID information : ", gAllowToBlock_d );
    if( 1 == mTermParam.RcvId )
    {
        Serial_Print( mAppSer, "ON", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "OFF", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  RSSI information            : ", gAllowToBlock_d );
    if( 1 == mTermParam.Rssi )
    {
        Serial_Print( mAppSer, "ON", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "OFF", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  Config/Operation            : ", gAllowToBlock_d );
    if( 1 == mTermParam.Operation )
    {
        Serial_Print( mAppSer, "Configuration", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "Operation", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  UART baudrate               : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.Baudrate );

    ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;

    Serial_Print( mAppSer, "\r\n  Sleep Mode                  : ", gAllowToBlock_d );
    if( 1 == mTermParam.Sleep )
    {
        Serial_Print( mAppSer, "No Sleep", gAllowToBlock_d );
    }
    else if( 2 == mTermParam.Sleep )
    {
        Serial_Print( mAppSer, "Timer Wakeup", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "INT Wakeup", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  Sleep Time                  : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.SleepTime );

    Serial_Print( mAppSer, "\r\n  Output Power                : ", gAllowToBlock_d );
    if( mTermParam.Power < 0 )
    {
        Serial_Print( mAppSer, "-", gAllowToBlock_d );
        Serial_PrintDec( mAppSer, -mTermParam.Power );
    }
    else
    {
        Serial_PrintDec( mAppSer, mTermParam.Power );
    }
    Serial_Print( mAppSer, "dBm", gAllowToBlock_d );

    ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;

    Serial_Print( mAppSer, "\r\n  Format                      : ", gAllowToBlock_d );
    if( 1 == mTermParam.Format )
    {
        Serial_Print( mAppSer, "ASCII", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "BINARY", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  Send Time                   : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.SendTime );

    ; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0x55; ((((SIM_MemMapPtr)0x40047000u))->SRVCOP) = 0xAA;;

    Serial_Print( mAppSer, "\r\n  Send Data                   : ", gAllowToBlock_d );
    Serial_Print( mAppSer, (char*)mTermParam.SendData, gAllowToBlock_d );

    Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
}











 
static void CommExecHelp( int index, int nameLen )
{
    PrintMessage( cu8MainMenu );
}
