/*****************************************************************************
* cca file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#include "radio.h"
#include "sx1276.h"
#include "sx1276-Hal.h"
#include "sx1276-LoRa.h"
#include "sx1276-LoRaMisc.h"

#include "smac.h"
#include "cca.h"
#include "IO_Map.h"


#define     CCA_RSSI   -90  // dB
#define     CCA_TIME   1500 // 1ms

static void Timer_Init( void );
static uint32_t Tick_Diff( uint32_t BeforeTick, uint32_t NowTick );
static void CcaFreqConfig(uint8_t Ch, uint8_t OrgBw, uint8_t CcaBw, int32_t PlusMinusFreq);


/*****************************************************************************
* Timer_Init
*
* Interface assumptions:
*     None
*
* Return value:
*     None
*
******************************************************************************/
static void Timer_Init( void )
{
	SIM_SCGC6   |= SIM_SCGC6_TPM0_MASK;

    TPM0_SC     = 0x00;
    TPM0_CNT    = 0x00;
    TPM0_MOD    = 0xFFFF;

    TPM0_SC     |= 0x0C;
}

/*****************************************************************************
* Tick_Diff
*
* Interface assumptions:
*     BeforeTick    before tick
*     NowTick       now tick
*
* Return value:
*     uint32_t      differ value
*
******************************************************************************/
static uint32_t Tick_Diff( uint32_t BeforeTick, uint32_t NowTick )
{
	uint32_t rtnTick = 0;

	if( BeforeTick <= NowTick )
	{
		rtnTick = (NowTick - BeforeTick) & 0xFFFFFFFF;
	}
	else if( BeforeTick > NowTick )
	{
		rtnTick = (NowTick + (0xFFFFFFFF - BeforeTick)) & 0xFFFFFFFF;
	}

	return rtnTick;
}

/*****************************************************************************
* CcaFreqConfig
*
* Interface assumptions:
*     Ch            channel
*     OrgBw         band width
*     CcaBw         band width
*     PlusMinusFreq shift frequency
*
* Return value:
*     void
*
******************************************************************************/
static void CcaFreqConfig( uint8_t Ch, uint8_t OrgBw, uint8_t CcaBw, int32_t PlusMinusFreq )
{
    uint32_t    RFFrequency;
    uint32_t    prvTick = 0;
	uint32_t    nowTick = 0;


    // 周波数は、元々設定されている周波帯の中心周波数から計算
    switch( OrgBw )
    {
        case 8:		// 250kHz幅
            RFFrequency = 920700000 + (400000 * Ch) + PlusMinusFreq;
            break;

        case 9:		// 500kHz幅
            RFFrequency = 920800000 + (600000 * Ch) + PlusMinusFreq;
            break;

        default:		// 125kHz幅以下
            RFFrequency = 920600000 + (200000 * Ch) + PlusMinusFreq;
            break;
    }

    SX1276LoRaSetRFFrequency( RFFrequency );
    SX1276LoRaSetSignalBandwidth( CcaBw ); // キャリアセンス向けに250kHzに変更
    prvTick = TPM0_CNT;
    do {
        nowTick = TPM0_CNT;
    } while( Tick_Diff(prvTick, nowTick) < CCA_TIME );
}

/*****************************************************************************
* IsCcaOk
*
* this function execute carrier sense
*
* Interface assumptions:
*     None
*
* Return value:
*     uint8_t       0 : OK    1 : NG
*
******************************************************************************/
uint8_t IsCcaOk( uint8_t setCh, uint8_t setBw, uint8_t retry )
{
	double      rssi[4]         = { 0, 0, 0, 0 };
	uint8_t     status          = 0;
	uint32_t    rssiTestTimer   = 0;
	uint8_t     ccaState        = 0;
	uint8_t     retry_counter   = 1;
	uint32_t    nowTick         = 0;


	/* TPM0 counter init */
	Timer_Init( );

    if( setBw <= 7 )
    {
        while( !status )
        {
            switch( ccaState )
            {
            // Init - First time the function is called or from successful previous transmission
            case 0:

                SX1276SetOpMode( RFLR_OPMODE_RECEIVER );

                // First RSSI reading
                CcaFreqConfig( setCh, setBw, 8, 50000 );
                rssi[0] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8, -50000 );
                rssi[1] = SX1276ReadRssi( );

                rssiTestTimer = TPM0_CNT;

                ccaState = 3;

                break;

            // First RSSI reading - Used only if channel is occupied
            case 1:

                nowTick = TPM0_CNT;

                // Total 5ms 24MHz
                if( Tick_Diff(rssiTestTimer, nowTick) > CCA_TIME )
                {
                    CcaFreqConfig( setCh, setBw, 8, 50000 );
                    rssi[0] = SX1276ReadRssi( );
                    CcaFreqConfig( setCh, setBw, 8, -50000 );
                    rssi[1] = SX1276ReadRssi( );

                    rssiTestTimer = TPM0_CNT;

                    ccaState = 3;
                }
                break;

            // Second RSSI reading
            case 2:

                nowTick = TPM0_CNT;

                // Total 5ms 24MHz
                if( Tick_Diff(rssiTestTimer, nowTick) > CCA_TIME )
                {
                    CcaFreqConfig( setCh, setBw, 8, 50000 );
                    rssi[0] = SX1276ReadRssi( );
                    CcaFreqConfig( setCh, setBw, 8, -50000 );
                    rssi[1] = SX1276ReadRssi( );

                    rssiTestTimer = TPM0_CNT;

                    ccaState = 4;
                }
                break;

            // Checks previous RSSI readings and if they are below -80 dBm indicates that
            // the channel is free and sets sate to 0.
            // if channel isn't free set ccaState to 1 in order to make again 2 measurements.
            case 3:

                if( (rssi[0] < CCA_RSSI) && (rssi[1] < CCA_RSSI) )
                {
                    ccaState = 2;
                }
                else
                {
                    rssiTestTimer = TPM0_CNT;
                    retry_counter++;
                    ccaState = 1;
                    if( retry_counter > retry )
                    {
                        status = 2;		// Error
                    }
                }
                break;

            case 4:

                if( (rssi[0] < CCA_RSSI) && (rssi[1] < CCA_RSSI) )
                {
                    status = 1;		    // OK
                }
                else
                {
                    rssiTestTimer = TPM0_CNT;
                    retry_counter++;
                    ccaState = 1;
                    if( retry_counter > retry )
                    {
                        status = 2;		// Error
                    }
                }
                break;

            default:
                break;
            }
        }
    }
    else if( 8 == setBw )
    {
        while( !status )
        {
            switch( ccaState )
            {
            // Init - First time the function is called or from successful previous transmission
            case 0:

                SX1276SetOpMode( RFLR_OPMODE_RECEIVER );

                // First RSSI reading
                CcaFreqConfig( setCh, setBw, 8,       0 );
                rssi[0] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  150000 );
                rssi[1] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8, -150000 );
                rssi[2] = SX1276ReadRssi( );

                rssiTestTimer = TPM0_CNT;

                ccaState = 3;

                break;

            // First RSSI reading - Used only if channel is occupied
            case 1:

                nowTick = TPM0_CNT;

                CcaFreqConfig( setCh, setBw, 8,       0 );
                rssi[0] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  150000 );
                rssi[1] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8, -150000 );
                rssi[2] = SX1276ReadRssi( );

                rssiTestTimer = TPM0_CNT;

                ccaState = 3;

                break;

            // Second RSSI reading
            case 2:

                nowTick = TPM0_CNT;

                CcaFreqConfig( setCh, setBw, 8,       0 );
                rssi[0] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  150000 );
                rssi[1] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8, -150000 );
                rssi[2] = SX1276ReadRssi( );

                rssiTestTimer = TPM0_CNT;

                ccaState = 4;

                break;

            // Checks previous RSSI readings and if they are below -80 dBm indicates that
            // the channel is free and sets sate to 0.
            // if channel isn't free set ccaState to 1 in order to make again 2 measurements.
            case 3:

                if( (rssi[0] < CCA_RSSI) && (rssi[1] < CCA_RSSI) && (rssi[2] < CCA_RSSI) )
                {
                    ccaState = 2;
                }
                else
                {
                    rssiTestTimer = TPM0_CNT;
                    retry_counter++;
                    ccaState = 1;
                    if( retry_counter > retry )
                    {
                        status = 2;		// Error
                    }
                }
                break;

            case 4:

                if( (rssi[0] < CCA_RSSI) && (rssi[1] < CCA_RSSI) && (rssi[2] < CCA_RSSI) )
                {
                    status = 1;		    // OK
                }
                else
                {
                    rssiTestTimer = TPM0_CNT;
                    retry_counter++;
                    ccaState = 1;
                    if( retry_counter > retry )
                    {
                        status = 2;		// Error
                    }
                }
                break;

            default:
                break;
            }
        }
    }
    else if( 9 == setBw )
    {
        while( !status )
        {
            switch( ccaState )
            {
            // Init - First time the function is called or from successful previous transmission
            case 0:

                SX1276SetOpMode( RFLR_OPMODE_RECEIVER );

                // First RSSI reading
                CcaFreqConfig( setCh, setBw, 8,   75000 );
                rssi[0] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  -75000 );
                rssi[1] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  225000 );
                rssi[2] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8, -225000 );
                rssi[3] = SX1276ReadRssi( );

                rssiTestTimer = TPM0_CNT;

                ccaState = 3;

                break;

            // First RSSI reading - Used only if channel is occupied
            case 1:

                nowTick = TPM0_CNT;

                CcaFreqConfig( setCh, setBw, 8,   75000 );
                rssi[0] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  -75000 );
                rssi[1] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  225000 );
                rssi[2] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8, -225000 );
                rssi[3] = SX1276ReadRssi( );

                rssiTestTimer = TPM0_CNT;

                ccaState = 3;

                break;

            // Second RSSI reading
            case 2:

                nowTick = TPM0_CNT;

                CcaFreqConfig( setCh, setBw, 8,   75000 );
                rssi[0] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  -75000 );
                rssi[1] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8,  225000 );
                rssi[2] = SX1276ReadRssi( );
                CcaFreqConfig( setCh, setBw, 8, -225000 );
                rssi[3] = SX1276ReadRssi( );

                rssiTestTimer = TPM0_CNT;

                ccaState = 4;

                break;

            // Checks previous RSSI readings and if they are below -80 dBm indicates that
            // the channel is free and sets sate to 0.
            // if channel isn't free set ccaState to 1 in order to make again 2 measurements.
            case 3:

                if( (rssi[0] < CCA_RSSI) && (rssi[1] < CCA_RSSI) && (rssi[2] < CCA_RSSI) && (rssi[3] < CCA_RSSI) )
                {
                    ccaState = 2;
                }
                else
                {
                    rssiTestTimer = TPM0_CNT;
                    retry_counter++;
                    ccaState = 1;
                    if( retry_counter > retry )
                    {
                        status = 2;		// Error
                    }
                }
                break;

            case 4:

                if( (rssi[0] < CCA_RSSI) && (rssi[1] < CCA_RSSI) && (rssi[2] < CCA_RSSI) && (rssi[3] < CCA_RSSI) )
                {
                    status = 1;		    // OK
                }
                else
                {
                    rssiTestTimer = TPM0_CNT;
                    retry_counter++;
                    ccaState = 1;
                    if( retry_counter > retry )
                    {
                        status = 2;		// Error
                    }
                }
                break;

            default:
                break;
            }
        }
    }

	SMAC_SetChannel( setCh, setBw );

	return ( status - 1 );
}
