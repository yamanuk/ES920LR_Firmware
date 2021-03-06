/*
  PDD layer implementation for peripheral type SysTick
  (C) 2010 Freescale, Inc. All rights reserved.

  This file is static and it is generated from API-Factory
*/

#if !defined(SysTick_PDD_H_)
#define SysTick_PDD_H_

/* ----------------------------------------------------------------------------
   -- Test if supported MCU is active
   ---------------------------------------------------------------------------- */

#if !defined(MCU_ACTIVE)
  // No MCU is active
  #error SysTick PDD library: No derivative is active. Place proper #include with PDD memory map before including PDD library.
#elif \
      !defined(MCU_MK10D10) /* SysTick */ && \
      !defined(MCU_MK10D5) /* SysTick */ && \
      !defined(MCU_MK10D7) /* SysTick */ && \
      !defined(MCU_MK10F12) /* SysTick */ && \
      !defined(MCU_MK10DZ10) /* SysTick */ && \
      !defined(MCU_MK11D5) /* SysTick */ && \
      !defined(MCU_MK11D5WS) /* SysTick */ && \
      !defined(MCU_MK12D5) /* SysTick */ && \
      !defined(MCU_MK20D10) /* SysTick */ && \
      !defined(MCU_MK20D5) /* SysTick */ && \
      !defined(MCU_MK20D7) /* SysTick */ && \
      !defined(MCU_MK20F12) /* SysTick */ && \
      !defined(MCU_MK20DZ10) /* SysTick */ && \
      !defined(MCU_MK21D5) /* SysTick */ && \
      !defined(MCU_MK21D5WS) /* SysTick */ && \
      !defined(MCU_MK22D5) /* SysTick */ && \
      !defined(MCU_MK30D10) /* SysTick */ && \
      !defined(MCU_MK30D7) /* SysTick */ && \
      !defined(MCU_MK30DZ10) /* SysTick */ && \
      !defined(MCU_MK40D10) /* SysTick */ && \
      !defined(MCU_MK40D7) /* SysTick */ && \
      !defined(MCU_MK40DZ10) /* SysTick */ && \
      !defined(MCU_MK40X256VMD100) /* SysTick */ && \
      !defined(MCU_MK50D10) /* SysTick */ && \
      !defined(MCU_MK50D7) /* SysTick */ && \
      !defined(MCU_MK50DZ10) /* SysTick */ && \
      !defined(MCU_MK51D10) /* SysTick */ && \
      !defined(MCU_MK51D7) /* SysTick */ && \
      !defined(MCU_MK51DZ10) /* SysTick */ && \
      !defined(MCU_MK52D10) /* SysTick */ && \
      !defined(MCU_MK52DZ10) /* SysTick */ && \
      !defined(MCU_MK53D10) /* SysTick */ && \
      !defined(MCU_MK53DZ10) /* SysTick */ && \
      !defined(MCU_MK60D10) /* SysTick */ && \
      !defined(MCU_MK60F12) /* SysTick */ && \
      !defined(MCU_MK60F15) /* SysTick */ && \
      !defined(MCU_MK60DZ10) /* SysTick */ && \
      !defined(MCU_MK60N512VMD100) /* SysTick */ && \
      !defined(MCU_MK61F12) /* SysTick */ && \
      !defined(MCU_MK61F15) /* SysTick */ && \
      !defined(MCU_MK61F12WS) /* SysTick */ && \
      !defined(MCU_MK61F15WS) /* SysTick */ && \
      !defined(MCU_MK70F12) /* SysTick */ && \
      !defined(MCU_MK70F15) /* SysTick */ && \
      !defined(MCU_MK70F12WS) /* SysTick */ && \
      !defined(MCU_MK70F15WS) /* SysTick */ && \
      !defined(MCU_MKL02Z4) /* SysTick */ && \
      !defined(MCU_MKL04Z4) /* SysTick */ && \
      !defined(MCU_MKL05Z4) /* SysTick */ && \
      !defined(MCU_MKL14Z4) /* SysTick */ && \
      !defined(MCU_MKL15Z4) /* SysTick */ && \
      !defined(MCU_MKL16Z4) /* SysTick */ && \
      !defined(MCU_MKL24Z4) /* SysTick */ && \
      !defined(MCU_MKL25Z4) /* SysTick */ && \
      !defined(MCU_MKL26Z4) /* SysTick */ && \
      !defined(MCU_MKL34Z4) /* SysTick */ && \
      !defined(MCU_MKL36Z4) /* SysTick */ && \
      !defined(MCU_MKL46Z4) /* SysTick */ && \
      !defined(MCU_PCK20L4) /* SysTick */
  // Unsupported MCU is active
  #error SysTick PDD library: Unsupported derivative is active.
#endif

#include "PDD_Types.h"

/* ----------------------------------------------------------------------------
   -- Method symbol definitions
   ---------------------------------------------------------------------------- */

#if ((defined(MCU_MKL02Z4)) || (defined(MCU_MKL04Z4)) || (defined(MCU_MKL05Z4)) || (defined(MCU_MKL14Z4)) || (defined(MCU_MKL15Z4)) || (defined(MCU_MKL16Z4)) || (defined(MCU_MKL24Z4)) || (defined(MCU_MKL25Z4)) || (defined(MCU_MKL26Z4)) || (defined(MCU_MKL34Z4)) || (defined(MCU_MKL36Z4)) || (defined(MCU_MKL46Z4)))
/* Clock source constants. */
  #define SysTick_PDD_CORE_CLOCK       0x1U        /**< 1 */
  #define SysTick_PDD_CORE_CLOCK_DIV16 0U          /**< 1 */

#else /* (defined(MCU_MK10D10)) || (defined(MCU_MK10D5)) || (defined(MCU_MK10D7)) || (defined(MCU_MK10DZ10)) || (defined(MCU_MK10F12)) || (defined(MCU_MK11D5)) || (defined(MCU_MK11D5WS)) || (defined(MCU_MK12D5)) || (defined(MCU_MK20D10)) || (defined(MCU_MK20D5)) || (defined(MCU_MK20D7)) || (defined(MCU_MK20DZ10)) || (defined(MCU_MK20F12)) || (defined(MCU_MK21D5)) || (defined(MCU_MK21D5WS)) || (defined(MCU_MK22D5)) || (defined(MCU_MK30D10)) || (defined(MCU_MK30D7)) || (defined(MCU_MK30DZ10)) || (defined(MCU_MK40D10)) || (defined(MCU_MK40D7)) || (defined(MCU_MK40DZ10)) || (defined(MCU_MK40X256VMD100)) || (defined(MCU_MK50D10)) || (defined(MCU_MK50D7)) || (defined(MCU_MK50DZ10)) || (defined(MCU_MK51D10)) || (defined(MCU_MK51D7)) || (defined(MCU_MK51DZ10)) || (defined(MCU_MK52D10)) || (defined(MCU_MK52DZ10)) || (defined(MCU_MK53D10)) || (defined(MCU_MK53DZ10)) || (defined(MCU_MK60D10)) || (defined(MCU_MK60DZ10)) || (defined(MCU_MK60F12)) || (defined(MCU_MK60F15)) || (defined(MCU_MK60N512VMD100)) || (defined(MCU_MK61F12)) || (defined(MCU_MK61F12WS)) || (defined(MCU_MK61F15)) || (defined(MCU_MK61F15WS)) || (defined(MCU_MK70F12)) || (defined(MCU_MK70F12WS)) || (defined(MCU_MK70F15)) || (defined(MCU_MK70F15WS)) || (defined(MCU_PCK20L4)) */
/* Clock source constants. */
  #define SysTick_PDD_CORE_CLOCK 0x1U              /**< 1 */

#endif /* (defined(MCU_MK10D10)) || (defined(MCU_MK10D5)) || (defined(MCU_MK10D7)) || (defined(MCU_MK10DZ10)) || (defined(MCU_MK10F12)) || (defined(MCU_MK11D5)) || (defined(MCU_MK11D5WS)) || (defined(MCU_MK12D5)) || (defined(MCU_MK20D10)) || (defined(MCU_MK20D5)) || (defined(MCU_MK20D7)) || (defined(MCU_MK20DZ10)) || (defined(MCU_MK20F12)) || (defined(MCU_MK21D5)) || (defined(MCU_MK21D5WS)) || (defined(MCU_MK22D5)) || (defined(MCU_MK30D10)) || (defined(MCU_MK30D7)) || (defined(MCU_MK30DZ10)) || (defined(MCU_MK40D10)) || (defined(MCU_MK40D7)) || (defined(MCU_MK40DZ10)) || (defined(MCU_MK40X256VMD100)) || (defined(MCU_MK50D10)) || (defined(MCU_MK50D7)) || (defined(MCU_MK50DZ10)) || (defined(MCU_MK51D10)) || (defined(MCU_MK51D7)) || (defined(MCU_MK51DZ10)) || (defined(MCU_MK52D10)) || (defined(MCU_MK52DZ10)) || (defined(MCU_MK53D10)) || (defined(MCU_MK53DZ10)) || (defined(MCU_MK60D10)) || (defined(MCU_MK60DZ10)) || (defined(MCU_MK60F12)) || (defined(MCU_MK60F15)) || (defined(MCU_MK60N512VMD100)) || (defined(MCU_MK61F12)) || (defined(MCU_MK61F12WS)) || (defined(MCU_MK61F15)) || (defined(MCU_MK61F15WS)) || (defined(MCU_MK70F12)) || (defined(MCU_MK70F12WS)) || (defined(MCU_MK70F15)) || (defined(MCU_MK70F15WS)) || (defined(MCU_PCK20L4)) */

/* ----------------------------------------------------------------------------
   -- GetInterruptMask
   ---------------------------------------------------------------------------- */

/**
 * @brief Returns interrupt mask.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a 32-bit value.
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      uint32_t result = SysTick_PDD_GetInterruptMask(deviceID);
 *      @endcode
 */
#define SysTick_PDD_GetInterruptMask(PeripheralBase) ( \
    (uint32_t)(SysTick_CSR_REG(PeripheralBase) & SysTick_CSR_TICKINT_MASK) \
  )

/* ----------------------------------------------------------------------------
   -- GetInterruptFlag
   ---------------------------------------------------------------------------- */

/**
 * @brief Returns interrupt flag bit.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a 32-bit value.
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      uint32_t result = SysTick_PDD_GetInterruptFlag(deviceID);
 *      @endcode
 */
#define SysTick_PDD_GetInterruptFlag(PeripheralBase) ( \
    (uint32_t)(SysTick_CSR_REG(PeripheralBase) & SysTick_CSR_COUNTFLAG_MASK) \
  )

/* ----------------------------------------------------------------------------
   -- EnableInterrupt
   ---------------------------------------------------------------------------- */

/**
 * @brief Enables the SysTick interrupt.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a value of void type.
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      SysTick_PDD_EnableInterrupt(deviceID);
 *      @endcode
 */
#define SysTick_PDD_EnableInterrupt(PeripheralBase) ( \
    SysTick_CSR_REG(PeripheralBase) |= \
     SysTick_CSR_TICKINT_MASK \
  )

/* ----------------------------------------------------------------------------
   -- DisableInterrupt
   ---------------------------------------------------------------------------- */

/**
 * @brief Disables the SysTick interrupt.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a value of void type.
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      SysTick_PDD_DisableInterrupt(deviceID);
 *      @endcode
 */
#define SysTick_PDD_DisableInterrupt(PeripheralBase) ( \
    SysTick_CSR_REG(PeripheralBase) &= \
     (uint32_t)(~(uint32_t)SysTick_CSR_TICKINT_MASK) \
  )

/* ----------------------------------------------------------------------------
   -- ClearInterruptFlag
   ---------------------------------------------------------------------------- */

/**
 * @brief Clears SysTick interrupt flag.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a value of void type.
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      SysTick_PDD_ClearInterruptFlag(deviceID);
 *      @endcode
 */
#define SysTick_PDD_ClearInterruptFlag(PeripheralBase) ( \
    SysTick_CSR_REG(PeripheralBase) &= \
     (uint32_t)(~(uint32_t)SysTick_CSR_COUNTFLAG_MASK) \
  )

/* ----------------------------------------------------------------------------
   -- EnableDevice
   ---------------------------------------------------------------------------- */

/**
 * @brief Enables the SysTick device.
 * @param PeripheralBase Peripheral base address.
 * @param State Requested state of SysTick device. This parameter is of "Global
 *        enumeration used for specifying general enable/disable states
 *        (PDD_DISABLE and PDD_ENABLE defined in PDD_Types.h)" type.
 * @return Returns a value of void type.
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      SysTick_PDD_EnableDevice(deviceID, PDD_DISABLE);
 *      @endcode
 */
#define SysTick_PDD_EnableDevice(PeripheralBase, State) ( \
    SysTick_CSR_REG(PeripheralBase) = \
     (uint32_t)(( \
      (uint32_t)(( \
       SysTick_CSR_REG(PeripheralBase)) & ( \
       (uint32_t)(~(uint32_t)SysTick_CSR_ENABLE_MASK)))) | ( \
      (uint32_t)(State))) \
  )

/* ----------------------------------------------------------------------------
   -- GetEnableDeviceStatus
   ---------------------------------------------------------------------------- */

/**
 * @brief Returns current state of SysTick device.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a 32-bit value.
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      uint32_t result = SysTick_PDD_GetEnableDeviceStatus(deviceID);
 *      @endcode
 */
#define SysTick_PDD_GetEnableDeviceStatus(PeripheralBase) ( \
    (uint32_t)(SysTick_CSR_REG(PeripheralBase) & SysTick_CSR_ENABLE_MASK) \
  )

/* ----------------------------------------------------------------------------
   -- SetClkSource
   ---------------------------------------------------------------------------- */

/**
 * @brief Sets clock source.
 * @param PeripheralBase Peripheral base address.
 * @param ClkSource New value of the clock source. Use constants from group
 *        "Clock source constants.". This parameter is 1 bit wide.
 * @return Returns a value of void type.
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      SysTick_PDD_SetClkSource(deviceID, SysTick_PDD_CORE_CLOCK);
 *      @endcode
 */
#define SysTick_PDD_SetClkSource(PeripheralBase, ClkSource) ( \
    SysTick_CSR_REG(PeripheralBase) = \
     (uint32_t)(( \
      (uint32_t)(( \
       SysTick_CSR_REG(PeripheralBase)) & ( \
       (uint32_t)(~(uint32_t)SysTick_CSR_CLKSOURCE_MASK)))) | ( \
      (uint32_t)((uint32_t)(ClkSource) << SysTick_CSR_CLKSOURCE_SHIFT))) \
  )

/* ----------------------------------------------------------------------------
   -- GetClkSource
   ---------------------------------------------------------------------------- */

#if ((defined(MCU_MKL02Z4)) || (defined(MCU_MKL04Z4)) || (defined(MCU_MKL05Z4)) || (defined(MCU_MKL14Z4)) || (defined(MCU_MKL15Z4)) || (defined(MCU_MKL16Z4)) || (defined(MCU_MKL24Z4)) || (defined(MCU_MKL25Z4)) || (defined(MCU_MKL26Z4)) || (defined(MCU_MKL34Z4)) || (defined(MCU_MKL36Z4)) || (defined(MCU_MKL46Z4)))
/**
 * @brief Gets clock source.
 * @param PeripheralBase Peripheral base address.
 * @return Use constants from group "Clock source constants." for processing
 *         return value. The value is cast to "uint8_t".
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      uint8_t result = SysTick_PDD_GetClkSource(deviceID);
 *      @endcode
 */
  #define SysTick_PDD_GetClkSource(PeripheralBase) ( \
      (uint8_t)(( \
       (uint32_t)(SysTick_CSR_REG(PeripheralBase) & SysTick_CSR_CLKSOURCE_MASK)) >> ( \
       SysTick_CSR_CLKSOURCE_SHIFT)) \
    )
#else /* (defined(MCU_MK10D10)) || (defined(MCU_MK10D5)) || (defined(MCU_MK10D7)) || (defined(MCU_MK10DZ10)) || (defined(MCU_MK10F12)) || (defined(MCU_MK11D5)) || (defined(MCU_MK11D5WS)) || (defined(MCU_MK12D5)) || (defined(MCU_MK20D10)) || (defined(MCU_MK20D5)) || (defined(MCU_MK20D7)) || (defined(MCU_MK20DZ10)) || (defined(MCU_MK20F12)) || (defined(MCU_MK21D5)) || (defined(MCU_MK21D5WS)) || (defined(MCU_MK22D5)) || (defined(MCU_MK30D10)) || (defined(MCU_MK30D7)) || (defined(MCU_MK30DZ10)) || (defined(MCU_MK40D10)) || (defined(MCU_MK40D7)) || (defined(MCU_MK40DZ10)) || (defined(MCU_MK40X256VMD100)) || (defined(MCU_MK50D10)) || (defined(MCU_MK50D7)) || (defined(MCU_MK50DZ10)) || (defined(MCU_MK51D10)) || (defined(MCU_MK51D7)) || (defined(MCU_MK51DZ10)) || (defined(MCU_MK52D10)) || (defined(MCU_MK52DZ10)) || (defined(MCU_MK53D10)) || (defined(MCU_MK53DZ10)) || (defined(MCU_MK60D10)) || (defined(MCU_MK60DZ10)) || (defined(MCU_MK60F12)) || (defined(MCU_MK60F15)) || (defined(MCU_MK60N512VMD100)) || (defined(MCU_MK61F12)) || (defined(MCU_MK61F12WS)) || (defined(MCU_MK61F15)) || (defined(MCU_MK61F15WS)) || (defined(MCU_MK70F12)) || (defined(MCU_MK70F12WS)) || (defined(MCU_MK70F15)) || (defined(MCU_MK70F15WS)) || (defined(MCU_PCK20L4)) */
/**
 * @brief Gets clock source.
 * @param PeripheralBase Peripheral base address.
 * @return Use constants from group "Clock source constants." for processing
 *         return value. The value is cast to "uint8_t".
 * @remarks The macro accesses the following registers: SYST_CSR.
 * @par Example:
 *      @code
 *      uint8_t result = SysTick_PDD_GetClkSource(deviceID);
 *      @endcode
 */
  #define SysTick_PDD_GetClkSource(PeripheralBase) ( \
      0x1U \
    )
#endif /* (defined(MCU_MK10D10)) || (defined(MCU_MK10D5)) || (defined(MCU_MK10D7)) || (defined(MCU_MK10DZ10)) || (defined(MCU_MK10F12)) || (defined(MCU_MK11D5)) || (defined(MCU_MK11D5WS)) || (defined(MCU_MK12D5)) || (defined(MCU_MK20D10)) || (defined(MCU_MK20D5)) || (defined(MCU_MK20D7)) || (defined(MCU_MK20DZ10)) || (defined(MCU_MK20F12)) || (defined(MCU_MK21D5)) || (defined(MCU_MK21D5WS)) || (defined(MCU_MK22D5)) || (defined(MCU_MK30D10)) || (defined(MCU_MK30D7)) || (defined(MCU_MK30DZ10)) || (defined(MCU_MK40D10)) || (defined(MCU_MK40D7)) || (defined(MCU_MK40DZ10)) || (defined(MCU_MK40X256VMD100)) || (defined(MCU_MK50D10)) || (defined(MCU_MK50D7)) || (defined(MCU_MK50DZ10)) || (defined(MCU_MK51D10)) || (defined(MCU_MK51D7)) || (defined(MCU_MK51DZ10)) || (defined(MCU_MK52D10)) || (defined(MCU_MK52DZ10)) || (defined(MCU_MK53D10)) || (defined(MCU_MK53DZ10)) || (defined(MCU_MK60D10)) || (defined(MCU_MK60DZ10)) || (defined(MCU_MK60F12)) || (defined(MCU_MK60F15)) || (defined(MCU_MK60N512VMD100)) || (defined(MCU_MK61F12)) || (defined(MCU_MK61F12WS)) || (defined(MCU_MK61F15)) || (defined(MCU_MK61F15WS)) || (defined(MCU_MK70F12)) || (defined(MCU_MK70F12WS)) || (defined(MCU_MK70F15)) || (defined(MCU_MK70F15WS)) || (defined(MCU_PCK20L4)) */

/* ----------------------------------------------------------------------------
   -- WriteReloadValueReg
   ---------------------------------------------------------------------------- */

/**
 * @brief Writes value to the reload register.
 * @param PeripheralBase Peripheral base address.
 * @param Value New content of the reload register. This parameter is a 32-bit
 *        value.
 * @return Returns a value of void type.
 * @remarks The macro accesses the following registers: SYST_RVR.
 * @par Example:
 *      @code
 *      SysTick_PDD_WriteReloadValueReg(deviceID, 1);
 *      @endcode
 */
#define SysTick_PDD_WriteReloadValueReg(PeripheralBase, Value) ( \
    SysTick_RVR_REG(PeripheralBase) = \
     (uint32_t)(Value) \
  )

/* ----------------------------------------------------------------------------
   -- ReadReloadValueReg
   ---------------------------------------------------------------------------- */

/**
 * @brief Returns the content of the reload register.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a 32-bit value.
 * @remarks The macro accesses the following registers: SYST_RVR.
 * @par Example:
 *      @code
 *      uint32_t result = SysTick_PDD_ReadReloadValueReg(deviceID);
 *      @endcode
 */
#define SysTick_PDD_ReadReloadValueReg(PeripheralBase) ( \
    SysTick_RVR_REG(PeripheralBase) \
  )

/* ----------------------------------------------------------------------------
   -- ReadCurrentValueReg
   ---------------------------------------------------------------------------- */

/**
 * @brief Returns the content of the current value register.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a 32-bit value.
 * @remarks The macro accesses the following registers: SYST_CVR.
 * @par Example:
 *      @code
 *      uint32_t result = SysTick_PDD_ReadCurrentValueReg(deviceID);
 *      @endcode
 */
#define SysTick_PDD_ReadCurrentValueReg(PeripheralBase) ( \
    SysTick_CVR_REG(PeripheralBase) \
  )

/* ----------------------------------------------------------------------------
   -- ReadCalibrationReg
   ---------------------------------------------------------------------------- */

/**
 * @brief Returns the content of the calibration register.
 * @param PeripheralBase Peripheral base address.
 * @return Returns a 32-bit value.
 * @remarks The macro accesses the following registers: SYST_CALIB.
 * @par Example:
 *      @code
 *      uint32_t result = SysTick_PDD_ReadCalibrationReg(deviceID);
 *      @endcode
 */
#define SysTick_PDD_ReadCalibrationReg(PeripheralBase) ( \
    SysTick_CALIB_REG(PeripheralBase) \
  )
#endif  /* #if defined(SysTick_PDD_H_) */

/* SysTick_PDD.h, eof. */
