/*****************************************************************************
* i2c file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/

#include "i2c.h"


#if 0
/************************************************************************************
*
* I2C Initialization
*
* Set Baud Rate and turn on I2C0
*
************************************************************************************/
void I2C0_Init( void )
{
    SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;

    /* Turn on clock to I2C module */
    SIM_SCGC4 |= SIM_SCGC4_I2C0_MASK;

    /* configure GPIO for I2C0 function */
    PORTB_PCR0 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;
    PORTB_PCR1 = PORT_PCR_MUX(2) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;

    /* set MULT and ICR:  For bus speed of 24MHz, 0x12 should give 400 kHz */
    I2C0_F  = 0x17;

    /* enable IIC */
    I2C0_C1 = I2C_C1_IICEN_MASK;
}

/************************************************************************************
*
* Pause Routine
*
************************************************************************************/
void Pause( uint32_t time )
{
    uint32_t n;
    for( n = 1; n < time; n++ )
    {
        asm("nop");
    }
}

///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
//
//  Begin I2C0 functions
//
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

/************************************************************************************
*
* Start I2C Transmision
*
* Interface assumptions:
*     SlaveID is the 7 bit Slave Address
*     unsigned char Mode
*
* Return value:
*     None
*
************************************************************************************/
void IIC0_StartTransmission( unsigned char SlaveID, unsigned char Mode )
{
    unsigned char MasterTransmission = 0;


    /* set transmission mode */
    if( Mode == MWSR )
    {
        MasterTransmission = MWSR;
    }
    else
    {
        MasterTransmission = MRSW;
    }

    /* shift ID in right possition */
    SlaveID = SlaveID << 1;

    /* Set R/W bit at end of Slave Address */
    SlaveID |= (unsigned char)MasterTransmission;

    /* send start signal */
    i2c0_Start();

    /* send ID with W/R bit */
    i2c0_write_byte( SlaveID );
}

/************************************************************************************
*
* Read transaction
*
* Interface assumptions:
*     u8Command is Command Code
*
* Return value:
*     Data stored in Register
*
************************************************************************************/
unsigned char I2C0ReadTransaction( unsigned char SlaveAddr, unsigned char u8Command )
{
    unsigned char result;


    /* Send Slave Address */
    IIC0_StartTransmission( SlaveAddr, MWSR );
    i2c0_Wait();

    /* Write Commnad */
    I2C0_D = u8Command;
    i2c0_Wait();

    /* Do a repeated start */
    I2C0_C1 |= I2C_C1_RSTA_MASK;

    /* Send Slave Address */
    I2C0_D = (SlaveAddr << 1) | MRSW; //read address
    i2c0_Wait();

    /* Put in Rx Mode */
    I2C0_C1 &= (~I2C_C1_TX_MASK);

    /* Ensure TXAK bit is 0 */
    I2C0_C1 &= ~I2C_C1_TXAK_MASK;

    /* Turn off ACK since this is second to last byte being read*/
    I2C0_C1 |= I2C_C1_TXAK_MASK;

    /* Dummy read */
    result = I2C0_D;
    i2c0_Wait();

    /* Send stop since about to read last byte */
    i2c0_Stop();

    /* Read byte */
    result = I2C0_D;

    Pause(50);

    return( result );
}

/************************************************************************************
*
* Write transaction
*
* Interface assumptions:
*     u8Command is Command Code
*     u8Data is Data to write
*
* Return value:
*     None
*
************************************************************************************/
void I2C0WriteTransaction( unsigned char SlaveAddr, unsigned char u8Command, unsigned char u8Data )
{
    /* send data to slave */
    IIC0_StartTransmission( SlaveAddr, MWSR );
    i2c0_Wait();

    /* Write Command */
    I2C0_D = u8Command;
    i2c0_Wait();

    /* Write byte */
    I2C0_D = u8Data;
    i2c0_Wait();

    i2c0_Stop();

    Pause(50);
}

/************************************************************************************
*
* Read multi byte transaction
*
* Interface assumptions:
*     u8Command is Command Code
*
* Return value:
*     Data stored in Register
*
************************************************************************************/
void I2C0ReadMultiTransaction( unsigned char SlaveAddr, unsigned char u8Command, unsigned char bytes, unsigned char buf[] )
{
    unsigned char result;
    int i;


    /* Send Slave Address */
    IIC0_StartTransmission( SlaveAddr, MWSR );
    i2c0_Wait();

    /* Write Command */
    I2C0_D = u8Command;
    i2c0_Wait();

    /* Do a repeated start */
    I2C0_C1 |= I2C_C1_RSTA_MASK;

    /* Send Slave Address */
    I2C0_D = (SlaveAddr << 1) | MRSW; //read address
    i2c0_Wait();

    /* Put in Rx Mode */
    I2C0_C1 &= (~I2C_C1_TX_MASK);

    /* Ensure TXAK bit is 0 */
    I2C0_C1 &= ~I2C_C1_TXAK_MASK;

    /* Dummy read */
    result = I2C0_D;
    i2c0_Wait();

    for( i = 0; i < bytes - 2; i++ )
    {
        /* Read first byte */
        buf[i] = I2C0_D;
        i2c0_Wait();
    }

    /* Turn off ACK since this is second to last read*/
    I2C0_C1 |= I2C_C1_TXAK_MASK;

    /* Read second byte */
    buf[i++] = I2C0_D;
    i2c0_Wait();

    /* Send stop */
    i2c0_Stop();

    /* Read third byte */
    buf[i++] = I2C0_D;

    Pause(50);
}

/************************************************************************************
*
* Write multi byte transaction
*
* Interface assumptions:
*     u8Command is Command Code
*     u8Data is Data to write
*
* Return value:
*     None
*
************************************************************************************/
void I2C0WriteMultiTransaction( unsigned char SlaveAddr, unsigned char u8Command, unsigned char *u8Data, unsigned int length )
{
    unsigned int i;

    /* send data to slave */
    IIC0_StartTransmission( SlaveAddr, MWSR );
    i2c0_Wait();

    /* Write Register Address */
    I2C0_D = u8Command;
    i2c0_Wait();

    /* Write byte */
    for( i = 0; i < length; i++ )
    {
        I2C0_D = u8Data[i];
        i2c0_Wait();
    }

    i2c0_Stop();

    Pause(50);
}
#endif
