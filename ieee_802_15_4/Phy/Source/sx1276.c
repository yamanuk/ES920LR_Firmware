/*
 * THE FOLLOWING FIRMWARE IS PROVIDED: (1) "AS IS" WITH NO WARRANTY; AND
 * (2)TO ENABLE ACCESS TO CODING INFORMATION TO GUIDE AND FACILITATE CUSTOMER.
 * CONSEQUENTLY, SEMTECH SHALL NOT BE HELD LIABLE FOR ANY DIRECT, INDIRECT OR
 * CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT
 * OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION
 * CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
 *
 * Copyright (C) SEMTECH S.A.
 */
/*!
 * \file       sx1276.c
 * \brief      SX1276 RF chip driver
 *
 * \version    2.0.0
 * \date       May 6 2013
 * \author     Gregory Cristian
 *
 * Last modified by Miguel Luis on Jun 19 2013
 */
#include "radio.h"

#include "sx1276.h"
#include "sx1276-Hal.h"
//#include "sx1276-Fsk.h"
#include "sx1276-LoRa.h"

#include "TimersManager.h"

/*!
 * SX1276 registers variable
 */
uint8_t SX1276Regs[0x70];

static bool LoRaOn      = false;
static bool LoRaOnState = false;
static tmrTimerID_t PhyTmr;
static void PhyTimerCallBack( void* );

void SX1276Init( void )
{
    // start timer
    PhyTmr = TMR_AllocateTimer();
    TMR_StartIntervalTimer( PhyTmr, 1, PhyTimerCallBack, NULL );

    // Initialize FSK and LoRa registers structure
#if ( LORA == 0 )
    SX1276   = ( tSX1276* )SX1276Regs;
#endif
    SX1276LR = ( tSX1276LR* )SX1276Regs;

#if ( LORA == 0 )

    LoRaOn = false;
    SX1276SetLoRaOn( LoRaOn );
    // Initialize FSK modem
    SX1276FskInit( );

#else

    LoRaOn = true;
    SX1276SetLoRaOn( LoRaOn );
    // Initialize LoRa modem
    SX1276LoRaInit( );

#endif
}

void SX1276Reset( void )
{
    uint32_t wait = 0;

    SX1276SetReset( RADIO_RESET_ON );

    // Wait 1ms
    wait = 4500;
    while( wait-- );

    SX1276SetReset( RADIO_RESET_OFF );

    // Wait 6ms
    wait = 27000;
    while( wait-- );
}

void SX1276SetLoRaOn( bool enable )
{
    if( LoRaOnState == enable )
    {
        return;
    }

    LoRaOnState = enable;
    LoRaOn      = enable;

    if( LoRaOn == true )
    {
//        SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );
//        SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_LONGRANGEMODE_MASK ) | RFLR_OPMODE_LONGRANGEMODE_ON;
//        SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode );

        SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );
                                        // RxDone               RxTimeout                   FhssChangeChannel           CadDone
        SX1276LR->RegDioMapping1 = RFLR_DIOMAPPING1_DIO0_00 | RFLR_DIOMAPPING1_DIO1_00 | RFLR_DIOMAPPING1_DIO2_00 | RFLR_DIOMAPPING1_DIO3_00;
                                        // CadDetected          ClkOut
        SX1276LR->RegDioMapping2 = RFLR_DIOMAPPING2_DIO4_00 | RFLR_DIOMAPPING2_DIO5_01;
        SX1276WriteBuffer( REG_LR_DIOMAPPING1, &SX1276LR->RegDioMapping1, 2 );
    }
    else
    {
//        SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );
//        SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_LONGRANGEMODE_MASK ) | RFLR_OPMODE_LONGRANGEMODE_OFF;
//        SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode );

        SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );
    }
}

bool SX1276GetLoRaOn( void )
{
    return LoRaOn;
}

void SX1276SetOpMode( uint8_t opMode )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        SX1276FskSetOpMode( opMode );
#endif
    }
    else
    {
        SX1276LoRaSetOpMode( opMode );
    }
}

uint8_t SX1276GetOpMode( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        return SX1276FskGetOpMode( );
#endif
        return 0;
    }
    else
    {
        return SX1276LoRaGetOpMode( );
    }
}

double SX1276ReadRssi( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        return SX1276FskReadRssi( );
#endif
        return 0;
    }
    else
    {
        return SX1276LoRaReadRssi( );
    }
}

uint8_t SX1276ReadRxGain( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        return SX1276FskReadRxGain( );
#endif
        return 0;
    }
    else
    {
        return SX1276LoRaReadRxGain( );
    }
}

uint8_t SX1276GetPacketRxGain( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        return SX1276FskGetPacketRxGain(  );
#endif
        return 0;
    }
    else
    {
        return SX1276LoRaGetPacketRxGain(  );
    }
}

int8_t SX1276GetPacketSnr( void )
{
    if( LoRaOn == false )
    {
         while( 1 )
         {
             // Useless in FSK mode
             // Block program here
         }
    }
    else
    {
        return SX1276LoRaGetPacketSnr(  );
    }
}

double SX1276GetPacketRssi( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        return SX1276FskGetPacketRssi(  );
#endif
        return 0;
    }
    else
    {
        return SX1276LoRaGetPacketRssi( );
    }
}

uint32_t SX1276GetPacketAfc( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        return SX1276FskGetPacketAfc(  );
#endif
        return 0;
    }
    else
    {
         while( 1 )
         {
             // Useless in LoRa mode
             // Block program here
         }
    }
}

void SX1276StartRx( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        SX1276FskSetRFState( RF_STATE_RX_INIT );
#endif
    }
    else
    {
        SX1276LoRaSetRFState( RFLR_STATE_RX_INIT );
    }
}

void SX1276GetRxPacket( void *buffer, uint16_t *size )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        SX1276FskGetRxPacket( buffer, size );
#endif
    }
    else
    {
        SX1276LoRaGetRxPacket( buffer, size );
    }
}

void SX1276SetTxPacket( const void *buffer, uint16_t size )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        SX1276FskSetTxPacket( buffer, size );
#endif
    }
    else
    {
        SX1276LoRaSetTxPacket( buffer, size );
    }
}

uint8_t SX1276GetRFState( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        return SX1276FskGetRFState( );
#endif
        return 0;
    }
    else
    {
        return SX1276LoRaGetRFState( );
    }
}

void SX1276SetRFState( uint8_t state )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        SX1276FskSetRFState( state );
#endif
    }
    else
    {
        SX1276LoRaSetRFState( state );
    }
}

uint32_t SX1276Process( void )
{
    if( LoRaOn == false )
    {
#if ( LORA == 0 )
        return SX1276FskProcess( );
#endif
        return 0;
    }
    else
    {
        return SX1276LoRaProcess( );
    }
}

static void PhyTimerCallBack( void* param )
{
    COUNTUP_TICKCOUNT( );
}
