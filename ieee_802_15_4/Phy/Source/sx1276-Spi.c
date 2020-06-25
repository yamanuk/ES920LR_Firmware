/*!
* Copyright (c) 2014, Freescale Semiconductor, Inc.
* All rights reserved.
*
* \file sx1276-Spi.c
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* o Redistributions of source code must retain the above copyright notice, this list
*   of conditions and the following disclaimer.
*
* o Redistributions in binary form must reproduce the above copyright notice, this
*   list of conditions and the following disclaimer in the documentation and/or
*   other materials provided with the distribution.
*
* o Neither the name of Freescale Semiconductor, Inc. nor the names of its
*   contributors may be used to endorse or promote products derived from this
*   software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
* ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
* ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*****************************************************************************
 *                               INCLUDED HEADERS                            *
 *---------------------------------------------------------------------------*
 * Add to this section all the headers that this module needs to include.    *
 *---------------------------------------------------------------------------*
 *****************************************************************************/
#include "EmbeddedTypes.h"
#include "sx1276-Spi.h"

SPI_MemMapPtr  SpiRegs;

/*****************************************************************************
 *                             PUBLIC FUNCTIONS                              *
 *---------------------------------------------------------------------------*
 * Add to this section all the functions that have global (project) scope.   *
 * These functions can be accessed outside this module.                      *
 * These functions shall have their declarations (prototypes) within the     *
 * interface header file and shall be preceded by the 'extern' keyword.      *
 *---------------------------------------------------------------------------*
 *****************************************************************************/

/*---------------------------------------------------------------------------
 * Name         : SpiInit
 * Description  : SPI initialization for Radio driver interface
 * Parameters   : -
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiInit(void)
{
    /* Enable SPI PORT clock */
    XCVRx_SPI_PORT_SIM_SCG |= cSPI_PORT_SIM_SCG_Config_c;

    /* Enable SPI clock */
    XCVRx_SPI_SIM_SCG |= cSPI_SIM_SCG_Config_c;

    /* Initialize SPI Pin Control registers */
    SPI_PCS_PCR  &= ~PORT_PCR_MUX_MASK;
    SPI_PCS_PCR  |= PORT_PCR_MUX(1);
    gSPI_DataAvailablePortDDirReg_c |= gSPI_DataAvailablePinMask_c;
    SPI_SCK_PCR  &= ~PORT_PCR_MUX_MASK;
    SPI_SCK_PCR  |= PORT_PCR_MUX(SPI_SCK_ALT_FUNC);
    SPI_MOSI_PCR &= ~PORT_PCR_MUX_MASK;
    SPI_MOSI_PCR |= PORT_PCR_MUX(SPI_MOSI_ALT_FUNC);
    SPI_MISO_PCR &= ~PORT_PCR_MUX_MASK;
    SPI_MISO_PCR |= PORT_PCR_MUX(SPI_MOSI_ALT_FUNC);

    /* Initialize the SPI peripheral base address */
    SpiRegs     = SPI1_BASE_PTR;
    SpiRegs->C1 = cSPIC1_Init;
    SpiRegs->C2 = cSPIC2_Init;
    SPI1_BR     = cSPIBR_Init;
    SpiRegs->C1 |= (uint8_t)(SPI_C1_SPE_MASK);
    SPIS_DummyRead;
    DeAssertSS;
}

/*****************************************************************************
 *                          SPI Read function                                *
 *****************************************************************************/

/*---------------------------------------------------------------------------
 * Name         : SpiReadByteFast
 * Description  : Read one 8bit data-location from Radio register "addr"
 *                Unprotected - only to be called with disabled interrupts
 * Parameters   : register address
 * Return       : register value
 *---------------------------------------------------------------------------*/
uint8_t SpiReadByteFast(uint8_t addr)
{
    uint8_t     val;
    uint32_t    irqMaskRegister;

    irqMaskRegister = IntDisableAll();
    SPIS_DummyRead;
    AssertSS;
    XCVRDrv_RegSPID = (unsigned char)(addr);  // Write Addr byte
    WaitSPITxBufferEmpty;
    WaitSPIRxBufferFull;
    SPID_DummyRead;
    XCVRDrv_RegSPID = 0x00;                     // Write data byte
    WaitSPITxBufferEmpty;                       // Wait for room in holding register
    WaitSPIRxBufferFull;                        // Wait until the shift buffer has received the data from the Slave, this ensures that the Tx Data has been sent and the Slave has received it
    val = XCVRDrv_RegSPID;                      // Read data byte
    DeAssertSS;
    IntRestoreAll(irqMaskRegister);

    return val;
}

/*---------------------------------------------------------------------------
 * Name         : SpiReadByte
 * Description  : Read one 8bit data-location from Radio register "addr"
 *                May be called from any context.
 *                Protected from mcu/app irq. Includes irq status backup
 * Parameters   : register address
 * Return       : register value
 *---------------------------------------------------------------------------*/
uint8_t SpiReadByte(uint8_t addr)
{
    uint8_t     val;
    uint32_t    irqMaskRegister;

    irqMaskRegister = IntDisableAll();
    SPIS_DummyRead;
    AssertSS;
    XCVRDrv_RegSPID = (unsigned char)(addr);  // Write Addr byte
    WaitSPITxBufferEmpty;
    WaitSPIRxBufferFull;
    SPID_DummyRead;
    XCVRDrv_RegSPID = 0x00;                     // Write data byte
    WaitSPITxBufferEmpty;                       // Wait for room in holding register
    WaitSPIRxBufferFull;                        // Wait until the shift buffer has received the data from the Slave, this ensures that the Tx Data has been sent and the Slave has received it
    val = XCVRDrv_RegSPID;                      // Read data byte
    DeAssertSS;
    IntRestoreAll(irqMaskRegister);

    return val;
}

/*---------------------------------------------------------------------------
 * Name         : SpiReadBytes
 * Description  : Read any bytes data-location from Radio register "addr"
 *                May be called from any context.
 *                Protected from mcu/app irq. Includes irq status backup
 * Parameters   : register address, register value
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiReadBytes(uint8_t addr, uint8_t* buffer, uint8_t size)
{
    uint32_t irqMaskRegister;

    irqMaskRegister = IntDisableAll();
    SPIS_DummyRead;
    AssertSS;
    XCVRDrv_RegSPID = (unsigned char)(addr);
    WaitSPITxBufferEmpty;
    WaitSPIRxBufferFull;
    SPID_DummyRead;

    while(size--)
    {
        XCVRDrv_RegSPID = 0x00;
        WaitSPITxBufferEmpty;
        WaitSPIRxBufferFull;
        *buffer = XCVRDrv_RegSPID;
        buffer++;
    }

    DeAssertSS;
    IntRestoreAll(irqMaskRegister);
}


/*****************************************************************************
 *                         SPI Write functions                               *
 *****************************************************************************/

/*---------------------------------------------------------------------------
 * Name         : SpiWriteByteFast
 * Description  : Write one 8bit data into Radio at address "addr"
 *                Unprotected - only to be called with disabled interrupts
 * Parameters   : register address, register value
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiWriteByteFast(uint8_t addr, uint8_t val)
{
    uint32_t irqMaskRegister;

    irqMaskRegister = IntDisableAll();
    SPIS_DummyRead;
    AssertSS;
    XCVRDrv_RegSPID = (unsigned char)(addr | 0x80);   // Write Addr byte
    WaitSPITxBufferEmpty;                               // Wait for room in holding register
    WaitSPIRxBufferFull;
    SPID_DummyRead;
    XCVRDrv_RegSPID = (unsigned char)(val);           // Write data byte
    WaitSPITxBufferEmpty;
    WaitSPIRxBufferFull;                                // Wait for Reg buffer full, this ensures Tx was finished and the Slave received the package, before bringing up the Chip Select line
    SPID_DummyRead;
    DeAssertSS;
    IntRestoreAll(irqMaskRegister);
}

/*---------------------------------------------------------------------------
 * Name         : SpiWriteByte
 * Description  : Write one 8bit data into Radio at address "addr"
 *                May be called from any context.
 *                Protected from mcu/app irq. Includes irq status backup
 * Parameters   : register address, register value
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiWriteByte(uint8_t addr, uint8_t val)
{
    uint32_t irqMaskRegister;

    irqMaskRegister = IntDisableAll();
    SPIS_DummyRead;
    AssertSS;
    XCVRDrv_RegSPID = (unsigned char)(addr | 0x80);   // Write Addr byte
    WaitSPITxBufferEmpty;                               // Wait for room in holding register
    WaitSPIRxBufferFull;
    SPID_DummyRead;
    XCVRDrv_RegSPID = (unsigned char)(val);           // Write data byte
    WaitSPITxBufferEmpty;
    WaitSPIRxBufferFull;                                // Wait for Reg buffer full, this ensures Tx was finished and the Slave received the package, before bringing up the Chip Select line
    SPID_DummyRead;
    DeAssertSS;
    IntRestoreAll(irqMaskRegister);
}

/*---------------------------------------------------------------------------
 * Name         : SpiWriteBytes
 * Description  : Write any bytes data into Radio at address "addr"
 *                May be called from any context.
 *                Protected from mcu/app irq. Includes irq status backup
 * Parameters   : register address, register value
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiWriteBytes(uint8_t addr, const uint8_t* buffer, uint8_t size)
{
    uint32_t irqMaskRegister;

    irqMaskRegister = IntDisableAll();
    SPIS_DummyRead;
    AssertSS;
    XCVRDrv_RegSPID = (unsigned char)(addr | 0x80);
    WaitSPITxBufferEmpty;
    WaitSPIRxBufferFull;
    SPID_DummyRead;

    while(size--)
    {
        XCVRDrv_RegSPID = *buffer;
        WaitSPITxBufferEmpty;
        WaitSPIRxBufferFull;
        SPID_DummyRead;
        buffer++;
    }

    DeAssertSS;
    IntRestoreAll(irqMaskRegister);
}
