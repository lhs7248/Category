//
//  NSString+DES.m
//  FoundationCategory
//
//  Created by lhs7248 on 16/12/22.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

#import "NSString+DES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (DES)

const Byte iv[] = {1,2,3,4,5,6,7,8};

//Des加密
+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key
{
    
    NSString *ciphertext = nil;
    NSData *textData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    NSUInteger bufferSize=([textData length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
//    unsigned char buffer[bufferSize];
//    memset(buffer, 0, sizeof(char));
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [textData bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        
        ciphertext = [[NSString alloc]initWithData:[data base64EncodedDataWithOptions:0] encoding:NSUTF8StringEncoding];
        
        
    }
    return ciphertext;
}



//Des解密
+(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key
{
    NSString *plaintext = nil;
    
    
    NSData * cipherdata = [[NSData alloc]initWithBase64EncodedData:[cipherText dataUsingEncoding:NSUTF8StringEncoding] options:0];
    NSUInteger bufferSize=([cipherdata length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
//    unsigned char buffer[bufferSize];
//    memset(buffer, 0, sizeof(char));
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [cipherdata bytes], [cipherdata length],
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if(cryptStatus == kCCSuccess)
    {
        NSData *plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plaintext = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
    }
    return plaintext;
}

@end
