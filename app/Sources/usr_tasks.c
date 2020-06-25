/*****************************************************************************
* usr_tasks file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#include <string.h>
#include "Application_Interface.h"
#include "flash.h"
#include "LED.h"
#include "usr_tasks.h"
#include "message.h"
#include "mqxlite.h"
#include "mqxlite_prv.h"


/************************************************************************************
*************************************************************************************
* Private macros
*************************************************************************************
************************************************************************************/

#define ESLORA			"ESLORA"
#define UART_CHK_TIME	500


/************************************************************************************
*************************************************************************************
* Private prototypes
*************************************************************************************
************************************************************************************/

static void MessageTask( void const* );
static void InitProject( void );
static void PORT_Init( void );
static void ReadConfigParam( void );
static void UartRxCallback( void* );
static void Switch_Init( void );
static void UartCheckTimerCallBack ( void* );


/************************************************************************************
*************************************************************************************
* Private memory declarations
*************************************************************************************
************************************************************************************/


/************************************************************************************
*************************************************************************************
* Public memory declarations
*************************************************************************************
************************************************************************************/

TERMINAL_PARAM  mTermParam;
uint8_t         CommDataBuffer[MAX_COMM_SIZE];
uint8_t         SendDataBuffer[MAX_COMM_SIZE];
uint16_t        CommDataIndex;
bool_t          evDataFromUART;
bool_t          gEnterIdle;
tmrTimerID_t    IntervalTmr;
tmrTimerID_t    WaitSendTmr;
tmrTimerID_t    SendTimeTmr;
uint8_t         mAppSer;
osThreadId      myAppId;
tmrTimerID_t    UartCheckTmr;
uint8_t         SendDataLen;


/************************************************************************************
*************************************************************************************
* Public functions
*************************************************************************************
************************************************************************************/

void MainThread( void const* );

void Debug_Print( char* pString )
{
#if 0
    Serial_Print( mAppSer, pString, gAllowToBlock_d );
#endif
}

void Debug_PrintDec( uint32_t nr )
{
#if 0
    Serial_PrintDec( mAppSer, nr );
#endif
}

void Debug_PrintHex( uint8_t *hex, uint8_t len, uint8_t flags )
{
#if 0
    Serial_PrintHex( mAppSer, hex, len, flags );
#endif
}

void Terminal_Print( char* pString )
{
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, pString, gAllowToBlock_d );
    }
}

void Terminal_PrintDec( uint32_t nr )
{
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_PrintDec( mAppSer, nr );
    }
}

void Terminal_PrintHex( uint8_t *hex, uint8_t len, uint8_t flags )
{
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_PrintHex( mAppSer, hex, len, flags );
    }
}

void Terminal_PrintBin( uint8_t *data, uint8_t len )
{
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_PrintBin( mAppSer, data, len, gAllowToBlock_d );
    }
}

void Processor_Print( char* pString )
{
    if( PROCESSOR == mTermParam.Mode )
    {
        Serial_Print( mAppSer, pString, gAllowToBlock_d );
    }
}

void Processor_PrintDec( uint32_t nr )
{
    if( PROCESSOR == mTermParam.Mode )
    {
        Serial_PrintDec( mAppSer, nr );
    }
}

void Processor_PrintHex( uint8_t *hex, uint8_t len, uint8_t flags )
{
    if( PROCESSOR == mTermParam.Mode )
    {
        Serial_PrintHex( mAppSer, hex, len, flags );
    }
}

void Processor_PrintBin( uint8_t *data, uint8_t len )
{
    if( PROCESSOR == mTermParam.Mode )
    {
        Serial_PrintBin( mAppSer, data, len, gAllowToBlock_d );
    }
}

/************************************************************************************
*
* MainThread
*
* Interface assumptions:
*     void const* taskParam
*
* Return value:
*     None
*
************************************************************************************/
void MainThread( void const* taskParam )
{
    MEM_Init();
    FLASH_Init();

    PORT_Init();
    TMR_Init();
    LED_Init();

    SerialManager_Init();

    MessageTask( taskParam );
}


/************************************************************************************
*************************************************************************************
* Private functions
*************************************************************************************
************************************************************************************/

/************************************************************************************
*
* MessageTask
*
* Interface assumptions:
*     void const *argument
*
* Return value:
*     None
*
************************************************************************************/
static void MessageTask( void const *argument )
{
    /* Initialization of global variables */
    InitProject();

    /* Read configuration parameter from internal FlashROM */
    ReadConfigParam();

    /* Get handle of uart interface */
    Serial_InitInterface( &mAppSer, gSerialMgrUart_c, 1 );

    /* Set default baud */
    Serial_SetBaudRate( mAppSer, mTermParam.Baudrate );

    if( RCM_SRS0 != RCM_SRS0_WAKEUP_MASK )
    {
	    /* Start Led Flashing */
	    LED_StartFlash( LED_ALL );

	    /* show configuration menu */
	    if( (CONFIG == mTermParam.Operation) || !(GPIOC_PDIR & (1<<1)) )
	    {
            Serial_SetRxCallBack( mAppSer, CommRxCallBack, NULL );

	        DoConfiguration();
	    }

	    /* Stop Led Flashing */
	    LED_StopFlash( LED_ALL );
    }
    else
    {
        gEnterIdle = FALSE;
    }

	/* Initialize Switch */
    if( (TIMER_WAKEUP == mTermParam.Sleep) || (GPIOC_PDIR & (1<<1)) )
    {
        gEnterIdle = TRUE;
    }
    else
    {
        gEnterIdle = FALSE;
    }

    Switch_Init();

    /* replace UART callback function */
    Serial_SetRxCallBack( mAppSer, UartRxCallback, NULL );

    DoOperation();
}

/************************************************************************************
*
* InitProject
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void InitProject( void )
{
    /* Global Data init */
    CommDataIndex       = 0;
    evDataFromUART      = FALSE;
    gEnterIdle          = TRUE;
    myAppId             = osThreadGetId();          // Get application thread id
    SendDataLen         = 0;
}

/************************************************************************************
*
* PORT_Init
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void PORT_Init( void )
{
    /* Port A */
    PORTA_PCR18 = PORT_PCR_MUX(1);
    GPIOA_PDDR |= (uint32_t)(1<<18);
    PORTA_PCR19 = PORT_PCR_MUX(1);
    GPIOA_PDDR |= (uint32_t)(1<<19);

    /* Port B */
    PORTB_PCR0 = PORT_PCR_MUX(1);
    GPIOB_PDDR |= (uint32_t)(1<<0);
    PORTB_PCR1 = PORT_PCR_MUX(1);
    GPIOB_PDDR |= (uint32_t)(1<<1);

    /* Port C */
    PORTC_PCR1 = PORT_PCR_MUX(1);
    GPIOC_PDDR &= (uint32_t)~(uint32_t)(1<<1);

    /* Port E */
    PORTE_PCR0 = PORT_PCR_MUX(1);
    GPIOE_PDDR |= (uint32_t)(1<<0);
    PORTE_PCR18 = PORT_PCR_MUX(1);
    GPIOE_PDDR |= (uint32_t)(1<<18);
    PORTE_PCR19 = PORT_PCR_MUX(1);
    GPIOE_PDDR |= (uint32_t)(1<<19);
    PORTE_PCR30 = PORT_PCR_MUX(1);
    GPIOE_PDDR |= (uint32_t)(1<<30);
}

/************************************************************************************
*
* Switch_Init
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void Switch_Init( void )
{
    PORTC_PCR1 = PORT_PCR_MUX(1)  | PORT_PCR_ISF_MASK |
                 PORT_PCR_PE_MASK | PORT_PCR_PS_MASK  | PORT_PCR_IRQC(0x09);

    if( osInstallIsr(INT_PORTC_PORTD, Switch_Interrupt, NULL) != NULL )
    {
        /* Set PORTC interrupt priority level 2 */
        NVIC_IPR7 &= 0x3FFFFFFF;
        NVIC_IPR7 |= 0x80000000;

        /* Enable Interrupt */
        NVIC_ICPR |= (uint32_t)(1 << ((INT_PORTC_PORTD-16)%32));
        NVIC_ISER |= (uint32_t)(1 << ((INT_PORTC_PORTD-16)%32));
    }
}

/************************************************************************************
*
* ReadConfigParam
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void ReadConfigParam( void )
{
    int ret = 0;


    FLib_MemSet16( &mTermParam, 0x00, sizeof(mTermParam) );

    *((uint16_t*)&mTermParam.Once[0]) = FLASH_ReadShortWord( FLASH_OFS_ONCE     );
    *((uint16_t*)&mTermParam.Once[2]) = FLASH_ReadShortWord( FLASH_OFS_ONCE + 2 );
    *((uint16_t*)&mTermParam.Once[4]) = FLASH_ReadShortWord( FLASH_OFS_ONCE + 4 );

    ret = strncmp( (char*)mTermParam.Once, ESLORA, 6 );
    if( 0 == ret )
    {
        /* baudrate */
        mTermParam.Baudrate     = FLASH_ReadLongWord( FLASH_OFS_BAUDRATE );

        /* sleeptime */
        mTermParam.SleepTime    = FLASH_ReadLongWord( FLASH_OFS_SLEEPTIME );

        /* power */
        mTermParam.Power        = (int32_t)FLASH_ReadLongWord( FLASH_OFS_POWER );

        /* ack */
        mTermParam.Ack          = FLASH_ReadShortWord( FLASH_OFS_ACK );

        /* bw */
        mTermParam.Bw           = FLASH_ReadShortWord( FLASH_OFS_BW );

        /* channel */
        mTermParam.Channel      = FLASH_ReadShortWord( FLASH_OFS_CHANNEL );

        /* dstid */
        mTermParam.DstId        = FLASH_ReadShortWord( FLASH_OFS_DSTID );

        /* endid */
        mTermParam.EndId        = FLASH_ReadShortWord( FLASH_OFS_ENDID );

        /* hopcount */
        mTermParam.HopCnt       = FLASH_ReadShortWord( FLASH_OFS_HOPCNT );

        /* mode */
        mTermParam.Mode         = FLASH_ReadShortWord( FLASH_OFS_MODE );

        /* node */
        mTermParam.Node         = FLASH_ReadShortWord( FLASH_OFS_NODE );

        /* operation */
        mTermParam.Operation    = FLASH_ReadShortWord( FLASH_OFS_OPERATION );

        /* panid */
        mTermParam.PanId        = FLASH_ReadShortWord( FLASH_OFS_PANID );

        /* rcvid */
        mTermParam.RcvId        = FLASH_ReadShortWord( FLASH_OFS_RCVID );

        /* retry */
        mTermParam.Retry        = FLASH_ReadShortWord( FLASH_OFS_RETRY );

        /* route1 */
        mTermParam.Route[0]     = FLASH_ReadShortWord( FLASH_OFS_ROUTE1 );

        /* route2 */
        mTermParam.Route[1]     = FLASH_ReadShortWord( FLASH_OFS_ROUTE2 );

        /* rssi */
        mTermParam.Rssi         = FLASH_ReadShortWord( FLASH_OFS_RSSI );

        /* sf */
        mTermParam.Sf           = FLASH_ReadShortWord( FLASH_OFS_SF );

        /* sleep */
        mTermParam.Sleep        = FLASH_ReadShortWord( FLASH_OFS_SLEEP );

        /* srcid */
        mTermParam.SrcId        = FLASH_ReadShortWord( FLASH_OFS_SRCID );

        /* transmode */
        mTermParam.TransMode    = FLASH_ReadShortWord( FLASH_OFS_TRANSMODE );

        /* format */
        mTermParam.Format       = FLASH_ReadShortWord( FLASH_OFS_FORMAT );

        /* sendtime */
        mTermParam.SendTime     = FLASH_ReadLongWord( FLASH_OFS_SENDTIME );

        /* senddata */
        FLib_MemCpy( mTermParam.SendData, (uint8_t*)(FLASH_PARAM_TOP + FLASH_OFS_SENDDATA), 52 );
    }
    else
    {
        mTermParam.Once[0] = 'E';
        mTermParam.Once[1] = 'S';
        mTermParam.Once[2] = 'L';
        mTermParam.Once[3] = 'O';
        mTermParam.Once[4] = 'R';
        mTermParam.Once[5] = 'A';

        SettingDefaultValue();
    }

    Serial_SetBaudRate( mAppSer, mTermParam.Baudrate );
}

/************************************************************************************
*
* SettingDefaultValue
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
void SettingDefaultValue( void )
{
    /* baudrate */
    mTermParam.Baudrate     = gUARTBaudRate115200_c;

    /* sleeptime */
    mTermParam.SleepTime    = 50;

    /* power */
    mTermParam.Power        = 13;

    /* ack */
    mTermParam.Ack          = MODE_ON;

    /* bw */
    mTermParam.Bw           = BANDWIDTH125;

    /* channel */
    mTermParam.Channel      = 1;

    /* dstid */
    mTermParam.DstId        = 0x0000;

    /* endid */
    mTermParam.EndId        = 0x0000;

    /* hopcount */
    mTermParam.HopCnt       = 0x0001;

    /* node */
    mTermParam.Node         = END_DEVICE;

    /* operation */
    mTermParam.Operation    = CONFIG;

    /* panid */
    mTermParam.PanId        = 0x0001;

    /* rcvid */
    mTermParam.RcvId        = MODE_OFF;

    /* retry */
    mTermParam.Retry        = 3;

    /* route1 */
    mTermParam.Route[0]     = 0x0001;

    /* route2 */
    mTermParam.Route[1]     = 0x0001;

    /* rssi */
    mTermParam.Rssi         = MODE_OFF;

    /* sf */
    mTermParam.Sf           = 7;

    /* sleep */
    mTermParam.Sleep        = NO_SLEEP;

    /* srcid */
    mTermParam.SrcId        = 0x0001;

    /* transmode */
    mTermParam.TransMode    = TRANS_PAYLOAD;

    /* format */
    mTermParam.Format       = FMT_ASCII;

    /* sendtime */
    mTermParam.SendTime     = 0;

    /* senddata */
    mTermParam.SendData[0]  = '\0';
}


/************************************************************************************
* User's Callbacks
************************************************************************************/

/************************************************************************************
*
* UartRxCallback
*
* Interface assumptions:
*     void* param
*
* Return value:
*     None
*
************************************************************************************/
static void UartRxCallback( void* param )
{
    static uint16_t rcvlen = 0;
    uint32_t length;
    uint16_t readBytes;
    int      ret;


    while( gSerial_Success_c == Serial_GetByteFromRxBuffer(mAppSer, &CommDataBuffer[CommDataIndex], &readBytes) )
    {
        if( 0 == readBytes )
        {
            break;
        }

        if( FMT_ASCII == mTermParam.Format )
        {
            if( (0 < CommDataIndex) && (('\r' == CommDataBuffer[CommDataIndex-1]) && ('\n' == CommDataBuffer[CommDataIndex])) )
            {
                CommDataBuffer[CommDataIndex-1] = '\0';
                CommDataBuffer[CommDataIndex]   = '\0';

                CommDataIndex = 0;

                ret = strcmp( (char*)CommDataBuffer, "config" );
                if( 0 == ret )
                {
                    mTermParam.Operation = CONFIG;

                    _int_disable();

                    FLASH_EraseSector( FLASH_PARAM_TOP );

                    length = sizeof(mTermParam) + ((sizeof(mTermParam) % 4) ? (4 - sizeof(mTermParam) % 4) : 0);

                    FLASH_ProgramSectionByLongs( FLASH_PARAM_TOP, (uint32_t*)&mTermParam, (length / sizeof(uint32_t)) );

                    _int_enable();
                }
                else
                {
                    /* ignore only enter key */
                    if ( '\0' == CommDataBuffer[0] )
                    {
                        return;
                    }

                    SendDataLen = strlen( (char*)CommDataBuffer );

                    strcpy( (char*)SendDataBuffer, (char*)CommDataBuffer );

                    osSignalSet( myAppId, EVENT_UART_RX );
                }
            }
            else
            {
                CommDataIndex++;
                if( MAX_COMM_SIZE <= CommDataIndex )
                {
                    CommDataIndex = 0;
                }
            }
        }
        else
        {
            /* receive length */
            if( 0 == CommDataIndex )
            {
                rcvlen = CommDataBuffer[0];

                CommDataIndex++;

                TMR_StartSingleShotTimer( UartCheckTmr, UART_CHK_TIME, UartCheckTimerCallBack, NULL );
            }
            else if( (5 == CommDataIndex) && (0 == strcmp( (char*)CommDataBuffer, "config" )) )
            {
                TMR_StopTimer( UartCheckTmr );

                mTermParam.Operation = CONFIG;

                _int_disable();

                FLASH_EraseSector( FLASH_PARAM_TOP );

                length = sizeof(mTermParam) + ((sizeof(mTermParam) % 4) ? (4 - sizeof(mTermParam) % 4) : 0);

                FLASH_ProgramSectionByLongs( FLASH_PARAM_TOP, (uint32_t*)&mTermParam, (length / sizeof(uint32_t)) );

                _int_enable();
            }
            /* receive end */
            else if( rcvlen == CommDataIndex )
            {
                TMR_StopTimer( UartCheckTmr );

                SendDataLen = rcvlen;

                FLib_MemCpy( SendDataBuffer, &CommDataBuffer[1], CommDataIndex );

                osSignalSet( myAppId, EVENT_UART_RX );

                CommDataIndex = 0;
            }
            /* other */
            else
            {
                TMR_StopTimer( UartCheckTmr );

                CommDataIndex++;
                if( MAX_COMM_SIZE <= CommDataIndex )
                {
                    CommDataIndex = 0;
                }

                TMR_StartSingleShotTimer( UartCheckTmr, UART_CHK_TIME, UartCheckTimerCallBack, NULL );
            }
        }
    }
}

/************************************************************************************
*
* UartCheckTimerCallBack
*
* Interface assumptions:
*     param       timer ID
*
* Return value:
*     None
*
************************************************************************************/
static void UartCheckTimerCallBack( void* param )
{
    CommDataIndex = 0;
}
