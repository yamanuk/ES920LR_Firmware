/** ###################################################################
**     THIS COMPONENT MODULE IS GENERATED BY THE TOOL. DO NOT MODIFY IT.
**     Filename    : PE_LDD.c
**     Project     : ProcessorExpert
**     Processor   : MKL26Z128VLL4
**     Version     : Component 01.006, Driver 01.04, CPU db: 3.00.000
**     Compiler    : IAR ARM C Compiler
**     Date/Time   : 2014-10-10, 12:09, # CodeGen: 152
**     Abstract    :
**
**     Settings    :
**
**
**     Copyright : 1997 - 2013 Freescale Semiconductor, Inc. All Rights Reserved.
**     SOURCE DISTRIBUTION PERMISSIBLE as directed in End User License Agreement.
**
**     http      : www.freescale.com
**     mail      : support@freescale.com
** ###################################################################*/
/*!
** @file PE_LDD.c
** @version 01.04
** @brief
**
*/
/*!
**  @addtogroup PE_LDD_module PE_LDD module documentation
**  @{
*/

/* MODULE PE_LDD. */

/* MQX Lite include files */
#include "mqxlite.h"
#include "mqxlite_prv.h"

#include "PE_LDD.h"
#include "Cpu.h"
#include "SerialManager.h"

/*lint -esym(765,PE_PeripheralUsed,LDD_SetClockConfiguration,PE_CpuClockConfigurations,PE_FillMemory) Disable MISRA rule (8.10) checking for symbols (PE_PeripheralUsed,LDD_SetClockConfiguration,PE_CpuClockConfigurations,PE_FillMemory). */

/*
** ===========================================================================
** Array of initialized device structures of LDD components.
** ===========================================================================
*/
LDD_TDeviceData *PE_LDD_DeviceDataList[13] = {
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  };

/*
** ===========================================================================
** The array of clock frequencies in configured clock configurations.
** ===========================================================================
*/
/*! The array of clock configurations (frequencies) configured in configured clock configurations of the CPU component. */
const TCpuClockConfiguration PE_CpuClockConfigurations[CPU_CLOCK_CONFIG_NUMBER] = {
  /* Clock configuration 0 */
  {
    CPU_CORE_CLK_HZ_CONFIG_0,          /*!< Core clock frequency in clock configuration 0 */
    CPU_BUS_CLK_HZ_CONFIG_0,           /*!< Bus clock frequency in clock configuration 0 */
    CPU_FLEXBUS_CLK_HZ_CONFIG_0,       /*!< Flexbus clock frequency in clock configuration 0 */
    CPU_FLASH_CLK_HZ_CONFIG_0,         /*!< FLASH clock frequency in clock configuration 0 */
    CPU_USB_CLK_HZ_CONFIG_0,           /*!< USB clock frequency in clock configuration 0 */
    CPU_PLL_FLL_CLK_HZ_CONFIG_0,       /*!< PLL/FLL clock frequency in clock configuration 0 */
    CPU_MCGIR_CLK_HZ_CONFIG_0,         /*!< MCG internal reference clock frequency in clock configuration 0 */
    CPU_OSCER_CLK_HZ_CONFIG_0,         /*!< System OSC external reference clock frequency in clock configuration 0 */
    CPU_ERCLK32K_CLK_HZ_CONFIG_0,      /*!< External reference clock 32k frequency in clock configuration 0 */
    CPU_MCGFF_CLK_HZ_CONFIG_0          /*!< MCG fixed frequency clock */
  },
  /* Clock configuration 1 */
  {
    CPU_CORE_CLK_HZ_CONFIG_1,          /*!< Core clock frequency in clock configuration 1 */
    CPU_BUS_CLK_HZ_CONFIG_1,           /*!< Bus clock frequency in clock configuration 1 */
    CPU_FLEXBUS_CLK_HZ_CONFIG_1,       /*!< Flexbus clock frequency in clock configuration 1 */
    CPU_FLASH_CLK_HZ_CONFIG_1,         /*!< FLASH clock frequency in clock configuration 1 */
    CPU_USB_CLK_HZ_CONFIG_1,           /*!< USB clock frequency in clock configuration 1 */
    CPU_PLL_FLL_CLK_HZ_CONFIG_1,       /*!< PLL/FLL clock frequency in clock configuration 1 */
    CPU_MCGIR_CLK_HZ_CONFIG_1,         /*!< MCG internal reference clock frequency in clock configuration 1 */
    CPU_OSCER_CLK_HZ_CONFIG_1,         /*!< System OSC external reference clock frequency in clock configuration 1 */
    CPU_ERCLK32K_CLK_HZ_CONFIG_1,      /*!< External reference clock 32k frequency in clock configuration 1 */
    CPU_MCGFF_CLK_HZ_CONFIG_1          /*!< MCG fixed frequency clock */
  }
};

/*
** ===================================================================
**     Method      :  Cpu_PE_FillMemory (component MKL26Z256LL4)
*/
/*!
**     @brief
**         Fills a memory area block by a specified value.
**     @param
**       SourceAddressPtr - Source address pointer.
**     @param
**       c - A value used to fill a memory block.
**     @param
**       len - Length of a memory block to fill.
*/
/* ===================================================================*/
void PE_FillMemory(register void* SourceAddressPtr, register uint8_t c, register uint32_t len)
{
  register uint8_t *ptr = (uint8_t*)SourceAddressPtr;

  if (len > 0U) {
    while (len--) {
      *ptr++ = c;
    }
  }
}

/*
** ===================================================================
**     Method      :  Cpu_PE_PeripheralUsed (component MKL26Z256LL4)
*/
/*!
**     @brief
**         Returns information whether a peripheral is allocated by PEx
**         or not.
**     @param
**       PrphBaseAddress - Base address of a peripheral.
**     @return
**       TRUE if a peripheral is used by PEx or FALSE if it isn't used.
*/
/* ===================================================================*/
bool PE_PeripheralUsed(uint32_t PrphBaseAddress)
{
  bool result = FALSE;

  switch (PrphBaseAddress) {
    /* Base address allocated by peripheral(s) SysTick */
    case 0xE000E010UL:
    /* Base address allocated by peripheral(s) TPM2 */
    case 0x4003A000UL:
    /* Base address allocated by peripheral(s) UART0 */
    case 0x4006A000UL:
    /* Base address allocated by peripheral(s) UART1 */
    case 0x4006B000UL:
    /* Base address allocated by peripheral(s) SPI0 */
    case 0x40076000UL:
    /* Base address allocated by peripheral(s) I2C0 */
    case 0x40066000UL:
    /* Base address allocated by peripheral(s) PTD */
    case 0x400FF0C0UL:
    /* Base address allocated by peripheral(s) PIT */
    case 0x40037000UL:
    /* Base address allocated by peripheral(s) RTC */
    case 0x4003D000UL:
    /* Base address allocated by peripheral(s) PTA */
    case 0x400FF000UL:
    /* Base address allocated by peripheral(s) PTE */
    case 0x400FF100UL:
    /* Base address allocated by peripheral(s) PTB */
    case 0x400FF040UL:
      result = TRUE;
      break;
    default:
      break;
  }
  return result;
}

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
**     @param
**       ClockConfiguration - New CPU clock configuration changed by CPU SetClockConfiguration method.
*/
/* ===================================================================*/
void LDD_SetClockConfiguration(LDD_TClockConfiguration ClockConfiguration)
{
  /* Component SystemTimer1 (TimerUnit_LDD). */
  if (PE_LDD_DeviceDataList[PE_LDD_COMPONENT_SystemTimer1_ID] != NULL) {
    SystemTimer1_SetClockConfiguration(PE_LDD_DeviceDataList[PE_LDD_COMPONENT_SystemTimer1_ID], ClockConfiguration);
  }
  /* Component StackTimer (TimerUnit_LDD). */
  if (PE_LDD_DeviceDataList[PE_LDD_COMPONENT_StackTimer_ID] != NULL) {
    StackTimer_SetClockConfiguration(PE_LDD_DeviceDataList[PE_LDD_COMPONENT_StackTimer_ID], ClockConfiguration);
  }
#if (gSerialMgrUseUartA_c)
  /* Component UARTA (Serial_LDD). */
  if (PE_LDD_DeviceDataList[PE_LDD_COMPONENT_UARTA_ID] != NULL) {
    UARTA_SetClockConfiguration(PE_LDD_DeviceDataList[PE_LDD_COMPONENT_UARTA_ID], ClockConfiguration);
  }
#endif
#if (gSerialMgrUseUartB_c)
  /* Component UARTB (Serial_LDD). */
  if (PE_LDD_DeviceDataList[PE_LDD_COMPONENT_UARTB_ID] != NULL) {
    UARTB_SetClockConfiguration(PE_LDD_DeviceDataList[PE_LDD_COMPONENT_UARTB_ID], ClockConfiguration);
  }
#endif
#if (gSerialMgrUseIIC_c)
  /* Component I2CDriver (I2C_LDD). */
  if (PE_LDD_DeviceDataList[PE_LDD_COMPONENT_I2CDriver_ID] != NULL) {
    I2CDriver_SetClockConfiguration(PE_LDD_DeviceDataList[PE_LDD_COMPONENT_I2CDriver_ID], ClockConfiguration);
  }
#endif
  /* Component PitTimeStamp (TimerUnit_LDD). */
  if (PE_LDD_DeviceDataList[PE_LDD_COMPONENT_PitTimeStamp_ID] != NULL) {
    PitTimeStamp_SetClockConfiguration(PE_LDD_DeviceDataList[PE_LDD_COMPONENT_PitTimeStamp_ID], ClockConfiguration);
  }
  /* Component RealTimeClock (LDD_RTC). */
  if (PE_LDD_DeviceDataList[PE_LDD_COMPONENT_RealTimeClock_ID] != NULL) {
    RealTimeClock_SetClockConfiguration(PE_LDD_DeviceDataList[PE_LDD_COMPONENT_RealTimeClock_ID], ClockConfiguration);
  }
  MQXLite1_SetClockConfiguration(ClockConfiguration);
}

/* END PE_LDD. */

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
