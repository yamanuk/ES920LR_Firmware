/*!
* Copyright (c) 2014, Freescale Semiconductor, Inc.
* All rights reserved.
*
* \file SecLibAes.c
* This is the source file for the security module that implements AES.
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

#include "mmcau_interface.h"
#include "MemManager.h"
#include "FunctionLib.h"
#include "SecLibAes.h"

#define AES_BLOCK_SIZE  16

typedef union _uuint128_tag
{
    uint8_t  u8[16];
    uint64_t u64[2];
} uuint128_t;

static void AES_128_IncrementCounter(uint8_t* ctr);

static void AES_128_CMAC_Generate_Subkey(uint8_t *key, 
                                         uint8_t *K1, 
                                         uint8_t *K2);

static void SecLib_LeftShiftOneBit(uint8_t *input, 
                                   uint8_t *output);

static void SecLib_Padding(uint8_t *lastb, 
                           uint8_t *pad, 
                           uint32_t length);

static void SecLib_Xor128(uint8_t *a, 
                          uint8_t *b, 
                          uint8_t *out);

/*! *********************************************************************************
* \brief  This function performs AES-128 encryption on a 16-byte block.
*
* \param[in]  pInput Pointer to the location of the 16-byte plain text block.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the 16-byte ciphered output.
*
* \pre All Input/Output pointers must refer to a memory address alligned to 4 bytes!
*
********************************************************************************** */
void AES_128_Encrypt(const uint8_t* pInput,
                     const uint8_t* pKey,
                     uint8_t* pOutput)
{
#if gMMCAU_Support_d
    uint8_t key_expansion[44*4];
    uint8_t alignedIn[AES_BLOCK_SIZE];
    uint8_t alignedOut[AES_BLOCK_SIZE];
    uint8_t* pIn;
    uint8_t* pOut;

    /* Check if pKey is 4 bytes aligned */
    if ((uint32_t)pKey & 0x00000003)
    {
        FLib_MemCpyAligned32bit((uint8_t*)pKey, alignedIn , sizeof(alignedIn));
        pIn = alignedIn;
    }
    else
        pIn = (uint8_t*)pKey;

    /* Expand Key */
    mmcau_aes_set_key(pIn, AES128, key_expansion);

    /* Check if pData is 4 bytes aligned */
    if ((uint32_t)pInput & 0x00000003)
    {
        FLib_MemCpyAligned32bit((uint8_t*)pInput, alignedIn , sizeof(alignedIn));
        pIn = alignedIn;
    }
    else
        pIn = (uint8_t*)pInput;

    /* Check if pReturnData is 4 bytes aligned */
    if ((uint32_t)pOutput & 0x00000003)
        pOut = alignedOut;
    else
        pOut = pOutput;

    /* Encrypt data */
    mmcau_aes_encrypt(pIn, key_expansion, AES128_ROUNDS, pOut);

    if (pOut == alignedOut)
        FLib_MemCpyAligned32bit(alignedOut, pOutput, sizeof(alignedOut));

#else
    sw_Aes128(pInput, pKey, pOutput);
#endif
}

/*! *********************************************************************************
* \brief  This function performs AES-128 decryption on a 16-byte block.
*
* \param[in]  pInput Pointer to the location of the 16-byte plain text block.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the 16-byte ciphered output.
*
* \pre All Input/Output pointers must refer to a memory address alligned to 4 bytes!
*
********************************************************************************** */
void AES_128_Decrypt(const uint8_t* pInput,
                     const uint8_t* pKey,
                     uint8_t* pOutput)
{
#if gMMCAU_Support_d  
    uint8_t key_expansion[44*4];
    uint8_t alignedIn[AES_BLOCK_SIZE];
    uint8_t alignedOut[AES_BLOCK_SIZE];
    uint8_t* pIn;
    uint8_t* pOut;
    
    /* Check if pKey is 4 bytes aligned */
    if ((uint32_t)pKey & 0x00000003) 
    {
        FLib_MemCpyAligned32bit((uint8_t*)pKey, alignedIn , sizeof(alignedIn));
        pIn = alignedIn;
    }
    else
        pIn = (uint8_t*)pKey;
    
    /* Expand Key */  
    mmcau_aes_set_key(pIn, AES128, key_expansion);
    
    /* Check if pData is 4 bytes aligned */
    if ((uint32_t)pInput & 0x00000003) 
    {
        FLib_MemCpyAligned32bit((uint8_t*)pInput, alignedIn , sizeof(alignedIn));
        pIn = alignedIn;
    }
    else
        pIn = (uint8_t*)pInput;
    
    /* Check if pReturnData is 4 bytes aligned */
    if ((uint32_t)pOutput & 0x00000003) 
        pOut = alignedOut;
    else
        pOut = pOutput;
    
    /* Decrypt data */
    mmcau_aes_decrypt(pIn, key_expansion, AES128_ROUNDS, pOut);
    
    if (pOut == alignedOut)
        FLib_MemCpyAligned32bit(alignedOut, pOutput, sizeof(alignedOut));
    
#else /* gMMCAU_Support_d */
#warning No AES_128_Decrypt function
#endif /* gMMCAU_Support_d */
}

/*! *********************************************************************************
* \brief  This function performs AES-128-ECB encryption on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  inputLen Input message length in bytes.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the ciphered output.
*
* \pre All Input/Output pointers must refer to a memory address alligned to 4 bytes!
*
********************************************************************************** */
void AES_128_ECB_Encrypt(uint8_t* pInput, 
                         uint32_t inputLen, 
                         uint8_t* pKey, 
                         uint8_t* pOutput)
{
    uint8_t tempBuffIn[AES_BLOCK_SIZE] = {0};
    uint8_t tempBuffOut[AES_BLOCK_SIZE] = {0};

    /* If remaining data bigger than one AES block size */
    while( inputLen > AES_BLOCK_SIZE )
    {
        AES_128_Encrypt(pInput, pKey, pOutput);
        pInput += AES_BLOCK_SIZE;
        pOutput += AES_BLOCK_SIZE;
        inputLen -= AES_BLOCK_SIZE;
    }

    /* If remaining data is smaller then one AES block size */    
    FLib_MemCpy(tempBuffIn, pInput, inputLen);
    AES_128_Encrypt(tempBuffIn, pKey, tempBuffOut);
    FLib_MemCpy(pOutput, tempBuffOut, inputLen);
}

/*! *********************************************************************************
* \brief  This function performs AES-128-ECB encryption on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  numBlocks Input message number of 16-byte blocks.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the ciphered output.
*
* \pre All Input/Output pointers must refer to a memory address alligned to 4 bytes!
*
********************************************************************************** */
void AES_128_ECB_Block_Encrypt(uint8_t* pInput,
                               uint32_t numBlocks,
                               const uint8_t* pKey,
                               uint8_t* pOutput)
{   
    while( numBlocks )
    {
        AES_128_Encrypt(pInput, pKey, pOutput);
        numBlocks--;
        pInput += AES_BLOCK_SIZE;
        pOutput += AES_BLOCK_SIZE;
    }
}

/*! *********************************************************************************
* \brief  This function performs AES-128-CBC encryption on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  inputLen Input message length in bytes.
*
* \param[in]  pInitVector Pointer to the location of the 128-bit initialization vector.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the ciphered output.
*
********************************************************************************** */
void AES_128_CBC_Encrypt(uint8_t* pInput, 
                         uint32_t inputLen,
                         uint8_t* pInitVector, 
                         uint8_t* pKey, 
                         uint8_t* pOutput)
{
    static uint8_t tempBuffIn[AES_BLOCK_SIZE] = {0};
    uint8_t tempBuffOut[AES_BLOCK_SIZE] = {0};

    if( pInitVector != NULL )
    {
        FLib_MemCpy(tempBuffIn, pInitVector, AES_BLOCK_SIZE);
    }

    /* If remaining data is bigger than one AES block size */
    while( inputLen > AES_BLOCK_SIZE )
    {
        SecLib_XorN(tempBuffIn, pInput, AES_BLOCK_SIZE);
        AES_128_Encrypt(tempBuffIn, pKey, pOutput);
        FLib_MemCpy(tempBuffIn, pOutput, AES_BLOCK_SIZE);
        pInput += AES_BLOCK_SIZE;
        pOutput += AES_BLOCK_SIZE;
        inputLen -= AES_BLOCK_SIZE;
    }

    /* If remaining data is smaller then one AES block size  */
    SecLib_XorN(tempBuffIn, pInput, inputLen);
    AES_128_Encrypt(tempBuffIn, pKey, tempBuffOut);
    FLib_MemCpy(tempBuffIn, tempBuffOut, AES_BLOCK_SIZE);
    FLib_MemCpy(pOutput, tempBuffOut, inputLen);
}

/*! *********************************************************************************
* \brief  This function performs AES-128-CTR encryption on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  inputLen Input message length in bytes.
*
* \param[in]  pCounter Pointer to the location of the 128-bit counter.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the ciphered output.
*
********************************************************************************** */
void AES_128_CTR(uint8_t* pInput, 
                 uint32_t inputLen,
                 uint8_t* pCounter, 
                 uint8_t* pKey, 
                 uint8_t* pOutput)
{
    uint8_t tempBuffIn[AES_BLOCK_SIZE] = {0};
    uint8_t encrCtr[AES_BLOCK_SIZE] = {0};

    /* If remaining data bigger than one AES block size */
    while( inputLen > AES_BLOCK_SIZE )
    {
        FLib_MemCpy(tempBuffIn, pInput, AES_BLOCK_SIZE);
        AES_128_Encrypt(pCounter, pKey, encrCtr);
        SecLib_XorN(tempBuffIn, encrCtr, AES_BLOCK_SIZE);
        FLib_MemCpy(pOutput, tempBuffIn, AES_BLOCK_SIZE);
        pInput += AES_BLOCK_SIZE;
        pOutput += AES_BLOCK_SIZE;
        inputLen -= AES_BLOCK_SIZE;
        AES_128_IncrementCounter(pCounter);
    }

    /* If remaining data is smaller then one AES block size  */
    FLib_MemCpy(tempBuffIn, pInput, inputLen);
    AES_128_Encrypt(pCounter, pKey, encrCtr);
    SecLib_XorN(tempBuffIn, encrCtr, AES_BLOCK_SIZE);
    FLib_MemCpy(pOutput, tempBuffIn, inputLen);
    AES_128_IncrementCounter(pCounter);
}

/*! *********************************************************************************
* \brief  This function performs AES-128-OFB encryption on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  inputLen Input message length in bytes.
*
* \param[in]  pInitVector Pointer to the location of the 128-bit initialization vector.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the ciphered output.
*
********************************************************************************** */
void AES_128_OFB(uint8_t* pInput, 
                 uint32_t inputLen,
                 uint8_t* pInitVector, 
                 uint8_t* pKey, 
                 uint8_t* pOutput)
{
    uint8_t tempBuffIn[AES_BLOCK_SIZE] = {0};
    uint8_t tempBuffOut[AES_BLOCK_SIZE] = {0};

    if( pInitVector != NULL )
    {
        FLib_MemCpy(tempBuffIn, pInitVector, AES_BLOCK_SIZE);
    }

    /* If remaining data is bigger than one AES block size */
    while( inputLen > AES_BLOCK_SIZE )
    {
        AES_128_Encrypt(tempBuffIn, pKey, tempBuffOut);
        FLib_MemCpy(tempBuffIn, tempBuffOut, AES_BLOCK_SIZE);
        SecLib_XorN(tempBuffOut, pInput, AES_BLOCK_SIZE);        
        FLib_MemCpy(pOutput, tempBuffOut, AES_BLOCK_SIZE);
        pInput += AES_BLOCK_SIZE;
        pOutput += AES_BLOCK_SIZE;
        inputLen -= AES_BLOCK_SIZE;
    }

    /* If remaining data is smaller then one AES block size  */
    AES_128_Encrypt(tempBuffIn, pKey, tempBuffOut);
    FLib_MemCpy(tempBuffIn, tempBuffOut, AES_BLOCK_SIZE);
    SecLib_XorN(tempBuffOut, pInput, inputLen);    
    FLib_MemCpy(pOutput, tempBuffOut, inputLen);
}

/*! *********************************************************************************
* \brief  This function performs AES-128-CMAC on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  inputLen Length of the input message in bytes.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the 16-byte authentication code.
*
* \remarks This is public open source code! Terms of use must be checked before use!
*
********************************************************************************** */
void AES_128_CMAC(uint8_t* pInput, 
                  uint32_t inputLen, 
                  uint8_t* pKey, 
                  uint8_t* pOutput)
{
    uint8_t X[16];
    uint8_t Y[16];
    uint8_t M_last[16];
    uint8_t padded[16];
    
    uint8_t K1[16];
    uint8_t K2[16];
    
    uint8_t n;
    uint32_t i;
    uint8_t flag;
    
    AES_128_CMAC_Generate_Subkey(pKey, K1, K2);

    n = (uint8_t) ((inputLen + 15) / 16); /* n is number of rounds */

    if (n == 0) {
        n = 1;
        flag = 0;
    } else {
        if ((inputLen % 16) == 0) { /* last block is a complete block */
            flag = 1;
        } else { /* last block is not complete block */
            flag = 0;
        }
    }

    if (flag) { /* last block is complete block */
        SecLib_Xor128(&pInput[16 * (n - 1)], K1, M_last);
    } else {
        SecLib_Padding(&pInput[16 * (n - 1)], padded, inputLen % 16);
        SecLib_Xor128(padded, K2, M_last);
    }

    for (i = 0; i < 16; i++)
        X[i] = 0;
    for (i = 0; i < n - 1; i++) {
        SecLib_Xor128(X, &pInput[16 * i], Y); /* Y := Mi (+) X  */
        AES_128_Encrypt(Y, pKey, X); /* X := AES-128(KEY, Y); */
    }

    SecLib_Xor128(X, M_last, Y);
    AES_128_Encrypt(Y, pKey, X);

    for (i = 0; i < 16; i++) {
        pOutput[i] = X[i];
    }
}

/*! *********************************************************************************
* \brief  This function performs AES-128-EAX encryption on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  inputLen Length of the input message in bytes.
*
* \param[in]  pNonce Pointer to the location of the nonce.
*
* \param[in]  nonceLen Nonce length in bytes.
*
* \param[in]  pHeader Pointer to the location of header.
*
* \param[in]  headerLen Header length in bytes.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the 16-byte authentication code.
*
* \param[out]  pTag Pointer to the location to store the 128-bit tag.
*
********************************************************************************** */
secResultType_t AES_128_EAX_Encrypt(uint8_t* pInput, 
                                    uint32_t inputLen,
                                    uint8_t* pNonce,
                                    uint32_t nonceLen,
                                    uint8_t* pHeader,
                                    uint8_t headerLen, 
                                    uint8_t* pKey, 
                                    uint8_t* pOutput,
                                    uint8_t* pTag)
{
    uint8_t *buf;
    uint32_t buf_len;
    uint8_t nonce_mac[AES_BLOCK_SIZE];
    uint8_t hdr_mac[AES_BLOCK_SIZE];
    uint8_t data_mac[AES_BLOCK_SIZE];
    uint8_t tempBuff[AES_BLOCK_SIZE];
    uint32_t i;

    if( nonceLen > inputLen )
    {
        buf_len = nonceLen;
    }
    else
    {
        buf_len = inputLen;
    }

    if( headerLen > buf_len )
    {
        buf_len = headerLen;
    }

    buf_len += 16U;

    buf = MEM_BufferAlloc(buf_len);

    if( buf == NULL )
        return gSecAllocError_c;

    FLib_MemSet(buf, 0, 15);

    buf[15] = 0;
    FLib_MemCpy((buf + 16), pNonce, nonceLen);
    AES_128_CMAC(buf, 16 + nonceLen, pKey, nonce_mac);

    buf[15] = 1;
    FLib_MemCpy((buf + 16), pHeader, headerLen);
    AES_128_CMAC(buf, 16 + headerLen, pKey, hdr_mac);

    /* keep the original value of nonce_mac, because AES_128_CTR will increment it */
    FLib_MemCpy(tempBuff, nonce_mac, nonceLen);

    AES_128_CTR(pInput, inputLen, tempBuff, pKey, pOutput);

    buf[15] = 2;
    FLib_MemCpy((buf + 16), pOutput, inputLen);
    AES_128_CMAC(buf, 16 + inputLen, pKey, data_mac);

    for (i = 0; i < AES_BLOCK_SIZE; i++)
        pTag[i] = nonce_mac[i] ^ data_mac[i] ^ hdr_mac[i];

    MEM_BufferFree(buf);

    return gSecSuccess_c;    
}

/*! *********************************************************************************
* \brief  This function performs AES-128-EAX decryption on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  inputLen Length of the input message in bytes.
*
* \param[in]  pNonce Pointer to the location of the nonce.
*
* \param[in]  nonceLen Nonce length in bytes.
*
* \param[in]  pHeader Pointer to the location of header.
*
* \param[in]  headerLen Header length in bytes.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the 16-byte authentication code.
*
* \param[out]  pTag Pointer to the location to store the 128-bit tag.
*
********************************************************************************** */
secResultType_t AES_128_EAX_Decrypt(uint8_t* pInput, 
                                    uint32_t inputLen,
                                    uint8_t* pNonce,
                                    uint32_t nonceLen,
                                    uint8_t* pHeader,
                                    uint8_t headerLen, 
                                    uint8_t* pKey, 
                                    uint8_t* pOutput,
                                    uint8_t* pTag)
{
    uint8_t *buf;
    uint32_t buf_len;
    uint8_t nonce_mac[AES_BLOCK_SIZE];
    uint8_t hdr_mac[AES_BLOCK_SIZE];
    uint8_t data_mac[AES_BLOCK_SIZE];
    uint32_t i;

    if( nonceLen > inputLen )
    {
        buf_len = nonceLen;
    }
    else
    {
        buf_len = inputLen;
    }
        
    if( headerLen > buf_len )
    {
        buf_len = headerLen;
    }
        
    buf_len += 16U;

    buf = MEM_BufferAlloc(buf_len);
    if( buf == NULL )
        return gSecAllocError_c;

    FLib_MemSet(buf, 0, 15);

    buf[15] = 0;
    FLib_MemCpy((buf + 16), pNonce, nonceLen);
    AES_128_CMAC(buf, 16 + nonceLen, pKey, nonce_mac);

    buf[15] = 1;
    FLib_MemCpy((buf + 16), pHeader, headerLen);
    AES_128_CMAC(buf, 16 + headerLen, pKey, hdr_mac);

    buf[15] = 2;
    FLib_MemCpy((buf + 16), pInput, inputLen);
    AES_128_CMAC(buf, 16 + inputLen, pKey, data_mac);

    MEM_BufferFree(buf);

    for (i = 0; i < AES_BLOCK_SIZE; i++)
    {
        if (pTag[i] != (nonce_mac[i] ^ data_mac[i] ^ hdr_mac[i]))
            return gSecError_c;
    }

    AES_128_CTR(pInput, inputLen, nonce_mac, pKey, pOutput);

    return gSecSuccess_c;
}
                               
/*! *********************************************************************************
* \brief  This function performs AES-128-EAX decryption on a message block.
*
* \param[in]  pInput Pointer to the location of the input message.
*
* \param[in]  inputLen Length of the input message in bytes.
*
* \param[in]  pInitVector Pointer to the location of the 128-bit initialization vector.
*
* \param[in]  pCounter Pointer to the location of the 128-bit counter.
*
* \param[in]  pKey Pointer to the location of the 128-bit key.
*
* \param[out]  pOutput Pointer to the location to store the 16-byte authentication code.
*
* \param[out]  pOutCbcMac Pointer to the location to store the authentication code.
*
********************************************************************************** */                                    
void AES_128_CCM(uint8_t* pInput, 
                 uint32_t inputLen,
                 uint8_t* pInitVector,
                 uint8_t* pCounter, 
                 uint8_t* pKey, 
                 uint8_t* pOutput,
                 uint8_t* pOutCbcMac)
{
    uint8_t tempBuffIn[AES_BLOCK_SIZE] = {0};
    uint8_t tempBuffOut[AES_BLOCK_SIZE] = {0};

    /* Compute Encrypted Data */
    AES_128_CTR(pInput, inputLen, pCounter, pKey, pOutput);

    /* Compute CBC MAC */
    if( inputLen > AES_BLOCK_SIZE )
    {
        AES_128_CBC_Encrypt(pInput, AES_BLOCK_SIZE, pInitVector, pKey, tempBuffOut);
        
        pInput += AES_BLOCK_SIZE;
        inputLen -= AES_BLOCK_SIZE;

        /* If remaining data is bigger than one AES block size */
        while( inputLen > AES_BLOCK_SIZE )
        {
            AES_128_CBC_Encrypt(pInput, AES_BLOCK_SIZE, NULL, pKey, pOutCbcMac);

            pInput += AES_BLOCK_SIZE;
            inputLen -= AES_BLOCK_SIZE;
        }

        AES_128_CBC_Encrypt(pInput, inputLen, NULL, pKey, pOutCbcMac);
    }
    else
    {
        FLib_MemCpy(tempBuffIn, pInput, inputLen);
        AES_128_CBC_Encrypt(tempBuffIn, AES_BLOCK_SIZE, pInitVector, pKey, pOutCbcMac);
    }
}

/*! *********************************************************************************
* \brief  This function calculates XOR of individual byte pairs in two uint8_t arrays.
*         pDst[i] := pDst[i] ^ pSrc[i] for i=0 to n-1
*
* \param[in, out]  pDst First byte array operand for XOR and destination byte array
*
* \param[in]  pSrc Second byte array operand for XOR
*
* \param[in]  n  Length of the byte arrays which will be XORed
*
********************************************************************************** */
void SecLib_XorN(uint8_t* pDst,
                 uint8_t* pSrc,
                 uint8_t n)
{
    while( n ) 
    {
        *pDst = *pDst ^ *pSrc;
        pDst = pDst + 1;
        pSrc = pSrc + 1;
        n--;
    }
}
                             
/* Private functions */

/*!*************************************************************************************************
* \brief  Increments the value of a given counter vector.
*
* \param [in/out]     ctr         Counter.
* 
* \remarks
* 
****************************************************************************************************/
static void AES_128_IncrementCounter(uint8_t* ctr)
{
    uint32_t i;
    uint64_t tempLow;
    uuint128_t tempCtr;

    for(i=0;i<AES_BLOCK_SIZE;i++)
    {
        tempCtr.u8[AES_BLOCK_SIZE-i-1] = ctr[i];
    }

    tempLow = tempCtr.u64[0];
    tempCtr.u64[0]++;

    if(tempLow > tempCtr.u64[0]) tempCtr.u64[1]++;

    for(i=0;i<AES_BLOCK_SIZE;i++)
    {
        ctr[i] = tempCtr.u8[AES_BLOCK_SIZE-i-1];
    }    
}

/*! *********************************************************************************
* \brief  Generates the two subkeys that correspond two an AES key
*
* \param [in]    key        AES Key.
*
* \param [out]   K1         First subkey.
*
* \param [out]   K2         Second subkey.
*
* \remarks   This is public open source code! Terms of use must be checked before use!
* 
********************************************************************************** */
static void AES_128_CMAC_Generate_Subkey(uint8_t *key,
                                         uint8_t *K1,
                                         uint8_t *K2)
{
    uint8_t const_Rb[16] = {0x00, 0x00, 0x00, 0x00, 
                            0x00, 0x00, 0x00, 0x00, 
                            0x00, 0x00, 0x00, 0x00, 
                            0x00, 0x00, 0x00, 0x87};
    uint8_t L[16];
    uint8_t Z[16];
    uint8_t tmp[16];
    uint32_t i;

    for ( i=0; i<16; i++ ) Z[i] = 0;

    AES_128_Encrypt(Z,key,L);

    if ( (L[0] & 0x80) == 0 ) 
    { 
        /* If MSB(L) = 0, then K1 = L << 1 */
        SecLib_LeftShiftOneBit(L,K1);
    }
    else 
    {    
        /* Else K1 = ( L << 1 ) (+) Rb */
        SecLib_LeftShiftOneBit(L,tmp);
        SecLib_Xor128(tmp,const_Rb,K1);
    }

    if ( (K1[0] & 0x80) == 0 ) 
    {
        SecLib_LeftShiftOneBit(K1,K2);
    } 
    else 
    {
        SecLib_LeftShiftOneBit(K1,tmp);
        SecLib_Xor128(tmp,const_Rb,K2);
    }
}

/*! *********************************************************************************
* \brief    Shifts a given vector to the left with one bit.
*
* \param [in]      input         Input vector.
*
* \param [out]     output        Output vector.
*
* \remarks   This is public open source code! Terms of use must be checked before use!
* 
********************************************************************************** */
static void SecLib_LeftShiftOneBit(uint8_t *input, 
                                   uint8_t *output)
{
    int32_t i;
    uint8_t overflow = 0;

    for ( i=15; i>=0; i-- )
    {
        output[i] = input[i] << 1;
        output[i] |= overflow;
        overflow = (input[i] & 0x80) ? 1 : 0;
    }
}

/*! *********************************************************************************
* \brief  This function pads an incomplete 16 byte block of data, where padding is the concatenation of x and a single '1',
*         followed by the minimum number of '0's, so that the total length is equal to 128 bits.
*
* \param[in, out] lastb Pointer to the last block to be padded
*
* \param[in]  pad       Padded block destination
*
* \param[in]  length    Number of bytes in the block to be padded
* 
* \remarks   This is public open source code! Terms of use must be checked before use!
* 
********************************************************************************** */
static void SecLib_Padding(uint8_t *lastb, 
                           uint8_t *pad, 
                           uint32_t length)
{
    uint32_t j;

    /* original last block */
    for ( j=0; j<16; j++ ) {
        if ( j < length ) {
            pad[j] = lastb[j];
        } else if ( j == length ) {
            pad[j] = 0x80;
        } else {
            pad[j] = 0x00;
        }
    }
}

/*! *********************************************************************************
* \brief  This function Xors 2 blocks of 128 bits and copies the result to a set destination
*
* \param [in]    a        Pointer to the first block to XOR
*
* \param [in]    b        Pointer to the second block to XOR.
*
* \param [out]   out      Destination pointer
*
* \remarks   This is public open source code! Terms of use must be checked before use!
* 
********************************************************************************** */
static void SecLib_Xor128(uint8_t *a, 
                          uint8_t *b, 
                          uint8_t *out)
{
    uint32_t i;
    
    for (i=0;i<16; i++)
    {
      out[i] = a[i] ^ b[i];
    }
}
