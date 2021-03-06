/*****************************************************************************
* Menus header file.
*
* (c) Copyright 2016, EASEL, Inc.  All rights reserved.
*
* No part of this document may be reproduced in any form - including copied,
* transcribed, printed or by any electronic means - without specific written
* permission from EASEL.
*
*****************************************************************************/
#ifndef _MENUS_H_
#define _MENUS_H_


/************************************************************************************
*************************************************************************************
* Public memory declarations
*************************************************************************************
************************************************************************************/


/************************************************************************************
*************************************************************************************
* Module macros
*************************************************************************************
************************************************************************************/

#define isAsciiHex(Data) (((Data >= '0') && (Data <= '9')) \
                       || ((Data >= 'A') && (Data <= 'F')) \
                       || ((Data >= 'a') && (Data <= 'f')))

#define AsciiToHex(ascii) ( ('a' <= ascii) ? (ascii - 'a' + 10) : (('A' <= ascii) ? (ascii - 'A' + 10) : (ascii - '0')) )

#define isAsciiDec(Data) ((Data >= '0') && (Data <= '9'))

#define AsciiToDec(ascii) (ascii - '0')


/************************************************************************************
*************************************************************************************
* Module type definitions
*************************************************************************************
************************************************************************************/


/************************************************************************************
*************************************************************************************
* Interface functions prototypes
*************************************************************************************
************************************************************************************/

void DoConfiguration( void );
void CommRxCallBack( void* );


#endif /* _MENUS_H_ */
