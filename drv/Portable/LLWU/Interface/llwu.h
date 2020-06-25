/************************************************************************************
* llwu header file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
************************************************************************************/

#ifndef __LLWU_COMMON_H__
#define __LLWU_COMMON_H__

#include "MKL26Z4.h"
#include "EmbeddedTypes.h"


/*
 * Misc. Defines
 */
#define LLWU_LPTMR_ME       0x01
#define LLWU_CMP0_ME        0x02
#define LLWU_CMP1_ME        0x04
#define LLWU_CMP2_ME        0x08
#define LLWU_TSI_ME         0x10
#define LLWU_RTCA_ME        0x20
#define LLWU_RESRV_ME       0x40
#define LLWU_RTCS_ME        0x80

#define LLWU_PIN_DIS        0
#define LLWU_PIN_RISING     1
#define LLWU_PIN_FALLING    2
#define LLWU_PIN_ANY        3


/*
 * Function prototypes
 */

void llwu_configure(unsigned int pin_en, unsigned char rise_fall, unsigned char module_en);
void LLW_IRQHandler( void *param );
void llwu_configure_filter(unsigned int wu_pin_num, unsigned char filter_en, unsigned char rise_fall );

#endif /* __LLWU_COMMON_H__ */
