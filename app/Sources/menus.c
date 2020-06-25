/*****************************************************************************
* Menus file.
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
#include "usr_tasks.h"
#include "menus.h"
#include "mqxlite.h"


/************************************************************************************
*************************************************************************************
* Private macros
*************************************************************************************
************************************************************************************/
#define MIN_CHANNEL         1
#define MAX_CHANNEL_MODE1   15
#define MAX_CHANNEL_MODE2   7
#define MAX_CHANNEL_MODE3   5
#define MIN_POWER           -4
#define MAX_POWER           13

#define SOFTWARE_VERSION    "VER 1.12"


/************************************************************************************
*************************************************************************************
* Private prototypes
*************************************************************************************
************************************************************************************/
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
#ifdef _STATIC_ROUTING_
static void CommExecSetHopCount( int, int );
static void CommExecSetEndId( int, int );
static void CommExecSetRoute1( int, int );
static void CommExecSetRoute2( int, int );
static void CommExecSetRoute( int, int, int );
#endif
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


/************************************************************************************
*************************************************************************************
* Private memory declarations
*************************************************************************************
************************************************************************************/
static uint8_t const cu8ModeSel[] = { "Select Mode [1.terminal or 2.processor]" };
static uint8_t const cu8Prompt[]  = { "LORA > " };
static uint8_t const cu8Version[] = { SOFTWARE_VERSION };

uint8_t* const cu8Logo[] = {
    "\r\n",
    "\r\n",
    "\r Software Version : ",
    SOFTWARE_VERSION,
    "\r\n",
    NULL
};

uint8_t* const cu8MainMenu[] = {
    "\r\n\r Configuration Mode\n",
    "\r------------------------------------------\n",
#ifdef _STATIC_ROUTING_
    "\r a. node        select Coordinator or EndDevice or Router\n",
#else
    "\r a. node        select Coordinator or EndDevice\n",
#endif
    "\r b. bw          select Band Width\n",
    "\r c. sf          set Spreading Factor\n",
    "\r d. channel     set channel\n",
    "\r e. panid       set PAN ID\n",
    "\r f. ownid       set Own Node ID\n",
    "\r g. dstid       set Destination ID\n",
#ifdef _STATIC_ROUTING_
    "\r h. hopcount    set Hop Count\n",
    "\r i. endid       set End ID\n",
    "\r j. route1      set 1st Router ID\n",
    "\r k. route2      set 2nd Router ID\n",
#endif
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
    NULL
};

uint8_t* const cuOnOffMenu[] = {
    "\r\n  1. ON",
    "\r\n  2. OFF",
    "\r\n",
    "\r\n  select number > ",
    NULL
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
    NULL
};

uint8_t* const cuNodeMenu[] = {
    "\r\n  1. Coordinator",
    "\r\n  2. EndDevice",
#ifdef _STATIC_ROUTING_
    "\r\n  3. Router",
#endif
    "\r\n",
    "\r\n  select number > ",
    NULL
};

uint8_t* const cuOperationMenu[] = {
    "\r\n  1. Configuration",
    "\r\n  2. Operation",
    "\r\n",
    "\r\n  select number > ",
    NULL
};

uint8_t* const cuBwMenu[] = {
#if 0
    "\r\n  1. 31.25kHz",
    "\r\n  2. 41.7kHz",
#endif
    "\r\n  3. 62.5kHz",
    "\r\n  4. 125kHz",
    "\r\n  5. 250kHz",
    "\r\n  6. 500kHz",
    "\r\n",
    "\r\n  select number > ",
    NULL
};

uint8_t* const cuSleepMenu[] = {
    "\r\n  1. No Sleep",
    "\r\n  2. Timer Wakeup",
    "\r\n  3. INT Wakeup",
    "\r\n",
    "\r\n  select number > ",
    NULL
};

uint8_t* const cuTransMenu[] = {
    "\r\n  1. Payload",
    "\r\n  2. Frame",
    "\r\n",
    "\r\n  select number > ",
    NULL
};

uint8_t* const cuFormatMenu[] = {
    "\r\n  1. ASCII",
    "\r\n  2. BINARY",
    "\r\n",
    "\r\n  select number > ",
    NULL
};

struct
{
    char    sname[4];
    char    name[12];
    void    (*func)(int, int);
} const command1[] = {
                  { "a"     , "node"        , CommExecSelectNode         },   // 1
                  { "b"     , "bw"          , CommExecSelectBandWidth    },   // 2
                  { "c"     , "sf"          , CommExecSetSpreadingFactor },   // 3
                  { "d"     , "channel"     , CommExecSetChannel         },   // 4
                  { "e"     , "panid"       , CommExecSetPanId           },   // 5
                  { "f"     , "ownid"       , CommExecSetSourceId        },   // 6
                  { "g"     , "dstid"       , CommExecSetDestinationId   },   // 7
#ifdef _STATIC_ROUTING_
                  { "h"     , "hopcount"    , CommExecSetHopCount        },   // 8
                  { "i"     , "endid"       , CommExecSetEndId           },   // 9
                  { "j"     , "route1"      , CommExecSetRoute1          },   // 10
                  { "k"     , "route2"      , CommExecSetRoute2          },   // 11
#endif
                  { "l"     , "ack"         , CommExecSetAck             },   // 12
                  { "m"     , "retry"       , CommExecSetRetry           },   // 13
                  { "n"     , "transmode"   , CommExecSelectTransMode    },   // 14
                  { "o"     , "rcvid"       , CommExecSelectRcvId        },   // 15
                  { "p"     , "rssi"        , CommExecSelectRssi         },   // 16
                  { "q"     , "operation"   , CommExecSelectOperation    },   // 17
                  { "r"     , "baudrate"    , CommExecSelectBaudrate     },   // 18
                  { "s"     , "sleep"       , CommExecSelectSleep        },   // 19
                  { "t"     , "sleeptime"   , CommExecSetSleepTime       },   // 20
                  { "u"     , "power"       , CommExecSetPower           },   // 21
                  { "v"     , "version"     , CommExecVersion            },   // 22
                  { "w"     , "save"        , CommExecSaveParameter      },   // 23
                  { "x"     , "load"        , CommExecLoadParameter      },   // 24
                  { "y"     , "show"        , CommExecShow               },   // 25
                  { "A"     , "format"      , CommExecSetFormat          },   //
                  { "B"     , "sendtime"    , CommExecSetSendTime        },   //
                  { "C"     , "senddata"    , CommExecSetSendData        },   //
                  { "?"     , "help"        , CommExecHelp               },   // 26
                  { "\0"    , "\0"          , 0                          }
              };


/************************************************************************************
*************************************************************************************
* Interface functions
*************************************************************************************
************************************************************************************/
void IsChar( void )
{
    while( !evDataFromUART )
    {
        WDG_Refresh();
    }
    evDataFromUART = FALSE;
}

/***********************************************************************************
* DoConfiguration
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
void DoConfiguration( void )
{
    int32_t i;
    int     ret;
    uint8_t mode;
    uint8_t tmpcmd[16];


    mode = SelectMode();
    if( TERMINAL == mode )
    {
        PrintMessage( cu8Logo );
        PrintMessage( cu8MainMenu );
    }

    tmpcmd[15] = 0;

    while( 1 )
    {
        WDG_Refresh();

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

        if( (0 == command1[i].func) && (PROCESSOR == mTermParam.Mode) )
        {
            Serial_Print( mAppSer, "NG 001\r\n", gAllowToBlock_d );
        }
    }
}

/***********************************************************************************
* CommRxCallBack
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
void CommRxCallBack( void* param )
{
    uint16_t readBytes;

    while( gSerial_Success_c == Serial_GetByteFromRxBuffer(mAppSer, &CommDataBuffer[CommDataIndex], &readBytes) )
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

            evDataFromUART = TRUE;
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
            if( MAX_COMM_SIZE <= CommDataIndex )
            {
                CommDataIndex = 0;
            }
        }
    }
}


/************************************************************************************
*************************************************************************************
* private functions
*************************************************************************************
************************************************************************************/

/***********************************************************************************
* SelectMode
*
* Interface assumptions:
*     None
*
* Return value:
*     Mode      Terminal or Processor
*
************************************************************************************/
static uint8_t SelectMode( void )
{
    int     ret;


    CommShowModeSel();

    /* wait terminal or processor */
    while( 1 )
    {
        IsChar();

        ret = strcmp( "terminal", (char*)CommDataBuffer );
        if( 0 == ret )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            mTermParam.Mode = TERMINAL;
            break;
        }

        ret = strcmp( "processor", (char*)CommDataBuffer );
        if( 0 == ret )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            mTermParam.Mode = PROCESSOR;
            break;
        }

        ret = strcmp( "1", (char*)CommDataBuffer );
        if( 0 == ret )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            mTermParam.Mode = TERMINAL;
            break;
        }

        ret = strcmp( "2", (char*)CommDataBuffer );
        if( 0 == ret )
        {
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            mTermParam.Mode = PROCESSOR;
            break;
        }

        Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
    }

    return( mTermParam.Mode );
}

/***********************************************************************************
* PrintMessage
*
* Interface assumptions:
*     pu8Menu       print message
*
* Return value:
*     None
*
************************************************************************************/
static void PrintMessage( uint8_t* const pu8Menu[] )
{
    uint8_t u8Index = 0;

    while( pu8Menu[u8Index] )
    {
        WDG_Refresh();
        Serial_Print( mAppSer, (char*)pu8Menu[u8Index], gAllowToBlock_d );
        u8Index++;
    }
}

/***********************************************************************************
* CommShowModeSel
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void CommShowModeSel( void )
{
    Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );
    Serial_Print( mAppSer, (char*)cu8ModeSel, gAllowToBlock_d );
    Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );
}

/***********************************************************************************
* CommShowPrompt
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
************************************************************************************/
static void CommShowPrompt( void )
{
    uint8_t u8lineLen = 20;
    uint8_t u8Index;


    /* Erase old line */
    if( TERMINAL == mTermParam.Mode )
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

/***********************************************************************************
* CommExecSelectNode
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSelectNode( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuNodeMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
        }

        switch( tmpMode )
        {
        case COORDINATOR:
            mTermParam.Node = COORDINATOR;
            Serial_Print( mAppSer, "\r\n  Coordinator is selected.", gAllowToBlock_d );
            break;

        case END_DEVICE:
            mTermParam.Node = END_DEVICE;
            Serial_Print( mAppSer, "\r\n  EndDevice is selected.", gAllowToBlock_d );
            break;

#ifdef _STATIC_ROUTING_
        case ROUTER:
            mTermParam.Node = ROUTER;
            Serial_Print( mAppSer, "\r\n  Router is selected.", gAllowToBlock_d );
            break;
#endif

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
        }

#ifdef _STATIC_ROUTING_
        if( (COORDINATOR == tmpMode) || (END_DEVICE == tmpMode) || (ROUTER == tmpMode) )
#else
        if( (COORDINATOR == tmpMode) || (END_DEVICE == tmpMode) )
#endif
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

/***********************************************************************************
* CommExecSelectBandWidth
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSelectBandWidth( int index, int nameLen )
{
    uint8_t maxChannel = 0;
    uint8_t tmpBw = 0;
    uint8_t findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuBwMenu );

        IsChar();

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[findIndex]) )
            {
                tmpBw += AsciiToDec( CommDataBuffer[findIndex] );
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
#if 0
        case 1:
            mTermParam.Bw = BANDWIDTH31_25;
            maxChannel    = MAX_CHANNEL_MODE1;
            Serial_Print( mAppSer, "\r\n  31.25kHz is selected.", gAllowToBlock_d );
            break;

        case 2:
            mTermParam.Bw = BANDWIDTH41_7;
            maxChannel    = MAX_CHANNEL_MODE1;
            Serial_Print( mAppSer, "\r\n  41.7kHz is selected.", gAllowToBlock_d );
            break;
#endif
        case 3:
            mTermParam.Bw = BANDWIDTH62_5;
            maxChannel    = MAX_CHANNEL_MODE1;
            Serial_Print( mAppSer, "\r\n  62.5kHz is selected.", gAllowToBlock_d );
            break;

        case 4:
            mTermParam.Bw = BANDWIDTH125;
            maxChannel    = MAX_CHANNEL_MODE1;
            Serial_Print( mAppSer, "\r\n  125kHz is selected.", gAllowToBlock_d );
            break;

        case 5:
            mTermParam.Bw = BANDWIDTH250;
            maxChannel    = MAX_CHANNEL_MODE2;
            Serial_Print( mAppSer, "\r\n  250kHz is selected.", gAllowToBlock_d );
            break;

        case 6:
            mTermParam.Bw = BANDWIDTH500;
            maxChannel    = MAX_CHANNEL_MODE3;
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpBw += AsciiToDec( CommDataBuffer[nameLen+1+findIndex] );
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
#if 0
        case 1:
        case 2:
#endif
        case 3:
        case 4:
            mTermParam.Bw = tmpBw + 3;
            maxChannel    = MAX_CHANNEL_MODE1;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 5:
            mTermParam.Bw = tmpBw + 3;
            maxChannel    = MAX_CHANNEL_MODE2;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        case 6:
            mTermParam.Bw = tmpBw + 3;
            maxChannel    = MAX_CHANNEL_MODE3;
            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
            break;
        }
    }

    // adjust channel
    if( maxChannel < mTermParam.Channel )
    {
        mTermParam.Channel = 1;
    }
}

/***********************************************************************************
* CommExecSetSpreadingFactor
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetSpreadingFactor( int index, int nameLen )
{
    uint8_t     tmpCount = 0;
    uint8_t     findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set Spreading Factor (7 - 12) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[findIndex]) )
            {
                tmpCount += AsciiToDec( CommDataBuffer[findIndex] );
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpCount += AsciiToDec( CommDataBuffer[nameLen+1+findIndex] );
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

/***********************************************************************************
* CommExecSetChannel
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetChannel( int index, int nameLen )
{
    uint8_t tmpChannel = 0;
    uint8_t maxChannel = 0;
    uint8_t findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        if( BANDWIDTH250 == mTermParam.Bw )
        {
            maxChannel = MAX_CHANNEL_MODE2;
            Serial_Print( mAppSer, "\r\n  please set channel (1 - 7) > ", gAllowToBlock_d );
        }
        else if( BANDWIDTH500 == mTermParam.Bw )
        {
            maxChannel = MAX_CHANNEL_MODE3;
            Serial_Print( mAppSer, "\r\n  please set channel (1 - 5) > ", gAllowToBlock_d );
        }
        else
        {
            maxChannel = MAX_CHANNEL_MODE1;
            Serial_Print( mAppSer, "\r\n  please set channel (1 - 15) > ", gAllowToBlock_d );
        }

        IsChar();

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[findIndex]) )
            {
                tmpChannel += AsciiToDec( CommDataBuffer[findIndex] );
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
    /* processor mode */
    else
    {
        if( BANDWIDTH250 == mTermParam.Bw )
        {
            maxChannel = MAX_CHANNEL_MODE2;
        }
        else if( BANDWIDTH500 == mTermParam.Bw )
        {
            maxChannel = MAX_CHANNEL_MODE3;
        }
        else
        {
            maxChannel = MAX_CHANNEL_MODE1;
        }

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpChannel += AsciiToDec( CommDataBuffer[nameLen+1+findIndex] );
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

/***********************************************************************************
* CommExecSetPanId
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetPanId( int index, int nameLen )
{
    uint16_t    tmpId = 0;
    uint8_t     findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set PAN ID (0001 - FFFE) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[findIndex] );
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[nameLen+1+findIndex] );
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

/***********************************************************************************
* CommExecSetSourceId
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetSourceId( int index, int nameLen )
{
    uint16_t    tmpId = 0;
    uint8_t     findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set Own Node ID (0000 - FFFE) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[findIndex] );
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[nameLen+1+findIndex] );
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

/***********************************************************************************
* CommExecSetDestinationId
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetDestinationId( int index, int nameLen )
{
    uint16_t    tmpId = 0;
    uint8_t     findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set Destination ID (0000 - FFFF) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[findIndex] );
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[nameLen+1+findIndex] );
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

#ifdef _STATIC_ROUTING_
/***********************************************************************************
* CommExecSetHopCount
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetHopCount( int index, int nameLen )
{
    uint8_t tmpCount = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set hop count (1 - 3) > ", gAllowToBlock_d );

        IsChar();

        if( isAsciiDec(CommDataBuffer[0]) )
        {
            tmpCount = AsciiToDec( CommDataBuffer[0] );
        }

        if( (MIN_HOP_COUNT <= tmpCount) && (tmpCount <= MAX_HOP_COUNT) )
        {
            mTermParam.HopCnt = tmpCount;

            Serial_Print( mAppSer, "\r\n  hop count is ", gAllowToBlock_d );
            Serial_PrintDec( mAppSer, mTermParam.HopCnt );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  hop count is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        if( isAsciiDec(CommDataBuffer[nameLen+1]) )
        {
            tmpCount = AsciiToDec( CommDataBuffer[nameLen+1] );
        }

        if( (MIN_HOP_COUNT <= tmpCount) && (tmpCount <= MAX_HOP_COUNT) )
        {
            mTermParam.HopCnt = tmpCount;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}

/***********************************************************************************
* CommExecSetEndId
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetEndId( int index, int nameLen )
{
    uint16_t    tmpId = 0;
    uint8_t     findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set End ID (0000 - FFFE) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[findIndex] );
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
            mTermParam.EndId = tmpId;

            Serial_Print( mAppSer, "\r\n  End ID is 0x", gAllowToBlock_d );
            Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.EndId, 2, 0 );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  End ID is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[nameLen+1+findIndex] );
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
            mTermParam.EndId = tmpId;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}

/***********************************************************************************
* CommExecSetRoute1
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetRoute1( int index, int nameLen )
{
    CommExecSetRoute( index, 0, nameLen );
}

/***********************************************************************************
* CommExecSetRoute2
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetRoute2( int index, int nameLen )
{
    CommExecSetRoute( index, 1, nameLen );
}

/***********************************************************************************
* CommExecSetRoute
*
* Interface assumptions:
*     index         command index
*     route         route index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetRoute( int index, int route, int nameLen )
{
    uint16_t    tmpId = 0;
    uint8_t     findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set Router", gAllowToBlock_d );
        Serial_PrintDec( mAppSer, route + 1 );
        Serial_Print( mAppSer, " ID (0001 - FFFE) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[findIndex] );
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
            mTermParam.Route[route] = tmpId;

            Serial_Print( mAppSer,  "\r\n  Router", gAllowToBlock_d );
            Serial_PrintDec( mAppSer,  route + 1 );
            Serial_Print( mAppSer,  " ID is 0x", gAllowToBlock_d );
            Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.Route[route], 2, 0 );
        }
        else
        {
            Serial_Print( mAppSer, "\r\n  Router", gAllowToBlock_d );
            Serial_PrintDec( mAppSer, route + 1 );
            Serial_Print( mAppSer,  " ID is invalid.", gAllowToBlock_d );
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 4; findIndex++ )
        {
            if( isAsciiHex(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpId |= AsciiToHex( CommDataBuffer[nameLen+1+findIndex] );
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
            mTermParam.Route[route] = tmpId;

            Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
        }
        else
        {
            Serial_Print( mAppSer, "NG 002\r\n", gAllowToBlock_d );
        }
    }
}
#endif

/***********************************************************************************
* CommExecSetAck
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetAck( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuOnOffMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
        }

        switch( tmpMode )
        {
        case MODE_ON:
            mTermParam.Ack = MODE_ON;
            Serial_Print( mAppSer, "\r\n  Acknowledge is ON.", gAllowToBlock_d );
            break;

        case MODE_OFF:
            mTermParam.Ack = MODE_OFF;
            Serial_Print( mAppSer, "\r\n  Acknowledge is OFF.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
        }

        if( (MODE_ON == tmpMode) || (MODE_OFF == tmpMode) )
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

/***********************************************************************************
* CommExecSetRetry
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetRetry( int index, int nameLen )
{
    uint8_t tmpCount = 0;
    uint8_t findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set retry count (0 - 10) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[findIndex]) )
            {
                tmpCount += AsciiToDec( CommDataBuffer[findIndex] );
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

        if( tmpCount <= MAX_RETRY_CNT )
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 2; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpCount += AsciiToDec( CommDataBuffer[nameLen+1+findIndex] );
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

        if( tmpCount <= MAX_RETRY_CNT )
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

/***********************************************************************************
* CommExecSelectTransMode
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSelectTransMode( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuTransMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
        }

        switch( tmpMode )
        {
        case TRANS_PAYLOAD:
            mTermParam.TransMode = TRANS_PAYLOAD;
            Serial_Print( mAppSer, "\r\n  Payload Mode is selected.", gAllowToBlock_d );
            break;

        case TRANS_FRAME:
            mTermParam.TransMode = TRANS_FRAME;
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
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
        }

        if( (TRANS_PAYLOAD == tmpMode) || (TRANS_FRAME == tmpMode) )
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

/***********************************************************************************
* CommExecSelectRcvId
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSelectRcvId( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuOnOffMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
        }

        switch( tmpMode )
        {
        case MODE_ON:
            mTermParam.RcvId = MODE_ON;
            Serial_Print( mAppSer, "\r\n  Receive Node ID information is ON.", gAllowToBlock_d );
            break;

        case MODE_OFF:
            mTermParam.RcvId = MODE_OFF;
            Serial_Print( mAppSer, "\r\n  Receive Node ID information is OFF.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
        }

        if( (MODE_ON == tmpMode) || (MODE_OFF == tmpMode) )
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

/***********************************************************************************
* CommExecSelectRssi
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSelectRssi( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuOnOffMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
        }

        switch( tmpMode )
        {
        case MODE_ON:
            mTermParam.Rssi = MODE_ON;
            Serial_Print( mAppSer, "\r\n  RSSI information is ON.", gAllowToBlock_d );
            break;

        case MODE_OFF:
            mTermParam.Rssi = MODE_OFF;
            Serial_Print( mAppSer, "\r\n  RSSI information is OFF.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
        }

        if( (MODE_ON == tmpMode) || (MODE_OFF == tmpMode) )
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

/***********************************************************************************
* CommExecSelectOperation
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSelectOperation( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuOperationMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
        }

        switch( tmpMode )
        {
        case CONFIG:
            mTermParam.Operation = CONFIG;
            Serial_Print( mAppSer, "\r\n  Configuration is selected.", gAllowToBlock_d );
            break;

        case OPERATION:
            mTermParam.Operation = OPERATION;
            Serial_Print( mAppSer, "\r\n  Operation is selected.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
        }

        if( (CONFIG == tmpMode) || (OPERATION == tmpMode) )
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

/***********************************************************************************
* CommExecSelectBaudrate
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSelectBaudrate( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuBaudrateMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
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
    /* processor mode */
    else
    {
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
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

/***********************************************************************************
* CommExecSelectSleep
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSelectSleep( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuSleepMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
        }

        switch( tmpMode )
        {
        case NO_SLEEP:
            mTermParam.Sleep = NO_SLEEP;
            Serial_Print( mAppSer, "\r\n  No Sleep Mode is selected.", gAllowToBlock_d );
            break;

        case TIMER_WAKEUP:
            mTermParam.Sleep = TIMER_WAKEUP;
            Serial_Print( mAppSer, "\r\n  Timer Wakeup Mode is selected.", gAllowToBlock_d );
            break;

        case INT_WAKEUP:
            mTermParam.Sleep = INT_WAKEUP;
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
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
        }

        if( (NO_SLEEP == tmpMode) || (TIMER_WAKEUP == tmpMode) || (INT_WAKEUP == tmpMode) )
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

/***********************************************************************************
* CommExecSetSleepTime
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetSleepTime( int index, int nameLen )
{
    uint32_t tmpValue = 0;
    uint8_t findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set sleep time (1 - 864000) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 6; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[findIndex]) )
            {
                tmpValue += AsciiToDec( CommDataBuffer[findIndex] );
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

        if( (0 < tmpValue) && (tmpValue <= MAX_SLEEP_TIME) )
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 6; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpValue += AsciiToDec( CommDataBuffer[nameLen+1+findIndex] );
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

        if( (0 < tmpValue) && (tmpValue <= MAX_SLEEP_TIME) )
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

/***********************************************************************************
* CommExecSetPower
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetPower( int index, int nameLen )
{
    int32_t tmpValue = 0;
    uint8_t findIndex;
    bool_t  isMinus = FALSE;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set output power (-4 - 13) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 3; findIndex++ )
        {
            if( (0 == findIndex) && ('-' == CommDataBuffer[0]) )
            {
                isMinus = TRUE;
                continue;
            }

            if( isAsciiDec(CommDataBuffer[findIndex]) )
            {
                tmpValue += AsciiToDec( CommDataBuffer[findIndex] );
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

        if( TRUE == isMinus )
        {
            tmpValue = -tmpValue;
        }

        if( (MIN_POWER <= tmpValue) && (tmpValue <= MAX_POWER) )
        {
            mTermParam.Power = tmpValue;

            Serial_Print( mAppSer, "\r\n  output power is ", gAllowToBlock_d );
            if( TRUE == isMinus )
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 3; findIndex++ )
        {
            if( (0 == findIndex) && ('-' == CommDataBuffer[nameLen+1]) )
            {
                isMinus = TRUE;
                continue;
            }

            if( isAsciiDec(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpValue += AsciiToDec( CommDataBuffer[nameLen+1+findIndex] );
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

        if( TRUE == isMinus )
        {
            tmpValue = -tmpValue;
        }

        if( (MIN_POWER <= tmpValue) && (tmpValue <= MAX_POWER) )
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

/***********************************************************************************
* CommExecSetFormat
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetFormat( int index, int nameLen )
{
    uint8_t tmpMode = 0;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        PrintMessage( cuFormatMenu );

        IsChar();

        if( isAsciiHex(CommDataBuffer[0]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[0] );
        }

        switch( tmpMode )
        {
        case FMT_ASCII:
            mTermParam.Format = FMT_ASCII;
            Serial_Print( mAppSer, "\r\n  ASCII format is selected.", gAllowToBlock_d );
            break;

        case FMT_BINARY:
            mTermParam.Format = FMT_BINARY;
            Serial_Print( mAppSer, "\r\n  BINARY format is selected.", gAllowToBlock_d );
            break;

        default:
            Serial_Print( mAppSer, "\r\n  selected number is invalid.", gAllowToBlock_d );
            break;
        }

        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        if( isAsciiHex(CommDataBuffer[nameLen+1]) )
        {
            tmpMode = AsciiToHex( CommDataBuffer[nameLen+1] );
        }

        if( (FMT_ASCII == tmpMode) || (FMT_BINARY == tmpMode) )
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

/***********************************************************************************
* CommExecSetSendTime
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetSendTime( int index, int nameLen )
{
    uint32_t tmpValue = 0;
    uint8_t findIndex;


    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set send time (0 - 86400) > ", gAllowToBlock_d );

        IsChar();

        for( findIndex = 0; findIndex < 5; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[findIndex]) )
            {
                tmpValue += AsciiToDec( CommDataBuffer[findIndex] );
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

        if( tmpValue <= MAX_SEND_TIME )
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
    /* processor mode */
    else
    {
        for( findIndex = 0; findIndex < 5; findIndex++ )
        {
            if( isAsciiDec(CommDataBuffer[nameLen+1+findIndex]) )
            {
                tmpValue += AsciiToDec( CommDataBuffer[nameLen+1+findIndex] );
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

        if( tmpValue <= MAX_SEND_TIME )
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

/***********************************************************************************
* CommExecSetSendData
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSetSendData( int index, int nameLen )
{
    /* terminal mode */
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n  please set send data > ", gAllowToBlock_d );

        IsChar();

        FLib_MemCpy( mTermParam.SendData, CommDataBuffer, 50 );
        mTermParam.SendData[50] = '\0';


        Serial_Print( mAppSer, "\r\n  send data is ", gAllowToBlock_d );
        Serial_Print( mAppSer, (char*)mTermParam.SendData, gAllowToBlock_d );
        Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
    }
    /* processor mode */
    else
    {
        FLib_MemCpy( mTermParam.SendData, &CommDataBuffer[nameLen+1], 50 );
        mTermParam.SendData[50] = '\0';
        Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
    }
}

/***********************************************************************************
* CommExecVersion
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecVersion( int index, int nameLen )
{
    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, (char*)cu8Version, gAllowToBlock_d );
    Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );

    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\n", gAllowToBlock_d );
    }
}

/***********************************************************************************
* CommExecSaveParameter
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecSaveParameter( int index, int nameLen )
{
    uint32_t    length;
    uint32_t    ret;


    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "\r\nsave parameter ...", gAllowToBlock_d );
    }

    _int_disable();

    ret = FLASH_EraseSector( FLASH_PARAM_TOP );
    if( 0 != ret )
    {
        if( TERMINAL == mTermParam.Mode )
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

    ret = FLASH_ProgramSectionByLongs( FLASH_PARAM_TOP, (uint32_t*)&mTermParam, (length / sizeof(uint32_t)) );
    if( 0 != ret )
    {
        if( TERMINAL == mTermParam.Mode )
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

    if( TERMINAL == mTermParam.Mode )
    {
        Serial_Print( mAppSer, " Done\r\n\r\n", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
    }
}

/***********************************************************************************
* CommExecLoadParameter
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecLoadParameter( int index, int nameLen )
{
    SettingDefaultValue();

    if( PROCESSOR == mTermParam.Mode )
    {
        Serial_Print( mAppSer, "OK\r\n", gAllowToBlock_d );
    }

    Serial_SetBaudRate( mAppSer, mTermParam.Baudrate );
}

/***********************************************************************************
* CommExecShow
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecShow( int index, int nameLen )
{
    Serial_Print( mAppSer, "\r\n  configuration setting is below.", gAllowToBlock_d );
    Serial_Print( mAppSer, "\r\n  -------------------------------------", gAllowToBlock_d );

    Serial_Print( mAppSer, "\r\n  Node                        : ", gAllowToBlock_d );
    if( COORDINATOR == mTermParam.Node )
    {
        Serial_Print( mAppSer, "Coordinator", gAllowToBlock_d );
    }
    else if( END_DEVICE == mTermParam.Node )
    {
        Serial_Print( mAppSer, "EndDevice", gAllowToBlock_d );
    }
#ifdef _STATIC_ROUTING_
    else
    {
        Serial_Print( mAppSer, "Router", gAllowToBlock_d );
    }
#endif

    WDG_Refresh();

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

#ifdef _STATIC_ROUTING_
    WDG_Refresh();

    Serial_Print( mAppSer, "\r\n  Hop Count                   : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.HopCnt );

    Serial_Print( mAppSer, "\r\n  End ID                      : ", gAllowToBlock_d );
    Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.EndId, 2, 0 );

    Serial_Print( mAppSer, "\r\n  1st Route ID                : ", gAllowToBlock_d );
    Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.Route[0], 2, 0 );

    Serial_Print( mAppSer, "\r\n  2nd Route ID                : ", gAllowToBlock_d );
    Serial_PrintHex( mAppSer, (uint8_t*)&mTermParam.Route[1], 2, 0 );
#endif

    WDG_Refresh();

    Serial_Print( mAppSer, "\r\n  Acknowledge                 : ", gAllowToBlock_d );
    if( MODE_ON == mTermParam.Ack )
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
    if( TRANS_PAYLOAD == mTermParam.TransMode )
    {
        Serial_Print( mAppSer, "Payload", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "Frame", gAllowToBlock_d );
    }

    WDG_Refresh();

    Serial_Print( mAppSer, "\r\n  Receive Node ID information : ", gAllowToBlock_d );
    if( MODE_ON == mTermParam.RcvId )
    {
        Serial_Print( mAppSer, "ON", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "OFF", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  RSSI information            : ", gAllowToBlock_d );
    if( MODE_ON == mTermParam.Rssi )
    {
        Serial_Print( mAppSer, "ON", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "OFF", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  Config/Operation            : ", gAllowToBlock_d );
    if( CONFIG == mTermParam.Operation )
    {
        Serial_Print( mAppSer, "Configuration", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "Operation", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  UART baudrate               : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.Baudrate );

    WDG_Refresh();

    Serial_Print( mAppSer, "\r\n  Sleep Mode                  : ", gAllowToBlock_d );
    if( NO_SLEEP == mTermParam.Sleep )
    {
        Serial_Print( mAppSer, "No Sleep", gAllowToBlock_d );
    }
    else if( TIMER_WAKEUP == mTermParam.Sleep )
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

    WDG_Refresh();

    Serial_Print( mAppSer, "\r\n  Format                      : ", gAllowToBlock_d );
    if( FMT_ASCII == mTermParam.Format )
    {
        Serial_Print( mAppSer, "ASCII", gAllowToBlock_d );
    }
    else
    {
        Serial_Print( mAppSer, "BINARY", gAllowToBlock_d );
    }

    Serial_Print( mAppSer, "\r\n  Send Time                   : ", gAllowToBlock_d );
    Serial_PrintDec( mAppSer, mTermParam.SendTime );

    WDG_Refresh();

    Serial_Print( mAppSer, "\r\n  Send Data                   : ", gAllowToBlock_d );
    Serial_Print( mAppSer, (char*)mTermParam.SendData, gAllowToBlock_d );

    Serial_Print( mAppSer, "\r\n\r\n", gAllowToBlock_d );
}

/***********************************************************************************
* CommExecHelp
*
* Interface assumptions:
*     index         command index
*     nameLen       command name length
*
* Return value:
*     None
*
************************************************************************************/
static void CommExecHelp( int index, int nameLen )
{
    PrintMessage( cu8MainMenu );
}
