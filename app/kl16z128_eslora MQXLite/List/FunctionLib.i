






























 
































 




































 







 

 
 

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













 












 









 








 





 





 





 





 





 















 
void FLib_MemCpy (void* pDst,
                  void* pSrc,
                  uint32_t cBytes)
{
    while (cBytes)
    {
        *((uint8_t*)pDst) = *((uint8_t*)pSrc);
        pDst = ((uint8_t*)pDst)+1;
        pSrc = ((uint8_t*)pSrc)+1;
        cBytes--;
    }
}


















 

void FLib_MemCpyAligned32bit (void* from_ptr,
                              void* to_ptr,
                              register uint32_t number_of_bytes)
{
    uint8_t*    from8_ptr = (uint8_t*)from_ptr;
    uint8_t*    to8_ptr = (uint8_t*)to_ptr;
    uint16_t*   from16_ptr = (uint16_t*)from_ptr;
    uint16_t*   to16_ptr = (uint16_t*)to_ptr;
    register    uint32_t* from32_ptr = (uint32_t*)from_ptr;
    register    uint32_t* to32_ptr = (uint32_t*)to_ptr;

    register    uint32_t loops;

    if (number_of_bytes > 3)
    {
         
        if ((uint32_t)from_ptr & 1)
        {
            from8_ptr = (uint8_t*)from_ptr;
            to8_ptr = (uint8_t*)to_ptr;

            *to8_ptr++ = *from8_ptr++;

            from_ptr = from8_ptr;
            to_ptr = to8_ptr;
            --number_of_bytes;
        }

         
        if ((uint32_t)from_ptr & 2)
        {
            from16_ptr = (uint16_t*)from_ptr;
            to16_ptr = (uint16_t*)to_ptr;

            *to16_ptr++ = *from16_ptr++;

            from_ptr = from16_ptr;
            to_ptr = to16_ptr;
            number_of_bytes -= 2;
        }

        from32_ptr = (uint32_t*)from_ptr;
        to32_ptr = (uint32_t*)to_ptr;

        for (loops = number_of_bytes >> 2; loops != 0; loops--)
        {
            *to32_ptr++ = *from32_ptr++;
        }

        from_ptr = from32_ptr;
        to_ptr = to32_ptr;
    }

     
    if (number_of_bytes & 2)
    {
        from16_ptr = (uint16_t*)from_ptr;
        to16_ptr = (uint16_t*)to_ptr;

        *to16_ptr++ = *from16_ptr++;

        from_ptr = from16_ptr;
        to_ptr = to16_ptr;
    }

    if (number_of_bytes & 1)
    {
        *(uint8_t*)to_ptr = *(uint8_t*)from_ptr;
    }
}




















 

void FLib_MemCpyDir (void* pBuf1,
                     void* pBuf2,
                     bool_t dir,
                     uint32_t n)
{
    if (dir)
    {
        FLib_MemCpy (pBuf1, pBuf2, n);
    }
    else
    {
        FLib_MemCpy (pBuf2, pBuf1, n);
    }
}
















 

void FLib_MemCpyReverseOrder (void* pDst,
                              void* pSrc,
                              uint32_t cBytes)
{
    if(cBytes == 0)
    {
        return;
    }
    pDst = (uint8_t*)pDst + (uint32_t)(cBytes-1);
    while (cBytes)
    {
        *((uint8_t*)pDst) = *((uint8_t*)pSrc);
        pDst = (uint8_t*)pDst-1;
        pSrc = (uint8_t*)pSrc+1;
        cBytes--;
    }
}

















 

bool_t FLib_MemCmp (void* pData1,    
                    void* pData2,    
                    uint32_t cBytes  
                   )
{
    while (cBytes)
    {
        if ( *((uint8_t *)pData1) != *((uint8_t *)pData2))
        {
            return 0;
        }

        pData2 = (uint8_t* )pData2+1;
        pData1 = (uint8_t* )pData1+1;
        cBytes--;
    }
    return 1;
}















 
void FLib_MemSet (void* pDst,
                  uint8_t value,
                  uint32_t cBytes)
{
    while (cBytes)
    {
        ((uint8_t* )pDst)[--cBytes] = value;
    }
}
















 
void FLib_MemInPlaceCpy (void* pDst,
                         void* pSrc,
                         uint32_t cBytes)
{
    if (pDst != pSrc)
    {
         
        if (pDst < pSrc)
        {
             
            while (cBytes)
            {
                *((uint8_t*)pDst) = *((uint8_t*)pSrc);
                pDst = ((uint8_t*)pDst)+1;
                pSrc = ((uint8_t*)pSrc)+1;
                cBytes--;
            }
        }
        else
        {
             
            while(cBytes)
            {
                cBytes--;
                ((uint8_t* )pDst)[cBytes] = ((uint8_t* )pSrc)[cBytes];
            }
        }
    }
}








 

void FLib_MemCopy16Unaligned (void* pDst,
                              uint16_t val16)
{
    uint8_t* pData = (uint8_t*)pDst;

    *pData++ = (uint8_t)(val16);
    *pData =   (uint8_t)(val16 >> 8);

    return;
}









 

void FLib_MemCopy32Unaligned (void* pDst,
                              uint32_t val32)
{
    uint8_t* pData = (uint8_t*)pDst;

    *pData++ = (uint8_t)(val32);
    *pData++ = (uint8_t)(val32 >> 8);
    *pData++ = (uint8_t)(val32 >> 16);
    *pData++ = (uint8_t)(val32 >> 24);

    return;
}









 

void FLib_MemCopy64Unaligned (void* pDst,
                              uint64_t val64)
{
    uint8_t* pData = (uint8_t*)pDst;

    *pData++ = (uint8_t)(val64);
    *pData++ = (uint8_t)(val64 >> 8);
    *pData++ = (uint8_t)(val64 >> 16);
    *pData++ = (uint8_t)(val64 >> 24);
    *pData++ = (uint8_t)(val64 >> 32);
    *pData++ = (uint8_t)(val64 >> 40);
    *pData++ = (uint8_t)(val64 >> 48);
    *pData = (uint8_t)(val64 >> 56);

    return;
}













 

void FLib_AddOffsetToPointer (void** pPtr,
                              uint32_t offset)
{
    (*pPtr) = ((uint8_t* )*pPtr) + offset;
}






 





 

