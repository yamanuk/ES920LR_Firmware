








































































 






 



 

 






























 






 



 

 























 







 



 


 
 
 

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

__intrinsic __nounwind unsigned int __get_LRl(void);
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



   




 




 




   



 


















 





 



 


 

 
 












































 








 




 

 
   

 

 


































































 






 



 


 

 
 












































 








 




 

 
   

 

 






 




 


 
 


 
 
 

 
 
 
 
 
 
 
 
 
 
 
 

 
 

typedef uint16_t PDD_TBool;



 




 








 

 




 










 



 










 



 










 



 










 



 










 



 













 



 










 



 












 



 











 



 












 



 










 



 










 



 










 

 





 




 





 

 




 


















 

 


























 





 



 


 
 
 












































 








 




 

 
   

 



 

 

 








 

 


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
 








 

 


 



 







 



  typedef uint32_t SystemTimer1_TValueType ;  
 

 

 






 


















 
 
LDD_TDeviceData* SystemTimer1_Init(LDD_TUserData *UserDataPtr);




 







 
 
void SystemTimer1_Deinit(LDD_TDeviceData *DeviceDataPtr);




 













 
 
LDD_TError SystemTimer1_Enable(LDD_TDeviceData *DeviceDataPtr);




 










 
 
uint32_t SystemTimer1_GetInputFrequency(LDD_TDeviceData *DeviceDataPtr);




 





















 
 
LDD_TError SystemTimer1_SetPeriodTicks(LDD_TDeviceData *DeviceDataPtr, SystemTimer1_TValueType Ticks);




 


















 
 
LDD_TError SystemTimer1_GetPeriodTicks(LDD_TDeviceData *DeviceDataPtr, SystemTimer1_TValueType *TicksPtr);




 















 
 
LDD_TError SystemTimer1_ResetCounter(LDD_TDeviceData *DeviceDataPtr);




 











 
 
SystemTimer1_TValueType SystemTimer1_GetCounterValue(LDD_TDeviceData *DeviceDataPtr);











 
void SystemTimer1_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration);




 





























 
 
LDD_TError SystemTimer1_SetOperationMode(LDD_TDeviceData *DeviceDataPtr, LDD_TDriverOperationMode OperationMode, LDD_TCallback ModeChangeCallback, LDD_TCallbackParam *ModeChangeCallbackParamPtr);










 
 
void SystemTimer1_Interrupt(LDD_RTOS_TISRParameter _isrParameter);

 


 


 







 














 



 



 



 

 





 







 
 





































 



 


 

 


 





















































































 




 















 



 



 

 

 

 

 


 

 


 




 







 






















































































 





 



 




 







 






 






 





 





 









 





 







 





 





 





 














 








 







 








 






 








 











 





 






 








 







 






 








 









 




 





 





 





 




 





 





 




 




 





 







 





 




 




 




 




 





 






 





 




 








 





 






 






 





 





 





 




 





 




 




 





 





 





 





 





 





 





 





 






 





 





 








 









 







 





 





 





 





 




 




 






 




 



 




 



 




 



 



 




 
 
 





 

 


 

 


 





























 




 


 





 


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

 


 










 



































 




 







 





 



 






 

 

 

 

 

 

 




 




 




 




 





 



 





 


 

typedef enum {
    MQX_API_LWSEM_POLL,
    MQX_API_LWSEM_POST,
    MQX_API_LWSEM_WAIT,
    MQX_API_LWSEM_WAIT_FOR,
    MQX_API_LWSEM_WAIT_TICKS,
    MQX_API_LWSEM_WAIT_UNTIL,
    MQX_API_LWSEM_CREATE,
    MQX_API_LWSEM_DESTROY,

    MQX_API_LWEVENT_CLEAR,
    MQX_API_LWEVENT_SET,
    MQX_API_LWEVENT_SET_AUTO_CLEAR,
    MQX_API_LWEVENT_WAIT_FOR,
    MQX_API_LWEVENT_WAIT_FOR_TICKS,
    MQX_API_LWEVENT_WAIT_UNTIL,
    MQX_API_LWEVENT_GET_SIGNALLED,
    MQX_API_LWEVENT_CREATE,
    MQX_API_LWEVENT_DESTROY,

    MQX_API_LWMSGQ_INIT,
    MQX_API_LWMSGQ_SEND,
    MQX_API_LWMSGQ_RECEIVE,

    MQX_API_TASK_CREATE,
    MQX_API_TASK_DESTROY,
    MQX_API_TASK_SET_ERROR,
    MQX_API_TASK_GET_TD,
    MQX_API_TASK_ABORT,
    MQX_API_TASK_READY,
    MQX_API_TASK_SET_PRIORITY,

    MQX_API_LWMEM_ALLOC,
    MQX_API_LWMEM_ALLOC_FROM,
    MQX_API_LWMEM_FREE,
    MQX_API_LWMEM_CREATE_POOL,

    MQX_API_TIME_DELAY,
    MQX_API_TIME_DELAY_TICKS,
    MQX_API_TIME_GET_ELAPSED_TICKS
} MQX_API_NUMBER_ENUM;





 
typedef struct {
     
    uint_32 param0;
     
    uint_32 param1;
     
    uint_32 param2;
     
    uint_32 param3;
     
    uint_32 param4;
} MQX_API_CALL_PARAMS, * MQX_API_CALL_PARAMS_PTR;
 

 





 


 


 



 





 



 





 

 
 

 

 






 


 


 



 



 





 

 





 



  




 

 

 

 




 

 





 


 




 

 

 

 

 


 




 






 

 


 




 






 






 





 

 


 



 

 

 




 


 


 





 

 


 


 

 

 


 










 

 

 


 

 

 




 

 


 






 

 


 
 

 


 
 

 


 
 

 



 
 

 

 













 
typedef struct interrupt_table_struct
{

    
    INT_ISR_FPTR        APP_ISR;

   







 
    INT_EXCEPTION_FPTR  APP_ISR_EXCEPTION_HANDLER;

    
    pointer             APP_ISR_DATA;

} INTERRUPT_TABLE_STRUCT, * INTERRUPT_TABLE_STRUCT_PTR;
 

 

 








 
typedef struct task_queue_struct
{
    
    struct task_queue_struct *          NEXT;

    
    struct task_queue_struct *          PREV;

    
    _mqx_uint                           VALID;

    
    _mqx_uint                           POLICY;

    
    QUEUE_STRUCT                        TD_QUEUE;

} TASK_QUEUE_STRUCT, * TASK_QUEUE_STRUCT_PTR;
 

 

 








 

typedef struct   td_struct
{
   




 
    struct td_struct *                  TD_NEXT;

   


 
    struct td_struct *                  TD_PREV;

    
    _mqx_uint                           STATE;

    
    _task_id                            TASK_ID;

    
    pointer                             STACK_BASE;

   



 
    pointer                             STACK_PTR;

    
    pointer                             STACK_LIMIT;

    
    struct ready_q_struct *             MY_QUEUE;

   


 
    struct ready_q_struct *             HOME_QUEUE;

   








 
    uint_16                             TASK_SR;

     
    uint_16                             RESERVED1;

    



 
    _mqx_uint                           FLAGS;




   





 
    _mqx_uint                           INFO;

    
    QUEUE_ELEMENT_STRUCT                AUX_QUEUE;

    
    MQX_TICK_STRUCT                     TIMEOUT;

    
    _mqx_uint                           BOOSTED;

    
    _mqx_uint                           DISABLED_LEVEL;


    
    _mqx_uint                           TASK_ERROR_CODE;

    
    _task_id                            PARENT;

    
   _mqx_uint                            TEMPLATE_INDEX;

    
    TASK_TEMPLATE_STRUCT_PTR            TASK_TEMPLATE_PTR;

    
    QUEUE_ELEMENT_STRUCT                TD_LIST_INFO;



    
    MQX_EXIT_FPTR                       EXIT_HANDLER_PTR;

    
    TASK_EXCEPTION_FPTR                 EXCEPTION_HANDLER_PTR;

    
    pointer                             STACK_ALLOC_BLOCK;


    
    _mqx_uint                           LWEVENT_BITS;









} TD_STRUCT, * TD_STRUCT_PTR;
 

 
 
















 

typedef struct ready_q_struct
{

   





 
   TD_STRUCT_PTR                HEAD_READY_Q;

   



 
   TD_STRUCT_PTR                TAIL_READY_Q;

    
   struct ready_q_struct      * NEXT_Q;

   









 
   uint_16                      ENABLE_SR;

    
   uint_16                      PRIORITY;

} READY_Q_STRUCT, * READY_Q_STRUCT_PTR;
 

typedef void (* MQX_COMPONENT_CLEANUP_FPTR)(TD_STRUCT_PTR);
typedef void (* MQX_IO_COMPONENT_CLEANUP_FPTR)(TD_STRUCT_PTR);
 
 











 

typedef struct  kernel_data_struct
{
   



 

    
   uint_32                         ADDRESSING_CAPABILITY;

    
   uint_32                         ENDIANESS;

    
   uint_16                         CPU_TYPE;


    

    
   uint_16                         PSP_CFG_MEMORY_ALIGNMENT;

    
   uint_16                         PSP_CFG_STACK_ALIGNMENT;

    
   uint_16                         PSP_CFG_MEM_STOREBLOCK_ALIGNMENT;

   



 
   uint_16                         CONFIG1;
   



 
   uint_16                         CONFIG2;

   

 

    
   uint_16                         FLAGS;

   







 
   uint_16                         DISABLE_SR;

   




 
   uint_16                         IN_ISR;

   





 
   uint_16                         ACTIVE_SR;

   





 
   TD_STRUCT_PTR                   ACTIVE_PTR;

    
   READY_Q_STRUCT_PTR              READY_Q_LIST;

    
   READY_Q_STRUCT_PTR              CURRENT_READY_Q;


   


 
   INT_ISR_FPTR                    DEFAULT_ISR;

   


 
   _mqx_uint                       FIRST_USER_ISR_VECTOR;

    
   _mqx_uint                       LAST_USER_ISR_VECTOR;

   




 
   PSP_INT_CONTEXT_STRUCT_PTR      INTERRUPT_CONTEXT_PTR;

    
   INTERRUPT_TABLE_STRUCT_PTR      INTERRUPT_TABLE_PTR;

    
   pointer                         INTERRUPT_STACK_PTR;

    
   uint_32                         LOG_CONTROL;

    
   pointer                         LOG_OLD_TD;



    
   TD_STRUCT                       SYSTEM_TD;


 

    
   INT_KERNEL_ISR_FPTR             INT_KERNEL_ISR_ADDR;

    
   _mqx_uint                       NUM_TASK_TEMPLATES;

    
   TASK_TEMPLATE_STRUCT_PTR        TASK_TEMPLATE_LIST_PTR;

    
   _mqx_uint                       LOWEST_TASK_PRIORITY;

    
   QUEUE_STRUCT                    TD_LIST;

    
   _mqx_uint                       TASK_NUMBER;

    
   TD_STRUCT_PTR                   INSERT_TD_PTR;

    
   QUEUE_STRUCT                    KERNEL_TASK_QUEUES;

    
   QUEUE_STRUCT                    LWSEM;

    
   LWSEM_STRUCT                    TASK_CREATE_LWSEM;




    
   MQX_TICK_STRUCT                 TIME;

    
   MQX_TICK_STRUCT                 TIME_OFFSET;

   



 
   QUEUE_STRUCT                    TIMEOUT_QUEUE;

    
   _mqx_uint                       SYSTEM_CLOCK_INT_NUMBER;

    
   _mqx_uint                       KERNEL_ALARM_RESOLUTION;

    
   _mqx_uint                       TICKS_PER_SECOND;

    
   _mqx_uint                       TIMER_HW_REFERENCE;

    
   uint_32                         HW_TICKS_PER_TICK;

   


 
   MQX_GET_HWTICKS_FPTR            GET_HWTICKS;

    
   pointer                         GET_HWTICKS_PARAM;

   


 
    




    
   MQXLITE_INITIALIZATION_STRUCT   INIT;


    
   LWSEM_STRUCT                    COMPONENT_CREATE_LWSEM;

   




 
   pointer                         KERNEL_COMPONENTS[(16)];


   




 
   MQX_COMPONENT_CLEANUP_FPTR      COMPONENT_CLEANUP[(16)];



    
   TASK_TEMPLATE_STRUCT             IDLE_TASK_TEMPLATE;


    
   MQX_EXIT_FPTR                   EXIT_HANDLER;

    
   pointer                         USERS_STACK;
    
   _mqx_max_type                   USERS_VBR;
    
   _mqx_uint                       USERS_ERROR;





   




 
   TIMER_COMPONENT_ISR_FPTR        TIMER_COMPONENT_ISR;


    
   QUEUE_STRUCT                    LWEVENTS;

    
   QUEUE_STRUCT                    LWMSGQS;

    
   QUEUE_STRUCT                    LWTIMERS;

    
   TIMER_COMPONENT_ISR_FPTR        LWTIMER_ISR;








} KERNEL_DATA_STRUCT, * KERNEL_DATA_STRUCT_PTR;
 

 


 


extern struct kernel_data_struct * _mqx_kernel_data;

extern void          _int_kernel_isr_return_internal(void);

extern void          _klog_block_internal(void);
extern void          _klog_context_switch_internal(void);
extern void          _klog_execute_scheduler_internal(void);
extern char *        _klog_get_function_name_internal(uint_32);
extern _mqx_uint     _klog_get_task_stack_usage_internal(TD_STRUCT_PTR, _mem_size_ptr, _mem_size_ptr);
extern void          _klog_isr_end_internal(_mqx_uint);
extern void          _klog_isr_start_internal(_mqx_uint);
extern void          _klog_log(_mqx_uint, _mqx_max_type, _mqx_max_type, _mqx_max_type, _mqx_max_type, _mqx_max_type);
extern void          _klog_write_log_internal(_mqx_max_type, _mqx_max_type, _mqx_max_type, _mqx_max_type, _mqx_max_type, _mqx_max_type);
extern void          _klog_yield_internal(void);

extern _mqx_uint     _lwsem_wait_timed_internal(LWSEM_STRUCT_PTR, TD_STRUCT_PTR);
extern void          _mqx_init_kernel_data_internal(void);

extern TD_STRUCT_PTR _task_alloc_td_internal(_mem_size, _mem_size_ptr, pointer, _mqx_uint);
extern TD_STRUCT_PTR _task_build_internal(_mqx_uint, uint_32, pointer, _mem_size, boolean);
extern void          _task_fill_stack_internal(_mqx_uint_ptr, _mqx_uint);
extern TD_STRUCT_PTR _task_init_internal(TASK_TEMPLATE_STRUCT_PTR, _task_id, uint_32, boolean, pointer, _mem_size);
extern void          _task_ready_internal(TD_STRUCT_PTR);
extern _mqx_uint     _task_set_error_td_internal(TD_STRUCT_PTR, _mqx_uint);
extern _mqx_uint     _task_destroy_internal(_task_id, boolean);
extern _mqx_uint     _task_abort_internal(_task_id, boolean);

extern void          _sched_boost_priority_internal(TD_STRUCT_PTR, _mqx_uint);
extern _mqx_uint     _sched_get_max_priority_on_q_internal(QUEUE_STRUCT_PTR);
extern void          _sched_insert_priorityq_internal(QUEUE_STRUCT_PTR, TD_STRUCT_PTR);
extern void          _sched_set_priority_internal(TD_STRUCT_PTR, _mqx_uint);
extern void          _sched_unboost_priority_internal(TD_STRUCT_PTR, _mqx_uint);



 

extern void          _mqx_init_exit_internal(_mqx_uint);

extern void          _sched_check_scheduler_internal(void);
extern void          _sched_execute_scheduler_internal(void);
extern void          _sched_run_internal(void);
extern void          _sched_start_internal(void);

extern void          _task_execute_exit_handler_internal(TD_STRUCT_PTR);
extern void          _task_exit_function_internal(void);
extern uint_32       _task_get_parameter_internal(TD_STRUCT_PTR);
extern uint_32       _task_set_parameter_internal(uint_32, TD_STRUCT_PTR);
extern void          _task_sync_priority_internal(TD_STRUCT_PTR);

extern void          _time_delay_internal(TD_STRUCT_PTR);

extern boolean       _psp_build_stack_frame(TD_STRUCT_PTR,
                                            pointer,
                                            _mem_size, TASK_TEMPLATE_STRUCT_PTR,
                                            _mqx_uint, uint_32);
extern void          _psp_destroy_stack_frame(TD_STRUCT_PTR);
extern PSP_STACK_START_STRUCT_PTR _psp_get_stack_start(TD_STRUCT_PTR);
extern _mqx_uint     _psp_init_readyqs(void);
extern void          _psp_set_kernel_disable_level(void);
extern void          _psp_save_fp_context_internal(void);

extern _mqx_uint     _lwsem_create_internal(LWSEM_STRUCT_PTR, _mqx_int, boolean, boolean);
extern _mqx_uint     _lwsem_destroy_internal(LWSEM_STRUCT_PTR sem_ptr, boolean user);

extern _mqx_uint     _mqx_api_call(MQX_API_NUMBER_ENUM, MQX_API_CALL_PARAMS_PTR);




 




extern uint_32      __get_LRI(void);

extern uint_32      __get_PCI(void);





 


 

void      SystemTimer1_OnCounterRestart(LDD_TUserData *UserDataPtr);
uint32_t  SystemTimer1_GetTicsPerSecond(LDD_TDeviceData *DeviceDataPtr);


 
void __boot(void);
 
void _svc_handler(void);
 
void _pend_svc(void);
 


 
extern uint8_t main_task_stack[(sizeof(TD_STRUCT) + 768 + ((0x10)-1) + 1)];

 
extern const MQXLITE_INITIALIZATION_STRUCT       MQX_init_struct;
extern const TASK_TEMPLATE_STRUCT                MQX_template_list[];


 
 


 
 
 
extern INTERRUPT_TABLE_STRUCT          mqx_static_isr_table[((INT_PORTC_PORTD) - (INT_SysTick) + 1)];

 
extern uint8_t mqx_system_stack[];

 
extern READY_Q_STRUCT                  mqx_static_ready_queue[((21) + 1)];

 
extern const uint8_t * mqx_task_stack_pointers[];

void PEX_RTOS_InstallInterrupt(IRQInterruptIndex IntVector, void (*IsrFunction)(void *), void *IsrParam);








 

void MQXLite1_SetClockConfiguration(LDD_TClockConfiguration ClockConfiguration);







 


 

 



 







 









































































 






 



 


 

 
 












































 








 




 

 
   

 

 






 




 





 

 

 

 

 

 

 

 




 













 



 













 



 











 



 













 



 











 



 











 



 











 



 











 



 











 



 











 



 











 



 













 



 











 



 











 



 











 



 













 



 













 



 











 



 











 



 











 



 











 



 











 



 











 



 













 



 











 



 













 



 











 



 












 



 













 

 



  typedef uint32_t StackTimer_TValueType ;  
 

 

 






 


















 
 
LDD_TDeviceData* StackTimer_Init(LDD_TUserData *UserDataPtr);




 













 
 
LDD_TError StackTimer_Enable(LDD_TDeviceData *DeviceDataPtr);




 













 
 
LDD_TError StackTimer_Disable(LDD_TDeviceData *DeviceDataPtr);




 










 
 
LDD_TimerUnit_Tfloat StackTimer_GetInputFrequencyReal(LDD_TDeviceData *DeviceDataPtr);




 










 
 
uint32_t StackTimer_GetInputFrequency(LDD_TDeviceData *DeviceDataPtr);




 















 
 
LDD_TError StackTimer_ResetCounter(LDD_TDeviceData *DeviceDataPtr);




 











 
 
StackTimer_TValueType StackTimer_GetCounterValue(LDD_TDeviceData *DeviceDataPtr);




 


























 
 
LDD_TError StackTimer_SetOffsetTicks(LDD_TDeviceData *DeviceDataPtr, uint8_t ChannelIdx, StackTimer_TValueType Ticks);




 
























 
 
LDD_TError StackTimer_GetOffsetTicks(LDD_TDeviceData *DeviceDataPtr, uint8_t ChannelIdx, StackTimer_TValueType *TicksPtr);











 
void StackTimer_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration);










 
 
void StackTimer_Interrupt(LDD_RTOS_TISRParameter _isrParameter);

 


 


 







 










































































 










 



 


 






 

 

 

 


 
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
} UARTB_TDeviceData;

typedef UARTB_TDeviceData *UARTB_TDeviceDataPtr ;  




 















 
 
LDD_TDeviceData* UARTB_Init(LDD_TUserData *UserDataPtr);




 

























 
 
LDD_TError UARTB_ReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size);




 


























 
 
LDD_TError UARTB_SendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size);




 



































 
 
LDD_TError UARTB_SelectBaudRate(LDD_TDeviceData *DeviceDataPtr, LDD_SERIAL_TBaudMode Mode);




 

























 
 
LDD_TError UARTB_ConnectPin(LDD_TDeviceData *DeviceDataPtr, LDD_TPinMask PinMask);










 
 
void UARTB_Interrupt(LDD_RTOS_TISRParameter _isrParameter);











 
void UARTB_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration);

 


 


 







 

































































 






 



 


 

 
 












































 








 




 

 
   

 

 






 




 





 

 

 

 


 


 

 


 

 

 

 

 


 

 

 


 


 




 














 



 














 



 














 



 











 



 











 



 














 



 













 



 











 



 












 



 











 



 













 



 











 



 














 



 













 



 














 



 













 



 













 



 













 



 













 



 













 



 











 



 












 



 













 



 











 



 











 



 











 



 












 



 












 



 













 



 













 



 













 



 













 



 











 



 














 



 














 



 














 



 














 



 














 



 














 



 













 



 











 



 











 



 














 



 














 



 














 



 













 



 













 



 













 



 












 



 











 



 












 



 














 



 














 



 














 



 












 



 












 



 











 



 












 



 














 



 













 



 












 



 












 



 













 



 












 



 













 

 



 

 

 





 

















 
 
LDD_TDeviceData* SPISlave_Init(LDD_TUserData *UserDataPtr);




 




















 
 
LDD_TError SPISlave_ReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size);




 




















 
 
LDD_TError SPISlave_SendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, uint16_t Size);




 












 
 
LDD_TError SPISlave_CancelBlockTransmission(LDD_TDeviceData *DeviceDataPtr);




 























 
 
LDD_TError SPISlave_ConnectPin(LDD_TDeviceData *DeviceDataPtr, LDD_TPinMask PinMask);










 
 
void SPISlave_Interrupt(LDD_RTOS_TISRParameter _isrParameter);

 


 


 







 










































































































 




















 



 


 

 
 












































 








 




 

 
   

 

 




 

 

 






 

















 
 
LDD_TDeviceData* I2CDriver_Init(LDD_TUserData *UserDataPtr);




 







































 
 
LDD_TError I2CDriver_MasterSendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, LDD_I2C_TSize Size, LDD_I2C_TSendStop SendStop);




 











































 
 
LDD_TError I2CDriver_MasterReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, LDD_I2C_TSize Size, LDD_I2C_TSendStop SendStop);




 






























 
 
LDD_TError I2CDriver_SlaveSendBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, LDD_I2C_TSize Size);




 





























 
 
LDD_TError I2CDriver_SlaveReceiveBlock(LDD_TDeviceData *DeviceDataPtr, LDD_TData *BufferPtr, LDD_I2C_TSize Size);




 



























 
 
LDD_TError I2CDriver_SelectSlaveDevice(LDD_TDeviceData *DeviceDataPtr, LDD_I2C_TAddrType AddrType, LDD_I2C_TAddr Addr);




 















 
 
LDD_TError I2CDriver_GetError(LDD_TDeviceData *DeviceDataPtr, LDD_I2C_TErrorMask *ErrorMaskPtr);










 
 
void I2CDriver_Interrupt(LDD_RTOS_TISRParameter _isrParameter);











 
void I2CDriver_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration);

 


 


 







 



















































 










 



 


 

 
 












































 








 




 

 
   

 

 
 












































 








 




 

 
   

 






 




 





 




 












 



 














 



 












 



 














 



 














 



 














 



 














 



 














 



 














 



 












 

 





 




 





 

 

 

 

 

 

 

 

 

 

 

 




 












 



 













 



 












 



 













 



 












 



 













 



 












 



 














 



 












 



 














 



 












 



 














 



 












 



 














 



 












 



 















 



 













 



 














 



 











 



 












 



 











 



 














 



 


















 



 

















 



 

















 



 












 



 














 



 














 



 













 



 














 



 












 



 













 

 




 

 

 

 

 



 
typedef uint32_t DataAvailablePin_TPortValue;





 
typedef DataAvailablePin_TPortValue DataAvailablePin_TFieldValue;






 













 
 
LDD_TDeviceData* DataAvailablePin_Init(LDD_TUserData *UserDataPtr);




 































 
 
LDD_TError DataAvailablePin_SetPortEventCondition(LDD_TDeviceData *DeviceDataPtr, DataAvailablePin_TPortValue Mask, LDD_GPIO_TEventCondition Condition);




 



















 
 
void DataAvailablePin_SetPortInputDirection(LDD_TDeviceData *DeviceDataPtr, DataAvailablePin_TPortValue Mask);




 
























 
 
void DataAvailablePin_SetPortOutputDirection(LDD_TDeviceData *DeviceDataPtr, DataAvailablePin_TPortValue Mask, DataAvailablePin_TPortValue Value);




 


















 
 
DataAvailablePin_TFieldValue DataAvailablePin_GetFieldValue(LDD_TDeviceData *DeviceDataPtr, LDD_GPIO_TBitField Field);




 





















 
 
void DataAvailablePin_ClearFieldBits(LDD_TDeviceData *DeviceDataPtr, LDD_GPIO_TBitField Field, DataAvailablePin_TFieldValue Mask);




 





















 
 
void DataAvailablePin_SetFieldBits(LDD_TDeviceData *DeviceDataPtr, LDD_GPIO_TBitField Field, DataAvailablePin_TFieldValue Mask);










 
 
void DataAvailablePin_Interrupt(LDD_RTOS_TISRParameter _isrParameter);

 


 


 







 


































































 






 



 


 

 
 












































 








 




 

 
   

 

 






 




 





 

 

 

 




 












 



 












 



 












 



 












 



 













 



 












 



 












 



 














 



 












 



 













 



 















 



 













 

 



  typedef uint32_t PitTimeStamp_TValueType ;  
 

 

 






 


















 
 
LDD_TDeviceData* PitTimeStamp_Init(LDD_TUserData *UserDataPtr);




 







 
 
void PitTimeStamp_Deinit(LDD_TDeviceData *DeviceDataPtr);




 













 
 
LDD_TError PitTimeStamp_Enable(LDD_TDeviceData *DeviceDataPtr);




 













 
 
LDD_TError PitTimeStamp_Disable(LDD_TDeviceData *DeviceDataPtr);




 










 
 
LDD_TimerUnit_Tfloat PitTimeStamp_GetInputFrequencyReal(LDD_TDeviceData *DeviceDataPtr);




 










 
 
uint32_t PitTimeStamp_GetInputFrequency(LDD_TDeviceData *DeviceDataPtr);




 





















 
 
LDD_TError PitTimeStamp_SetPeriodTicks(LDD_TDeviceData *DeviceDataPtr, PitTimeStamp_TValueType Ticks);




 


















 
 
LDD_TError PitTimeStamp_GetPeriodTicks(LDD_TDeviceData *DeviceDataPtr, PitTimeStamp_TValueType *TicksPtr);




 















 
 
LDD_TError PitTimeStamp_ResetCounter(LDD_TDeviceData *DeviceDataPtr);











 
void PitTimeStamp_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration);










 
 
void PitTimeStamp_Interrupt(LDD_RTOS_TISRParameter _isrParameter);

 


 


 







 






































 










 



 


 

 
 












































 








 




 

 
   

 

 
 












































 








 




 

 
   

 






 

 

 






 
















 
 
LDD_TDeviceData* LED1_Init(LDD_TUserData *UserDataPtr);




 







 
 
void LED1_Deinit(LDD_TDeviceData *DeviceDataPtr);




 








 
 
void LED1_ClrVal(LDD_TDeviceData *DeviceDataPtr);




 








 
 
void LED1_SetVal(LDD_TDeviceData *DeviceDataPtr);




 








 
 
void LED1_NegVal(LDD_TDeviceData *DeviceDataPtr);

 


 


 







 






































 










 



 


 

 
 












































 








 




 

 
   

 

 
 












































 








 




 

 
   

 






 

 

 






 
















 
 
LDD_TDeviceData* LED2_Init(LDD_TUserData *UserDataPtr);




 







 
 
void LED2_Deinit(LDD_TDeviceData *DeviceDataPtr);




 








 
 
void LED2_ClrVal(LDD_TDeviceData *DeviceDataPtr);




 








 
 
void LED2_SetVal(LDD_TDeviceData *DeviceDataPtr);




 








 
 
void LED2_NegVal(LDD_TDeviceData *DeviceDataPtr);

 


 


 







 





















































 






 



 


 




 

 

 

 




 































 
 
LDD_TDeviceData * RealTimeClock_Init(LDD_TUserData *UserDataPtr, bool SoftInit);




 












 
 
LDD_TError RealTimeClock_Enable(LDD_TDeviceData *DeviceDataPtr);




 










 
 
LDD_TError RealTimeClock_Disable(LDD_TDeviceData *DeviceDataPtr);




 










 
 
void RealTimeClock_GetTime(LDD_TDeviceData *DeviceDataPtr, LDD_RTC_TTime *TimePtr);




 


















 
 
LDD_TError RealTimeClock_SetTime(LDD_TDeviceData *DeviceDataPtr, LDD_RTC_TTime *TimePtr);









 
 
void RealTimeClock_Interrupt(LDD_RTOS_TISRParameter _isrParameter);











 
void RealTimeClock_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration);

 


 


 







 







 










 
 
void DataAvailablePin_OnPortEvent(LDD_TUserData *UserDataPtr);






 










 
 
void I2CDriver_OnMasterBlockSent(LDD_TUserData *UserDataPtr);






 










 
 
void I2CDriver_OnMasterBlockReceived(LDD_TUserData *UserDataPtr);






 










 
 
void I2CDriver_OnSlaveBlockSent(LDD_TUserData *UserDataPtr);






 










 
 
void I2CDriver_OnSlaveBlockReceived(LDD_TUserData *UserDataPtr);






 








 
 
void I2CDriver_OnError(LDD_TUserData *UserDataPtr);






 









 
 
void SPISlave_OnBlockSent(LDD_TUserData *UserDataPtr);






 









 
 
void SPISlave_OnBlockReceived(LDD_TUserData *UserDataPtr);






 








 
 
void UARTB_OnBlockReceived(LDD_TUserData *UserDataPtr);






 








 
 
void UARTB_OnBlockSent(LDD_TUserData *UserDataPtr);






 








 
 
void UARTA_OnBlockReceived(LDD_TUserData *UserDataPtr);






 








 
 
void UARTA_OnBlockSent(LDD_TUserData *UserDataPtr);






 











 
 
void StackTimer_OnCounterRestart(LDD_TUserData *UserDataPtr);






 











 
 
void StackTimer_OnChannel0(LDD_TUserData *UserDataPtr);






 










 
 
void Cpu_OnReset(uint16_t Reason);






 











 
 
void RealTimeClock_OnAlarm(LDD_TUserData *UserDataPtr);






 











 
 
void PitTimeStamp_OnCounterRestart(LDD_TUserData *UserDataPtr);

 


 


 







 
 
 












































 








 




 

 
   

 



 
static const uint8_t ChannelDevice[0x01U] = {0x00U};

 
static const uint8_t ChannelMode[0x01U] = {0x00U};


typedef struct {
  LDD_RTOS_TISRVectorSettings SavedISRSettings_TUInterrupt;  
  bool EnUser;                          
  bool EnMode;                          
  LDD_TEventMask EnEvents;              
  uint32_t Source;                      
  LDD_TUserData *UserDataPtr;           
} StackTimer_TDeviceData;

typedef StackTimer_TDeviceData *StackTimer_TDeviceDataPtr;  

 
static StackTimer_TDeviceData DeviceDataPrv__DEFAULT_RTOS_ALLOC;


 
static void HWEnDi(LDD_TDeviceData *DeviceDataPtr);



 


















 
 
LDD_TDeviceData* StackTimer_Init(LDD_TUserData *UserDataPtr)
{
   
  StackTimer_TDeviceData *DeviceDataPrv;
   
  DeviceDataPrv = &DeviceDataPrv__DEFAULT_RTOS_ALLOC;
  DeviceDataPrv->UserDataPtr = UserDataPtr;  
   
   
   
  DeviceDataPrv->SavedISRSettings_TUInterrupt.isrData = _int_get_isr_data(0x23u);
  DeviceDataPrv->SavedISRSettings_TUInterrupt.isrFunction = _int_install_isr(0x23u, StackTimer_Interrupt, DeviceDataPrv);
   
  ((((SIM_MemMapPtr)0x40047000u))->SCGC6) |= 0x4000000u;
   
  ((((TPM_MemMapPtr)0x4003A000u))->SC) = ((((uint32_t)(((uint32_t)(0x00))<<3))&0x18u) | (((uint32_t)(((uint32_t)(0x00))<<0))&0x7u));  
   
  ((((TPM_MemMapPtr)0x4003A000u))->CNT) = (((uint32_t)(((uint32_t)(0x00))<<0))&0xFFFFu);       
   
  ((((TPM_MemMapPtr)0x4003A000u))->CONTROLS[0]. CnSC) = 0x00U;                    
   
  ((((TPM_MemMapPtr)0x4003A000u))->CONTROLS[1]. CnSC) = 0x00U;                    
   
  ((((TPM_MemMapPtr)0x4003A000u))->MOD) = (((uint32_t)(((uint32_t)(0xFFFF))<<0))&0xFFFFu);       
   
  ((((TPM_MemMapPtr)0x4003A000u))->CONTROLS[0]. CnSC) = (0x40u | 0x10u);  
   
  ((((TPM_MemMapPtr)0x4003A000u))->CONTROLS[0]. CnV) = (((uint32_t)(((uint32_t)(0x01))<<0))&0xFFFFu);         
  DeviceDataPrv->EnEvents = 0x0101U;    
  DeviceDataPrv->Source = 0x8U;  
   
  ((((NVIC_MemMapPtr)0xE000E100u))->IP[4]) = (uint32_t)((((((NVIC_MemMapPtr)0xE000E100u))->IP[4]) & (uint32_t)~(uint32_t)(
               (((uint32_t)(((uint32_t)(0x7F))<<24))&0xFF000000u)
              )) | (uint32_t)(
               (((uint32_t)(((uint32_t)(0x80))<<24))&0xFF000000u)
              ));
   
  ((((NVIC_MemMapPtr)0xE000E100u))->ISER) |= (((uint32_t)(((uint32_t)(0x00080000))<<0))&0xFFFFFFFFu);
   
  ((((TPM_MemMapPtr)0x4003A000u))->SC) = (0x40u | (((uint32_t)(((uint32_t)(0x00))<<3))&0x18u) | (((uint32_t)(((uint32_t)(0x00))<<0))&0x7u));  
  DeviceDataPrv->EnUser = ((boolean)0);        
  StackTimer_SetClockConfiguration(DeviceDataPrv, Cpu_GetClockConfiguration());  
   
  (PE_LDD_DeviceDataList[0x01U] = DeviceDataPrv);
  return ((LDD_TDeviceData *)DeviceDataPrv);  
}




 













 
 
LDD_TError StackTimer_Enable(LDD_TDeviceData *DeviceDataPtr)
{
  StackTimer_TDeviceData *DeviceDataPrv = (StackTimer_TDeviceData *)DeviceDataPtr;

  
 
  if (!DeviceDataPrv->EnMode) {         
    return 0x01U;                   
  }
  if (!DeviceDataPrv->EnUser) {         
    DeviceDataPrv->EnUser = ((boolean)1);       
    HWEnDi(DeviceDataPtr);              
  }
  return 0x00U;
}




 













 
 
LDD_TError StackTimer_Disable(LDD_TDeviceData *DeviceDataPtr)
{
  StackTimer_TDeviceData *DeviceDataPrv = (StackTimer_TDeviceData *)DeviceDataPtr;

  
 
  if (!DeviceDataPrv->EnMode) {         
    return 0x01U;                   
  }
  if (DeviceDataPrv->EnUser) {          
    DeviceDataPrv->EnUser = ((boolean)0);      
    HWEnDi(DeviceDataPtr);              
  }
  return 0x00U;
}




 










 
 
LDD_TimerUnit_Tfloat StackTimer_GetInputFrequencyReal(LDD_TDeviceData *DeviceDataPtr)
{
  (void)DeviceDataPtr;                  
  switch (Cpu_GetClockConfiguration()) {
    case 0x00U:
    case 0x01U:
      return 187500.01171875076F;
    default:
      break;
  }
  return 187500.01171875076F;
}




 










 
 
uint32_t StackTimer_GetInputFrequency(LDD_TDeviceData *DeviceDataPtr)
{
  (void)DeviceDataPtr;                  
  switch (Cpu_GetClockConfiguration()) {
    case 0x00U:
    case 0x01U:
      return 0x0002DC6CUL;
    default:
      break;
  }
  return 0x0002DC6CUL;
}




 















 
 
LDD_TError StackTimer_ResetCounter(LDD_TDeviceData *DeviceDataPtr)
{
  StackTimer_TDeviceData *DeviceDataPrv = (StackTimer_TDeviceData *)DeviceDataPtr;

  
 
  if (!DeviceDataPrv->EnMode) {         
    return 0x01U;                   
  }
  ( ((((TPM_MemMapPtr)0x4003A000u))->CNT) = 0U );
  return 0x00U;                        
}




 











 
 
StackTimer_TValueType StackTimer_GetCounterValue(LDD_TDeviceData *DeviceDataPtr)
{
  (void)DeviceDataPtr;                  
  return (StackTimer_TValueType)( ((((TPM_MemMapPtr)0x4003A000u))->CNT) );
}




 


























 
 
LDD_TError StackTimer_SetOffsetTicks(LDD_TDeviceData *DeviceDataPtr, uint8_t ChannelIdx, StackTimer_TValueType Ticks)
{
  StackTimer_TDeviceData *DeviceDataPrv = (StackTimer_TDeviceData *)DeviceDataPtr;

  
 
  if (!DeviceDataPrv->EnMode) {         
    return 0x01U;                   
  }
  
 
  if (ChannelIdx > 0x00U) {      
    return 0x82U;             
  }
  if ((ChannelMode[ChannelIdx]) != 0U) {  
    return 0x09U;                
  }
  ( ((((TPM_MemMapPtr)0x4003A000u))->CONTROLS[(ChannelDevice[ChannelIdx])]. CnV) = (uint32_t)((uint16_t)Ticks) );
  if (Ticks > 65535U) {                 
    return 0x98U;             
  }
  return 0x00U;                        
}




 
























 
 
LDD_TError StackTimer_GetOffsetTicks(LDD_TDeviceData *DeviceDataPtr, uint8_t ChannelIdx, StackTimer_TValueType *TicksPtr)
{
  StackTimer_TDeviceData *DeviceDataPrv = (StackTimer_TDeviceData *)DeviceDataPtr;

  
 
  if (!DeviceDataPrv->EnMode) {         
    return 0x01U;                   
  }
  
 
  if (ChannelIdx > 0x00U) {      
    return 0x82U;             
  }
  if ((ChannelMode[ChannelIdx]) != 0U) {  
    return 0x09U;                
  }
  *TicksPtr = (StackTimer_TValueType)(( ((((TPM_MemMapPtr)0x4003A000u))->CONTROLS[(ChannelDevice[ChannelIdx])]. CnV) ));
  return 0x00U;                        
}











 
void StackTimer_SetClockConfiguration(LDD_TDeviceData *DeviceDataPtr, LDD_TClockConfiguration ClockConfiguration)
{
  StackTimer_TDeviceData *DeviceDataPrv = (StackTimer_TDeviceData *)DeviceDataPtr;

  ( ((((TPM_MemMapPtr)0x4003A000u))->SC) = (uint32_t)(( (uint32_t)(( ((((TPM_MemMapPtr)0x4003A000u))->SC)) & (( (uint32_t)(~(uint32_t)0x18u)) & ( (uint32_t)(~(uint32_t)0x80u))))) | ( (uint32_t)(0U))) );
  switch (ClockConfiguration) {
    case 0x00U:
    case 0x01U:
      DeviceDataPrv->EnMode = ((boolean)1);     
      DeviceDataPrv->Source = 0x8U;  
      ( ((((TPM_MemMapPtr)0x4003A000u))->SC) = (uint32_t)(( (uint32_t)(( ((((TPM_MemMapPtr)0x4003A000u))->SC)) & (( (uint32_t)(~(uint32_t)0x7u)) & ( (uint32_t)(~(uint32_t)0x80u))))) | ( (uint32_t)(0x7U))) );  
      break;
    default:
      DeviceDataPrv->EnMode = ((boolean)0);    
      break;
  }
  HWEnDi(DeviceDataPtr);                
}










 
void StackTimer_Interrupt(LDD_RTOS_TISRParameter _isrParameter)
{
   
  StackTimer_TDeviceDataPtr DeviceDataPrv = (StackTimer_TDeviceDataPtr)_isrParameter;

  LDD_TEventMask State = 0U;

  if ((( (uint32_t)(((((TPM_MemMapPtr)0x4003A000u))->SC) & 0x80u) )) != 0U) {  
    State |= 0x0100u;  
  }
  if ((( (uint32_t)(((((TPM_MemMapPtr)0x4003A000u))->CONTROLS[(ChannelDevice[0])]. CnSC) & 0x80u) )) != 0U) {  
    State |= 0x01u;  
  }
  State &= DeviceDataPrv->EnEvents;     
  if (State & 0x0100u) {  
    ( ((((TPM_MemMapPtr)0x4003A000u))->SC) |= 0x80u );  
    StackTimer_OnCounterRestart(DeviceDataPrv->UserDataPtr);  
  }
  if (State & 0x01u) {  
    ( ((((TPM_MemMapPtr)0x4003A000u))->CONTROLS[(ChannelDevice[0])]. CnSC) |= 0x80u );  
    StackTimer_OnChannel0(DeviceDataPrv->UserDataPtr);  
  }
}











 
static void HWEnDi(LDD_TDeviceData *DeviceDataPtr)
{
  StackTimer_TDeviceDataPtr DeviceDataPrv = (StackTimer_TDeviceDataPtr)DeviceDataPtr;

   
  _int_disable();
  if (DeviceDataPrv->EnMode && DeviceDataPrv->EnUser) {  
    ( ((((TPM_MemMapPtr)0x4003A000u))->SC) = (uint32_t)(( (uint32_t)(( ((((TPM_MemMapPtr)0x4003A000u))->SC)) & (( (uint32_t)(~(uint32_t)0x18u)) & ( (uint32_t)(~(uint32_t)0x80u))))) | ( (uint32_t)(DeviceDataPrv->Source))) );
  }
  else {
    ( ((((TPM_MemMapPtr)0x4003A000u))->SC) = (uint32_t)(( (uint32_t)(( ((((TPM_MemMapPtr)0x4003A000u))->SC)) & (( (uint32_t)(~(uint32_t)0x18u)) & ( (uint32_t)(~(uint32_t)0x80u))))) | ( (uint32_t)(0U))) );
  }
   
  _int_enable();
}
 




 







 
