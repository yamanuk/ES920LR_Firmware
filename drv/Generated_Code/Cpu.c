/* ###################################################################
**     THIS COMPONENT MODULE IS GENERATED BY THE TOOL. DO NOT MODIFY IT.
**     Filename    : Cpu.c
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Component   : MKL26Z256LL4
**     Version     : Component 01.006, Driver 01.04, CPU db: 3.00.000
**     Datasheet   : KL26P121M48SF4RM, Rev.2, Dec 2012
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2014-10-10, 12:09, # CodeGen: 152
**     Abstract    :
**
**     Settings    :
**
**     Contents    :
**         SetClockConfiguration - LDD_TError Cpu_SetClockConfiguration(LDD_TClockConfiguration ModeID);
**         GetClockConfiguration - LDD_TClockConfiguration Cpu_GetClockConfiguration(void);
**
**     Copyright : 1997 - 2013 Freescale Semiconductor, Inc. All Rights Reserved.
**     SOURCE DISTRIBUTION PERMISSIBLE as directed in End User License Agreement.
**
**     http      : www.freescale.com
**     mail      : support@freescale.com
** ###################################################################*/
/*!
** @file Cpu.c
** @version 01.04
** @brief
**
*/
/*!
**  @addtogroup Cpu_module Cpu module documentation
**  @{
*/

/* MODULE Cpu. */

/* MQX Lite include files */
#include "mqxlite.h"
#include "mqxlite_prv.h"
#include "MQXLite1.h"
#include "SystemTimer1.h"
#include "StackTimer.h"
#include "UARTA.h"
#include "UARTB.h"
#include "SPISlave.h"
#include "I2CDriver.h"
#include "DataAvailablePin.h"
#include "PitTimeStamp.h"
#include "RealTimeClock.h"
#include "LED1.h"
#include "LED2.h"
#include "PE_Types.h"
#include "PE_Error.h"
#include "PE_Const.h"
#include "IO_Map.h"
#include "Events.h"
#include "mqx_tasks.h"
#include "Cpu.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Symbols representing MCG modes */
#define MCG_MODE_FEI                    0x00U
#define MCG_MODE_FBE                    0x01U
#define MCG_MODE_PBE                    0x02U
#define MCG_MODE_PEE                    0x03U

static const uint8_t MCGTransitionMatrix[4][4] = {
/* This matrix defines which mode is next in the MCG Mode state diagram in transitioning from the
   current mode to a target mode*/
  {  MCG_MODE_FEI,  MCG_MODE_FBE,  MCG_MODE_FBE,  MCG_MODE_FBE}, /* FEI */
  {  MCG_MODE_FEI,  MCG_MODE_FBE,  MCG_MODE_PBE,  MCG_MODE_PBE}, /* FBE */
  {  MCG_MODE_FBE,  MCG_MODE_FBE,  MCG_MODE_PBE,  MCG_MODE_PEE}, /* PBE */
  {  MCG_MODE_PBE,  MCG_MODE_PBE,  MCG_MODE_PBE,  MCG_MODE_PEE}  /* PEE */
};

/* Global variables */
volatile uint8_t SR_reg;               /* Current value of the FAULTMASK register */
volatile uint8_t SR_lock = 0x00U;      /* Lock */
static uint8_t ClockConfigurationID = CPU_CLOCK_CONFIG_0; /* Active clock configuration */

/*
** ===================================================================
**     Method      :  Cpu_LDD_SetClockConfiguration (component MKL26Z256LL4)
*/
/*!
**     @brief
**         Changes the clock configuration of all LDD components in a
**         project.
**     @param
**       ClockConfiguration - New CPU clock configuration changed by CPU SetClockConfiguration method.
*/
/* ===================================================================*/
extern void LDD_SetClockConfiguration(LDD_TClockConfiguration ClockConfiguration);


static void Cpu_SetMCGModePEE(uint8_t CLKMode);
/*
** ===================================================================
**     Method      :  Cpu_SetMCGModePEE (component MKL26Z256LL4)
**
**     Description :
**         This method sets the MCG to PEE mode.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/

static void Cpu_SetMCGModePBE(uint8_t CLKMode);
/*
** ===================================================================
**     Method      :  Cpu_SetMCGModePBE (component MKL26Z256LL4)
**
**     Description :
**         This method sets the MCG to PBE mode.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/

static void Cpu_SetMCGModeFBE(uint8_t CLKMode);
/*
** ===================================================================
**     Method      :  Cpu_SetMCGModeFBE (component MKL26Z256LL4)
**
**     Description :
**         This method sets the MCG to FBE mode.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/

static void Cpu_SetMCGModeFEI(uint8_t CLKMode);
/*
** ===================================================================
**     Method      :  Cpu_SetMCGModeFEI (component MKL26Z256LL4)
**
**     Description :
**         This method sets the MCG to FEI mode.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/

static void Cpu_SetMCG(uint8_t CLKMode);
/*
** ===================================================================
**     Method      :  Cpu_SetMCG (component MKL26Z256LL4)
**
**     Description :
**         This method updates the MCG according the requested clock
**         source setting.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/

static uint8_t Cpu_GetCurrentMCGMode(void);
/*
** ===================================================================
**     Method      :  Cpu_GetCurrentMCGMode (component MKL26Z256LL4)
**
**     Description :
**         This method returns the active MCG mode
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/

/*
** ===================================================================
**     Method      :  Cpu_Cpu_Interrupt (component MKL26Z256LL4)
**
**     Description :
**         This ISR services an unused interrupt/exception vector.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
PE_ISR(Cpu_Interrupt)
{
    /* This code can be changed using the CPU bean property "Build Options / Unhandled int code" */
    /* asm (HALT) */
}

/*
** ===================================================================
**     Method      :  Cpu_SetMCGModePEE (component MKL26Z256LL4)
**
**     Description :
**         This method sets the MCG to PEE mode.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
static void Cpu_SetMCGModePEE(uint8_t CLKMode)
{
    switch (CLKMode) {
    case 1U:
        /* Switch to PEE Mode */
        /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
        OSC0_CR = OSC_CR_ERCLKEN_MASK;

        /* MCG_C1: CLKS=0,FRDIV=5,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
        MCG_C1 = (MCG_C1_CLKS(0x00) | MCG_C1_FRDIV(0x05) | MCG_C1_IRCLKEN_MASK);

        /* MCG_C2: LOCRE0=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
        MCG_C2 = (uint8_t)((MCG_C2 & (uint8_t)~(uint8_t)(
                 MCG_C2_LOCRE0_MASK |
                 MCG_C2_RANGE0(0x01)|
                 MCG_C2_HGO0_MASK   |
                 MCG_C2_EREFS0_MASK |
                 MCG_C2_LP_MASK     |
                 MCG_C2_IRCS_MASK)) |
                 (uint8_t)(MCG_C2_RANGE0(0x02)));

        /* MCG_C5: ??=0,PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=0x0F */
        MCG_C5 = MCG_C5_PRDIV0(0x0F);

        /* MCG_C6: LOLIE0=0,PLLS=1,CME0=0,VDIV0=0 */
        MCG_C6 = (MCG_C6_PLLS_MASK | MCG_C6_VDIV0(0x00));

        /* Wait until output of the PLL is selected */
        while((MCG_S & 0x0CU) != 0x0CU);

        break;

    default:
        break;
    }
}

/*
** ===================================================================
**     Method      :  Cpu_SetMCGModePBE (component MKL26Z256LL4)
**
**     Description :
**         This method sets the MCG to PBE mode.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
static void Cpu_SetMCGModePBE(uint8_t CLKMode)
{
    switch (CLKMode) {
    case 0U:
        /* Switch to PBE Mode */
        /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
        OSC0_CR = OSC_CR_ERCLKEN_MASK;

        /* MCG_C1: CLKS=2,FRDIV=5,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
        MCG_C1 = (MCG_C1_CLKS(0x02) | MCG_C1_FRDIV(0x05) | MCG_C1_IRCLKEN_MASK);

        /* MCG_C2: LOCRE0=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
        MCG_C2 = (uint8_t)((MCG_C2 & (uint8_t)~(uint8_t)(
                 MCG_C2_LOCRE0_MASK |
                 MCG_C2_RANGE0(0x01)|
                 MCG_C2_HGO0_MASK   |
                 MCG_C2_EREFS0_MASK |
                 MCG_C2_LP_MASK     |
                 MCG_C2_IRCS_MASK)) |
                 (uint8_t)(MCG_C2_RANGE0(0x02)));

        /* MCG_C5: ??=0,PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=9 */
        MCG_C5 = MCG_C5_PRDIV0(0x09);

        /* MCG_C6: LOLIE0=0,PLLS=1,CME0=0,VDIV0=0 */
        MCG_C6 = (MCG_C6_PLLS_MASK | MCG_C6_VDIV0(0x00));

        /* Wait until external reference clock is selected as MCG output */
        while((MCG_S & 0x0CU) != 0x08U);

        /* Wait until locked */
        while((MCG_S & MCG_S_LOCK0_MASK) == 0x00U);

        break;

    case 1U:
        /* Switch to PBE Mode */
        /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
        OSC0_CR = OSC_CR_ERCLKEN_MASK;

        /* MCG_C1: CLKS=2,FRDIV=5,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
        MCG_C1 = (MCG_C1_CLKS(0x02) | MCG_C1_FRDIV(0x05) | MCG_C1_IRCLKEN_MASK);

        /* MCG_C2: LOCRE0=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
        MCG_C2 = (uint8_t)((MCG_C2 & (uint8_t)~(uint8_t)(
                 MCG_C2_LOCRE0_MASK |
                 MCG_C2_RANGE0(0x01)|
                 MCG_C2_HGO0_MASK   |
                 MCG_C2_EREFS0_MASK |
                 MCG_C2_LP_MASK     |
                 MCG_C2_IRCS_MASK)) |
                 (uint8_t)(MCG_C2_RANGE0(0x02)));

        /* MCG_C5: ??=0,PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=0x0F */
        MCG_C5 = MCG_C5_PRDIV0(0x0F);

        /* MCG_C6: LOLIE0=0,PLLS=1,CME0=0,VDIV0=0 */
        MCG_C6 = (MCG_C6_PLLS_MASK | MCG_C6_VDIV0(0x00));

        /* Wait until external reference clock is selected as MCG output */
        while((MCG_S & 0x0CU) != 0x08U);

        /* Wait until locked */
        while((MCG_S & MCG_S_LOCK0_MASK) == 0x00U);

        break;

    default:
        break;
    }
}

/*
** ===================================================================
**     Method      :  Cpu_SetMCGModeFBE (component MKL26Z256LL4)
**
**     Description :
**         This method sets the MCG to FBE mode.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
static void Cpu_SetMCGModeFBE(uint8_t CLKMode)
{
    switch (CLKMode) {
    case 0U:
        /* Switch to FBE Mode */
        /* MCG_C2: LOCRE0=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
        MCG_C2 = (uint8_t)((MCG_C2 & (uint8_t)~(uint8_t)(
                 MCG_C2_LOCRE0_MASK |
                 MCG_C2_RANGE0(0x01)|
                 MCG_C2_HGO0_MASK   |
                 MCG_C2_EREFS0_MASK |
                 MCG_C2_LP_MASK     |
                 MCG_C2_IRCS_MASK)) |
                 (uint8_t)(MCG_C2_RANGE0(0x02)));

        /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
        OSC0_CR = OSC_CR_ERCLKEN_MASK;

        /* MCG_C1: CLKS=2,FRDIV=5,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
        MCG_C1 = (MCG_C1_CLKS(0x02) | MCG_C1_FRDIV(0x05) | MCG_C1_IRCLKEN_MASK);

        /* MCG_C4: DMX32=0,DRST_DRS=0 */
        MCG_C4 &= (uint8_t)~(uint8_t)((MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS(0x03)));

        /* MCG_C5: ??=0,PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=0 */
        MCG_C5 = MCG_C5_PRDIV0(0x00);

        /* MCG_C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 */
        MCG_C6 = MCG_C6_VDIV0(0x00);

        /* Check that the source of the FLL reference clock is the external reference clock. */
        while((MCG_S & MCG_S_IREFST_MASK) != 0x00U);

        /* Wait until external reference clock is selected as MCG output */
        while((MCG_S & 0x0CU) != 0x08U);

        break;

    case 1U:
        /* Switch to FBE Mode */
        /* MCG_C2: LOCRE0=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
        MCG_C2 = (uint8_t)((MCG_C2 & (uint8_t)~(uint8_t)(
                 MCG_C2_LOCRE0_MASK |
                 MCG_C2_RANGE0(0x01)|
                 MCG_C2_HGO0_MASK   |
                 MCG_C2_EREFS0_MASK |
                 MCG_C2_LP_MASK     |
                 MCG_C2_IRCS_MASK)) |
                 (uint8_t)(MCG_C2_RANGE0(0x02)));

        /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
        OSC0_CR = OSC_CR_ERCLKEN_MASK;

        /* MCG_C1: CLKS=2,FRDIV=5,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
        MCG_C1 = (MCG_C1_CLKS(0x02) | MCG_C1_FRDIV(0x05) | MCG_C1_IRCLKEN_MASK);

        /* MCG_C4: DMX32=0,DRST_DRS=0 */
        MCG_C4 &= (uint8_t)~(uint8_t)((MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS(0x03)));

        /* MCG_C5: ??=0,PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=0x0F */
        MCG_C5 = MCG_C5_PRDIV0(0x0F);

        /* MCG_C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 */
        MCG_C6 = MCG_C6_VDIV0(0x00);

        /* Check that the source of the FLL reference clock is the external reference clock. */
        while((MCG_S & MCG_S_IREFST_MASK) != 0x00U);

        /* Wait until external reference clock is selected as MCG output */
        while((MCG_S & 0x0CU) != 0x08U);

        break;
    default:
        break;
    }
}

/*
** ===================================================================
**     Method      :  Cpu_SetMCGModeFEI (component MKL26Z256LL4)
**
**     Description :
**         This method sets the MCG to FEI mode.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
static void Cpu_SetMCGModeFEI(uint8_t CLKMode)
{
    switch (CLKMode) {
    case 0U:
        /* Switch to FEI Mode */
        /* MCG_C1: CLKS=0,FRDIV=0,IREFS=1,IRCLKEN=1,IREFSTEN=0 */
        MCG_C1 = MCG_C1_CLKS(0x00) |
                 MCG_C1_FRDIV(0x00)|
                 MCG_C1_IREFS_MASK |
                 MCG_C1_IRCLKEN_MASK;

        /* MCG_C2: LOCRE0=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
        MCG_C2 = (uint8_t)((MCG_C2 & (uint8_t)~(uint8_t)(
                 MCG_C2_LOCRE0_MASK |
                 MCG_C2_RANGE0(0x01)|
                 MCG_C2_HGO0_MASK   |
                 MCG_C2_EREFS0_MASK |
                 MCG_C2_LP_MASK     |
                 MCG_C2_IRCS_MASK)) |
                 (uint8_t)(MCG_C2_RANGE0(0x02)));

        /* MCG_C4: DMX32=0,DRST_DRS=0 */
        MCG_C4 &= (uint8_t)~(uint8_t)((MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS(0x03)));
        MCG_C4 |= MCG_C4_DMX32_MASK;

        /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
        OSC0_CR = OSC_CR_ERCLKEN_MASK;

        /* MCG_C5: ??=0,PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=0 */
        MCG_C5 = MCG_C5_PRDIV0(0x00);

        /* MCG_C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 */
        MCG_C6 = MCG_C6_VDIV0(0x00);

        /* Check that the source of the FLL reference clock is the internal reference clock. */
        while((MCG_S & MCG_S_IREFST_MASK) == 0x00U);

        /* Wait until output of the FLL is selected */
        while((MCG_S & 0x0CU) != 0x00U);

        break;

    default:
        break;
    }
}

/*
** ===================================================================
**     Method      :  Cpu_SetMCG (component MKL26Z256LL4)
**
**     Description :
**         This method updates the MCG according the requested clock
**         source setting.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
static void Cpu_SetMCG(uint8_t CLKMode)
{
    uint8_t TargetMCGMode = 0x00U;
    uint8_t NextMCGMode;

    switch (CLKMode) {
    case 0U:
        TargetMCGMode = MCG_MODE_FEI;
        break;
    case 1U:
        TargetMCGMode = MCG_MODE_PEE;
        break;
    default:
        break;
    }

    NextMCGMode = Cpu_GetCurrentMCGMode(); /* Identify the currently active MCG mode */
    do {
        NextMCGMode = MCGTransitionMatrix[NextMCGMode][TargetMCGMode]; /* Get the next MCG mode on the path to the target MCG mode */

        /* Set the next MCG mode on the path to the target MCG mode */
        switch (NextMCGMode) {
        case MCG_MODE_FEI:
            Cpu_SetMCGModeFEI(CLKMode);
            break;
        case MCG_MODE_FBE:
            Cpu_SetMCGModeFBE(CLKMode);
            break;
        case MCG_MODE_PBE:
            Cpu_SetMCGModePBE(CLKMode);
            break;
        case MCG_MODE_PEE:
            Cpu_SetMCGModePEE(CLKMode);
            break;
        default:
            break;
        }
    } while (TargetMCGMode != NextMCGMode); /* Loop until the target MCG mode is set */
}

/*
** ===================================================================
**     Method      :  Cpu_GetCurrentMCGMode (component MKL26Z256LL4)
**
**     Description :
**         This method returns the active MCG mode
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
uint8_t Cpu_GetCurrentMCGMode(void)
{
    switch (MCG_C1  & MCG_C1_CLKS_MASK) {
    case  0x00U:
        /* Output of FLL or PLL is selected (depends on PLLS control bit). */
        if ((MCG_C6 & MCG_C6_PLLS_MASK) == 0x00U) {
            /* FLL is selected */
            return MCG_MODE_FEI;
        } else {
            /* PLL is selected */
            return MCG_MODE_PEE;
        }
    case 0x80U:
        if ((MCG_C6 & MCG_C6_PLLS_MASK) == 0x00U) {
            /* FLL is selected */
            return MCG_MODE_FBE;
        } else {
            /* PLL is selected */
            return MCG_MODE_PBE;
        }
    default:
        return 0x00U;
    }
}

/*
** ===================================================================
**     Method      :  Cpu_SetClockConfiguration (component MKL26Z256LL4)
*/
/*!
**     @brief
**         Calling of this method will cause the clock configuration
**         change and reconfiguration of all components according to
**         the requested clock configuration setting.
**     @param
**         ModeID          - Clock configuration identifier
**     @return
**                         - ERR_OK - OK.
**                           ERR_RANGE - Mode parameter out of range
*/
/* ===================================================================*/
LDD_TError Cpu_SetClockConfiguration(LDD_TClockConfiguration ModeID)
{
    if (ModeID > 0x01U) {
        return ERR_RANGE;                  /* Undefined clock configuration requested requested */
    }
    switch (ModeID) {
    case CPU_CLOCK_CONFIG_0:
        /* SIM_CLKDIV1: OUTDIV1=1,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,OUTDIV4=3,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
        SIM_CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x01) | SIM_CLKDIV1_OUTDIV4(0x03)); /* Set the system prescalers to safe value */
        Cpu_SetMCG(0U);                  /* Update clock source setting */

        /* SIM_CLKDIV1: OUTDIV1=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,OUTDIV4=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
        SIM_CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x00) | SIM_CLKDIV1_OUTDIV4(0x00)); /* Update system prescalers */

        /* SIM_SOPT2: PLLFLLSEL=0 */
        SIM_SOPT2 &= (uint32_t)~(uint32_t)(SIM_SOPT2_PLLFLLSEL_MASK); /* Select FLL as a clock source for various peripherals */

        /* SIM_SOPT1: OSC32KSEL=2 */
        /* SIM_SOPT1 = (uint32_t)((SIM_SOPT1 & (uint32_t)~(uint32_t)(
                       SIM_SOPT1_OSC32KSEL(0x01))) |
                       (uint32_t)(
                       SIM_SOPT1_OSC32KSEL(0x02)
                       )); */                 /* System oscillator drives 32 kHz clock for various peripherals */

        /* SIM_SOPT2: TPMSRC=1 */
        SIM_SOPT2 = (uint32_t)((SIM_SOPT2 & (uint32_t)~(uint32_t)(
                    SIM_SOPT2_TPMSRC(0x02))) |
                    (uint32_t)(
                    SIM_SOPT2_TPMSRC(0x01)
                    ));                  /* Set the TPM clock */
        break;

    case CPU_CLOCK_CONFIG_1:
        /* SIM_CLKDIV1: OUTDIV1=1,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,OUTDIV4=3,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
        SIM_CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x01) | SIM_CLKDIV1_OUTDIV4(0x03)); /* Set the system prescalers to safe value */
        Cpu_SetMCG(1U);                  /* Update clock source setting */

        /* SIM_CLKDIV1: OUTDIV1=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,OUTDIV4=1,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0,??=0 */
        SIM_CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x00) | SIM_CLKDIV1_OUTDIV4(0x01)); /* Update system prescalers */

        /* SIM_SOPT2: PLLFLLSEL=1 */
        SIM_SOPT2 |= SIM_SOPT2_PLLFLLSEL_MASK; /* Select PLL as a clock source for various peripherals */

        /* SIM_SOPT1: OSC32KSEL=2 */
        /* SIM_SOPT1 = (uint32_t)((SIM_SOPT1 & (uint32_t)~(uint32_t)(
                       SIM_SOPT1_OSC32KSEL(0x01))) |
                       (uint32_t)(
                       SIM_SOPT1_OSC32KSEL(0x02)
                       )); */                 /* System oscillator drives 32 kHz clock for various peripherals */

        /* SIM_SOPT2: TPMSRC=1 */
        SIM_SOPT2 = (uint32_t)((SIM_SOPT2 & (uint32_t)~(uint32_t)(
                    SIM_SOPT2_TPMSRC(0x02))) |
                    (uint32_t)(
                    SIM_SOPT2_TPMSRC(0x01)
                    ));                  /* Set the TPM clock */
        break;

    default:
        break;
    }
    LDD_SetClockConfiguration(ModeID);   /* Call all LDD components to update the clock configuration */
    ClockConfigurationID = ModeID;       /* Store clock configuration identifier */
    return ERR_OK;
}

/*
** ===================================================================
**     Method      :  Cpu_GetClockConfiguration (component MKL26Z256LL4)
*/
/*!
**     @brief
**         Returns the active clock configuration identifier. The
**         method is automatically enabled if more than one clock
**         configuration is enabled in the component.
**     @return
**                         - Active clock configuration identifier
*/
/* ===================================================================*/
LDD_TClockConfiguration Cpu_GetClockConfiguration(void)
{
    return ClockConfigurationID;         /* Return the actual clock configuration identifier */
}


/*** !!! Here you can place your own code using property "User data declarations" on the build options tab. !!! ***/

/*lint -esym(765,__low_level_init) Disable MISRA rule (8.10) checking for symbols (__low_level_init). The function is linked to the EWL library */
/*lint -esym(765,Cpu_Interrupt) Disable MISRA rule (8.10) checking for symbols (Cpu_Interrupt). */
/*lint -save  -e970 Disable MISRA rule (6.3) checking. */
int __low_level_init(void)
/*lint -restore Enable MISRA rule (6.3) checking. */
{
    /*** PE initialization code after reset ***/
    SCB_VTOR = (uint32_t)(&__vector_table); /* Set the interrupt vector table position */

    /* Disable the WDOG module */
    SIM_COPC = SIM_COPC_COPT(0x03);

    /* System clock initialization */
    SIM_CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x00) | SIM_CLKDIV1_OUTDIV4(0x03)); /* Set the system prescalers to safe value */

    /* SIM_SCGC5: PORTE=1,PORTD=1,PORTC=1,PORTB=1,PORTA=1 */
    SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK |
                 SIM_SCGC5_PORTD_MASK |
                 SIM_SCGC5_PORTC_MASK |
                 SIM_SCGC5_PORTB_MASK |
                 SIM_SCGC5_PORTA_MASK;   /* Enable clock gate for ports to enable pin routing */

    if ((PMC_REGSC & PMC_REGSC_ACKISO_MASK) != 0x0U) {
        /* PMC_REGSC: ACKISO=1 */
        PMC_REGSC |= PMC_REGSC_ACKISO_MASK; /* Release IO pads after wakeup from VLLS mode. */
    }

    SIM_CLKDIV1 = (SIM_CLKDIV1_OUTDIV1(0x00) | SIM_CLKDIV1_OUTDIV4(0x00)); /* Update system prescalers */

    /* SIM_SOPT2: PLLFLLSEL=0 */
    SIM_SOPT2 &= (uint32_t)~(uint32_t)(SIM_SOPT2_PLLFLLSEL_MASK); /* Select FLL as a clock source for various peripherals */

    /* SIM_SOPT1: OSC32KSEL=2 */
    /* SIM_SOPT1 = (uint32_t)((SIM_SOPT1 & (uint32_t)~(uint32_t)(SIM_SOPT1_OSC32KSEL(0x01))) |
                   (uint32_t)(SIM_SOPT1_OSC32KSEL(0x02))); */     /* System oscillator drives 32 kHz clock for various peripherals */

    /* SIM_SOPT2: TPMSRC=1 */
    SIM_SOPT2 = (uint32_t)((SIM_SOPT2 & (uint32_t)~(uint32_t)(SIM_SOPT2_TPMSRC(0x02))) |
                           (uint32_t)(SIM_SOPT2_TPMSRC(0x01)));   /* Set the TPM clock */

    /* Switch to FEI Mode */
    /* MCG_C1: CLKS=0,FRDIV=0,IREFS=1,IRCLKEN=1,IREFSTEN=0 */
    MCG_C1 = MCG_C1_CLKS(0x00) |
             MCG_C1_FRDIV(0x00)|
             MCG_C1_IREFS_MASK |
             MCG_C1_IRCLKEN_MASK;

    /* MCG_C2: LOCRE0=0,RANGE0=2,HGO0=0,EREFS0=0,LP=0,IRCS=0 */
    MCG_C2 = (uint8_t)((MCG_C2 & (uint8_t)~(uint8_t)(
             MCG_C2_LOCRE0_MASK |
             MCG_C2_RANGE0(0x01)|
             MCG_C2_HGO0_MASK   |
             MCG_C2_EREFS0_MASK |
             MCG_C2_LP_MASK     |
             MCG_C2_IRCS_MASK)) |
             (uint8_t)(MCG_C2_RANGE0(0x02)));

    /* MCG_C4: DMX32=0,DRST_DRS=0 */
    MCG_C4 &= (uint8_t)~(uint8_t)(MCG_C4_DMX32_MASK | MCG_C4_DRST_DRS(0x03));
    MCG_C4 |= MCG_C4_DMX32_MASK;

    /* OSC0_CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=0,SC4P=0,SC8P=0,SC16P=0 */
    OSC0_CR = OSC_CR_ERCLKEN_MASK;

    /* MCG_C5: ??=0,PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=0 */
    MCG_C5 = MCG_C5_PRDIV0(0x00);

    /* MCG_C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 */
    MCG_C6 = MCG_C6_VDIV0(0x00);

    /* Check that the source of the FLL reference clock is the internal reference clock. */
    while((MCG_S & MCG_S_IREFST_MASK) == 0x00U);

    /* Wait until output of the FLL is selected */
    while((MCG_S & 0x0CU) != 0x00U);

    PORTC_PCR1 = PORT_PCR_MUX(1) | PORT_PCR_PE_MASK | PORT_PCR_PS_MASK;  // for SW1/INT

    return 1;
}

/*
** ===================================================================
**     Method      :  PE_low_level_init (component MKL26Z256LL4)
**
**     Description :
**         Initializes beans and provides common register initialization.
**         The method is called automatically as a part of the
**         application initialization code.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
void PE_low_level_init(void)
{
    uint16_t ResetSource;           /* Source of reset */

#ifdef PEX_RTOS_INIT
    PEX_RTOS_INIT();                /* Initialization of the selected RTOS. Macro is defined by the RTOS component. */
#endif

    /* Initialization of the SIM module */

    /* Initialization of the RCM module */
    /* RCM_RPFW: RSTFLTSEL=0 */
    RCM_RPFW &= (uint8_t)~(uint8_t)(RCM_RPFW_RSTFLTSEL(0x1F));

    /* RCM_RPFC: RSTFLTSS=0,RSTFLTSRW=0 */
    RCM_RPFC &= (uint8_t)~(uint8_t)(RCM_RPFC_RSTFLTSS_MASK | RCM_RPFC_RSTFLTSRW(0x03));

    /* Initialization of the FTFL_FlashConfig module */

    /* Initialization of the PMC module */
    /* PMC_LVDSC1: LVDACK=1,LVDIE=0,LVDRE=1,LVDV=0 */
    PMC_LVDSC1 = (uint8_t)((PMC_LVDSC1 & (uint8_t)~(uint8_t)(PMC_LVDSC1_LVDIE_MASK |
                 PMC_LVDSC1_LVDV(0x03))) | (uint8_t)(PMC_LVDSC1_LVDACK_MASK |
                 PMC_LVDSC1_LVDRE_MASK));

    /* PMC_LVDSC2: LVWACK=1,LVWIE=0,LVWV=0 */
    PMC_LVDSC2 = (uint8_t)((PMC_LVDSC2 & (uint8_t)~(uint8_t)(PMC_LVDSC2_LVWIE_MASK |
                 PMC_LVDSC2_LVWV(0x03))) | (uint8_t)(PMC_LVDSC2_LVWACK_MASK));

    /* PMC_REGSC: BGEN=0,ACKISO=0,BGBE=0 */
    PMC_REGSC &= (uint8_t)~(uint8_t)(PMC_REGSC_BGEN_MASK |
                 PMC_REGSC_ACKISO_MASK | PMC_REGSC_BGBE_MASK);

    /* SMC_PMPROT: ??=0,??=0,AVLP=0,??=0,ALLS=0,??=0,AVLLS=0,??=0 */
    /* Setup Power mode protection register */
    SMC_PMPROT = SMC_PMPROT_AVLLS_MASK | SMC_PMPROT_ALLS_MASK | SMC_PMPROT_AVLP_MASK;

    /* Common initialization of the CPU registers */
    /* PORTA_PCR20: ISF=0,MUX=7 */
    PORTA_PCR20 = (uint32_t)((PORTA_PCR20 & (uint32_t)~(uint32_t)(PORT_PCR_ISF_MASK)) |
                  (uint32_t)(PORT_PCR_MUX(0x07)));

    /* NVIC_IPR1: PRI_6=0 */
    NVIC_IPR1 &= (uint32_t)~(uint32_t)(NVIC_IP_PRI_6(0xFF));
    ResetSource = (uint16_t)(((uint16_t)RCM_SRS1) << 8U);
    ResetSource |= RCM_SRS0;
    Cpu_OnReset(ResetSource);            /* Invoke an user event */

    /* ### Serial_LDD "UARTA" component auto initialization. Auto initialization feature can be disabled by component property "Auto initialization". */
    (void)UARTA_Init(NULL);
}

/* Flash configuration field */
/* Pragma to place the flash configuration field on correct location defined in linkler file. */
#if defined(__IAR_SYSTEMS_ICC__)
	#pragma language=extended
    #pragma location = "FlashConfig"
    __root const uint8_t Config[0x10] @ "FlashConfig" = {
#elif defined(__GNUC__)
    __attribute__((section(".FlashConfig"))) const uint8_t Config[0x10] __attribute__((used)) = {
#endif
    /* NV_BACKKEY3: KEY=0xFF */
    0xFFU,
    /* NV_BACKKEY2: KEY=0xFF */
    0xFFU,
    /* NV_BACKKEY1: KEY=0xFF */
    0xFFU,
    /* NV_BACKKEY0: KEY=0xFF */
    0xFFU,
    /* NV_BACKKEY7: KEY=0xFF */
    0xFFU,
    /* NV_BACKKEY6: KEY=0xFF */
    0xFFU,
    /* NV_BACKKEY5: KEY=0xFF */
    0xFFU,
    /* NV_BACKKEY4: KEY=0xFF */
    0xFFU,
    /* NV_FPROT3: PROT=0xFF */
    0xFFU,
    /* NV_FPROT2: PROT=0xFF */
    0xFFU,
    /* NV_FPROT1: PROT=0xFF */
    0xFFU,
    /* NV_FPROT0: PROT=0xFF */
    0xFFU,
    /* NV_FSEC: KEYEN=1,MEEN=3,FSLACC=3,SEC=2 */
    0x7EU,
    /* NV_FOPT: ??=1,??=1,FAST_INIT=1,LPBOOT1=1,RESET_PIN_CFG=1,NMI_DIS=0,??=1,LPBOOT0=1 */
    0xFBU,
    0xFFU,
    0xFFU
};
/* END Cpu. */

#ifdef __cplusplus
}  /* extern "C" */
#endif

/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.3 [05.09]
**     for the Freescale Kinetis series of microcontrollers.
**
** ###################################################################
*/