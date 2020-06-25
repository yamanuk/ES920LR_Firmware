































 





 


































 







 

 
 

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

 






 





 





 





 





 














 
listStatus_t ListAddTailMsg(listHandle_t list, void* buffer)
{
  buffer = (listHeader_t *)buffer - 1;
  return ListAddTail(list, (listElementHandle_t)buffer);
}















 
listStatus_t ListAddHeadMsg(listHandle_t list, void* buffer)
{
  buffer = (listHeader_t *)buffer - 1;
  return ListAddHead(list, (listElementHandle_t)buffer);
}















 
listStatus_t ListAddPrevMsg( void* pMsg, void* pNewMsg )
{
  listHeader_t *pElem = (listHeader_t*) pMsg - 1;
  listHeader_t *pNewElem  = (listHeader_t*) pNewMsg - 1;

  return ListAddPrevElement((listElementHandle_t)pElem, (listElementHandle_t)pNewElem);
}
















 
void *ListRemoveHeadMsg(listHandle_t list)
{
  void *buffer;

  buffer = ListRemoveHead(list);
  return buffer ? (listHeader_t *)buffer+1 : buffer;
}















 
void *ListGetHeadMsg( listHandle_t list )
{
    if( list->head )
    {
        return (listHeader_t*)(list->head) + 1;
    }

    return (( void * )( 0x0UL ));
}















 
void *ListGetNextMsg( void* buffer )
{
    listHeader_t *p = (listHeader_t*)buffer - 1;

    if( p->link.next )
    {
        return (listHeader_t*)(p->link.next) + 1;
    }

    return (( void * )( 0x0UL ));
}














 
listStatus_t ListRemoveMsg( void* buffer )
{
    listHeader_t *p = (listHeader_t*)buffer - 1;

    return ListRemoveElement( (listElementHandle_t)p );
}
