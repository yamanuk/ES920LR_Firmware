/************************************************************************************
* i2c header file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
************************************************************************************/

#include "MKL26Z4.h"
#include "EmbeddedTypes.h"

#define ACCEL_I2C_ADDRESS       0x1C


///////////////////////////////////////////////////////////////////////////////////
// I2C0 functions
///////////////////////////////////////////////////////////////////////////////////

#define i2c0_DisableAck()       I2C0_C1 |= I2C_C1_TXAK_MASK

#define i2c0_RepeatedStart()    I2C0_C1 |= I2C_C1_RSTA_MASK;

#define i2c0_Start()            I2C0_C1 |= I2C_C1_TX_MASK;\
                                I2C0_C1 |= I2C_C1_MST_MASK

#define i2c0_Stop()             I2C0_C1 &= ~I2C_C1_MST_MASK;\
                                I2C0_C1 &= ~I2C_C1_TX_MASK

#define i2c0_EnterRxMode()      I2C0_C1 &= ~I2C_C1_TX_MASK;\
                                I2C0_C1 &= ~I2C_C1_TXAK_MASK

#define i2c0_Wait()             while((I2C0_S & I2C_S_IICIF_MASK)==0) {} \
                                    I2C0_S |= I2C_S_IICIF_MASK;

#define i2c0_WBusy()            while((I2C0_S & I2C_S_BUSY_MASK));

#define i2c0_write_byte(data)   I2C0_D = data

#define MWSR                    0x00  /* Master write  */
#define MRSW                    0x01  /* Master read */


////////////////////////////////////////////////////////////////////////////////////////////
// Declare I2C0 Functions
////////////////////////////////////////////////////////////////////////////////////////////
void I2C0_Init( void );
void IIC0_StartTransmission( unsigned char SlaveID, unsigned char Mode );
unsigned char I2C0ReadTransaction( unsigned char SlaveAddr, unsigned char u8Command );
void I2C0WriteTransaction( unsigned char SlaveAddr, unsigned char u8Command, unsigned char u8Data );
void I2C0ReadMultiTransaction( unsigned char SlaveAddr, unsigned char u8Command, unsigned char bytes, unsigned char buf[] );
void I2C0WriteMultiTransaction( unsigned char SlaveAddr, unsigned char u8Command, unsigned char *u8Data, unsigned int length );

