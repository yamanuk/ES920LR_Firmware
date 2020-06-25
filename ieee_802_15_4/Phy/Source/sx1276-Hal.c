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
 * \file       sx1276-Hal.c
 * \brief      SX1276 Hardware Abstraction Layer
 *
 * \version    2.0.B2
 * \date       Nov 21 2012
 * \author     Miguel Luis
 *
 * Last modified by Miguel Luis on Jun 19 2013
 */
#include <stdint.h>
#include <stdbool.h>

#include "sx1276.h"
#include "sx1276-LoRa.h"
#include "sx1276-Hal.h"
#include "sx1276-Spi.h"


volatile uint32_t TickCounter;

void SX1276InitIo( void )
{
    uint8_t reg;


    // Configure radio DIO as inputs
    // Configure DIO0
    PORTC_PCR2 = PORT_PCR_MUX(1);
    GPIOC_PDDR &= (uint32_t)~(uint32_t)(1<<2);

    // Configure DIO1
    PORTC_PCR3 = PORT_PCR_MUX(1);
    GPIOC_PDDR &= (uint32_t)~(uint32_t)(1<<3);

    // Configure DIO2
    PORTC_PCR4 = PORT_PCR_MUX(1);
    GPIOC_PDDR &= (uint32_t)~(uint32_t)(1<<4);

    // Configure DIO3
    PORTC_PCR5 = PORT_PCR_MUX(1);
    GPIOC_PDDR &= (uint32_t)~(uint32_t)(1<<5);

    // Configure DIO4
    PORTC_PCR6 = PORT_PCR_MUX(1);
    GPIOC_PDDR &= (uint32_t)~(uint32_t)(1<<6);

    // Configure DIO5
    PORTC_PCR7 = PORT_PCR_MUX(1);
    GPIOC_PDDR &= (uint32_t)~(uint32_t)(1<<7);

    SpiInit();

    // Configure radio reset as outputs
    PORTA_PCR4 = PORT_PCR_MUX(1);
    GPIOA_PDDR |= (uint32_t)(1<<4);

    SX1276Reset( );

    SX1276Read( REG_LR_HOPPERIOD, &reg );           // read RegOsc reg
    SX1276Write( REG_LR_HOPPERIOD, (reg | 0x08) );  // start calibration

    do {
        SX1276Read( REG_LR_HOPPERIOD, &reg );
    } while( (reg & 0x08) == 0x08 );

    SX1276Write( REG_LR_HOPPERIOD, 0x00 );          // set ClkOut = FXOSC

    SX1276Read( REG_LR_OPMODE, &reg );
    SX1276Write( REG_LR_OPMODE, reg & 0xF8 );       // sleep mode
    SX1276Read( REG_LR_OPMODE, &reg );
    SX1276Write( REG_LR_OPMODE, reg | RFLR_OPMODE_LONGRANGEMODE_ON );
    SX1276Read( REG_LR_OPMODE, &reg );
    SX1276Write( REG_LR_OPMODE, reg | 0x01 );       // stdby mode
    SX1276Read( REG_LR_OPMODE, &reg );

    SX1276Write( REG_LR_DIOMAPPING2, 0x10 );        // DIO5 ClkOut
}

void SX1276SetReset( uint8_t state )
{
    if( state == RADIO_RESET_ON )
    {
        // Set RESET pin to 0
        GPIOA_PCOR |= (uint32_t)(1<<4);
    }
    else
    {
        // Set RESET pin to 1
        GPIOA_PSOR |= (uint32_t)(1<<4);
    }
}

void SX1276Write( uint8_t addr, uint8_t data )
{
    SX1276WriteBuffer( addr, &data, 1 );
}

void SX1276Read( uint8_t addr, uint8_t *data )
{
    SX1276ReadBuffer( addr, data, 1 );
}

void SX1276WriteBuffer( uint8_t addr, uint8_t *buffer, uint8_t size )
{
    SpiWriteBytes( addr, buffer, size );
}

void SX1276ReadBuffer( uint8_t addr, uint8_t *buffer, uint8_t size )
{
    SpiReadBytes( addr, buffer, size );
}

void SX1276WriteFifo( uint8_t *buffer, uint8_t size )
{
    SX1276WriteBuffer( 0, buffer, size );
}

void SX1276ReadFifo( uint8_t *buffer, uint8_t size )
{
    SX1276ReadBuffer( 0, buffer, size );
}

uint8_t SX1276ReadDio0( void )
{
    return (GPIOC_PDIR >> 2) & 0x01;
}

uint8_t SX1276ReadDio1( void )
{
    return (GPIOC_PDIR >> 3) & 0x01;
}

uint8_t SX1276ReadDio2( void )
{
    return (GPIOC_PDIR >> 4) & 0x01;
}

uint8_t SX1276ReadDio3( void )
{
    return (GPIOC_PDIR >> 5) & 0x01;
}

uint8_t SX1276ReadDio4( void )
{
    return (GPIOC_PDIR >> 6) & 0x01;
}

uint8_t SX1276ReadDio5( void )
{
    return (GPIOC_PDIR >> 7) & 0x01;
}
