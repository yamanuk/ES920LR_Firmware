/************************************************************************************
* lptmr header file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
************************************************************************************/

#ifndef __LPTMR_H
#define __LPTMR_H

#include "MKL26Z4.h"
#include "EmbeddedTypes.h"

#define DIV_0       1
#define DIV_512     2
#define DIV_2048    3

void LPTMR_init( int count, int mode, int clock_source );
void LPTMR_IRQHandler( void *param );

#endif
