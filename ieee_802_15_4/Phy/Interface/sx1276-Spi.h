/*!
* Copyright (c) 2014, Freescale Semiconductor, Inc.
* All rights reserved.
*
* \file sx1276-Spi.h
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

#ifndef _SX1276SPI_H_
#define _SX1276SPI_H_

/*****************************************************************************
 *                               INCLUDED HEADERS                            *
 *---------------------------------------------------------------------------*
 * Add to this section all the headers that this module needs to include.    *
 * Note that it is not a good practice to include header files into header   *
 * files, so use this section only if there is no other better solution.     *
 *---------------------------------------------------------------------------*
 *****************************************************************************/
#if defined(__IAR_SYSTEMS_ICC__)
  #include "intrinsics.h"
#endif
#include "EmbeddedTypes.h"
#include "IO_Map.h"


/*****************************************************************************
 *                             PRIVATE MACROS                                *
 *---------------------------------------------------------------------------*
 * Add to this section all the access macros, registers mappings, bit access *
 * macros, masks, flags etc ...                                              *
 *---------------------------------------------------------------------------*
 *****************************************************************************/

#define gXCVRSpiSsMask_c                    (1<<4)
#define gXCVRSpiSpsckMask_c                 (1<<5)
#define gXCVRSpiMosiMask_c                  (1<<6)
#define gXCVRSpiMisoMask_c                  (1<<7)

/* SPI PCS Pin Control Register mapping */
#define SPI_PCS_PCR                         PORTD_PCR4
#define SPI_PCS_ALT_FUNC                    2
/* SPI SCK Pin Control Register mapping */
#define SPI_SCK_PCR                         PORTD_PCR5
#define SPI_SCK_ALT_FUNC                    2
/* SPI SOUT (MOSI) Pin Control Register mapping */
#define SPI_MOSI_PCR                        PORTD_PCR6
#define SPI_MOSI_ALT_FUNC                   2
/* SPI SIN (MISO) Pin Control Register mapping */
#define SPI_MISO_PCR                        PORTD_PCR7
#define SPI_MISO_ALT_FUNC                   2

/* Port Data Input register mapping */
#ifndef gSPI_DataAvailablePortDataINReg_c
#define gSPI_DataAvailablePortDataINReg_c   GPIOD_PDIR
#endif

/* Port Clear Output register mapping */
#ifndef gSPI_ClearPortOutReg_c
#define gSPI_ClearPortOutReg_c              GPIOD_PCOR
#endif

/* Description: Port Clear Output register mapping */
#ifndef gSPI_SetPortOutReg_c
#define gSPI_SetPortOutReg_c                GPIOD_PSOR
#endif

/* Port Data Output register mapping */
#ifndef gSPI_DataAvailablePortDataOUTReg_c
#define gSPI_DataAvailablePortDataOUTReg_c  GPIOD_PDOR
#endif

/* Description: Port Data Direction register mapping */
#ifndef gSPI_DataAvailablePortDDirReg_c
#define gSPI_DataAvailablePortDDirReg_c     GPIOD_PDDR
#endif

/* Description: Port Data register pin mask */
#ifndef gSPI_DataAvailablePinMask_c
#define gSPI_DataAvailablePinMask_c         (1<<4)
#endif

/* Transceiver HW port/pin mapping */
#define cSPI_SSEL_PCR_Config_c              (0x00000240UL)
#define cSPI_SCLK_PCR_Config_c              (0x00000240UL)
#define cSPI_MOSI_PCR_Config_c              (0x00000240UL)
#define cSPI_MISO_PCR_Config_c              (0x00000240UL)

/* SPI PORT  Clock Gating Control Register */
#define XCVRx_SPI_PORT_SIM_SCG              SIM_SCGC5
#define cSPI_PORT_SIM_SCG_Config_c          (1<<12)     /* SPI Port Clock Gate Control enable */

#define XCVRx_SPI_SIM_SCG                   SIM_SCGC4
#define cSPI_SIM_SCG_Config_c               (1<<23)     /* SPI Clock Gate Control enable */

/* SPI Registers */
extern SPI_MemMapPtr  SpiRegs;

#define XCVRDrv_RegSPID                     SpiRegs->DL

#define SPID_DummyRead                      { char dummy = SpiRegs->DL; }
#define SPIS_DummyRead                      { char dummy = SpiRegs->S;  }

#define AssertSS                            { gSPI_ClearPortOutReg_c = (uint8_t)(gXCVRSpiSsMask_c); }
#define DeAssertSS                          { gSPI_DataAvailablePortDataOUTReg_c |= (uint8_t)(gXCVRSpiSsMask_c); }

#define WaitSPITxBufferEmpty                { while(!(SpiRegs->S & SPI_S_SPTEF_MASK)); }
#define WaitSPIRxBufferFull                 { while(!(SpiRegs->S & SPI_S_SPRF_MASK)); }

/* MCU SPI module configuration constants */
#define cSPIC1_Init  0x10     // Master Mode Selected.
#define cSPIC2_Init  0x00
#define cSPIBR_Init  0x00
//#define cSPIBR_Init   0x01        // SPICLK=BUSCLK/4 (4: baud rate divisor)
//#define cSPIBR_Init   0x02        // SPICLK=BUSCLK/8 (8: baud rate divisor)
//#define cSPIBR_Init   0x04        // SPICLK=BUSCLK/32 (32: baud rate divisor)
//#define cSPIBR_Init   0x08        // SPICLK=BUSCLK/512 (512: baud rate divisor)


/************************************************************************************
*************************************************************************************
* Public prototypes
*************************************************************************************
************************************************************************************/

/*---------------------------------------------------------------------------
 * Name         : IntRestoreAll
 * Description  : restores the interrupt state and enables interrupts
 * Parameters   : [IN] if_bits - interrupt state bit mask
 * Return       : -
 *---------------------------------------------------------------------------*/
static inline void IntRestoreAll(uint32_t var)
{
    asm(" MSR PRIMASK, %0" : : "r" (var));
    asm(" CPSIE i");
}

/*---------------------------------------------------------------------------
 * Name         : IntDisableAll
 * Description  : disables interrupts
 * Parameters   : -
 * Return       : interrupt state bit mask before being disabled
 *---------------------------------------------------------------------------*/
static inline uint32_t IntDisableAll(void)
{
	uint32_t var;

	asm(" MRS  %0, PRIMASK" : "=r" (var));
	asm(" CPSID i");

	return var;
}

/*---------------------------------------------------------------------------
 * Name         : SpiInit
 * Description  : During MCU platform initialization at power-up this primitive may be invoked by
 *                the platform to initialize the MCU SPI port, which is connected to the Radio.
 * Parameters   : -
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiInit(void);

/*---------------------------------------------------------------------------
 * Name         : SpiReadByteFast
 * Description  : -
 * Parameters   : -
 * Return       : -
 *---------------------------------------------------------------------------*/
uint8_t SpiReadByteFast(uint8_t addr);

/*---------------------------------------------------------------------------
 * Name         : SpiReadByte
 * Description  : -
 * Parameters   : -
 * Return       : -
 *---------------------------------------------------------------------------*/
uint8_t SpiReadByte(uint8_t addr);

/*---------------------------------------------------------------------------
 * Name         : SpiReadBytes
 * Description  : -
 * Parameters   : -
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiReadBytes(uint8_t addr, uint8_t* buffer, uint8_t size);

/*---------------------------------------------------------------------------
 * Name         : SpiWriteByteFast
 * Description  : -
 * Parameters   : -
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiWriteByteFast(uint8_t addr, uint8_t val);

/*---------------------------------------------------------------------------
 * Name         : SpiWriteByte
 * Description  : -
 * Parameters   : -
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiWriteByte(uint8_t addr, uint8_t val);

/*---------------------------------------------------------------------------
 * Name         : SpiWriteBytes
 * Description  : -
 * Parameters   : -
 * Return       : -
 *---------------------------------------------------------------------------*/
void SpiWriteBytes(uint8_t addr, const uint8_t* buffer, uint8_t size);
#endif
