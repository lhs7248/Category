//
//  NSString+Base64.m
//  FoundationCategory
//
//  Created by lhs7248 on 16/12/22.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)


//base64加密
+(NSString *)base64EncodingWithData:(NSData *)sourceData{
    if (!sourceData) {
        //如果sourceData则返回nil，不进行加密。
        return nil;
    }
    NSString *resultString = [sourceData base64EncodedStringWithOptions:
                              0];
    return resultString;
}


+(NSString *)base64EncodingWithString:(NSString *)sourceStr{
    if (sourceStr.length) {
        
        NSData * data = [sourceStr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSString * resultEncodeStr = [data base64EncodedStringWithOptions:0];
        return resultEncodeStr;
    }
    
    return nil;
}



//***base64解密***
+(NSData *)base64DecodingWithString:(NSString *)sourceString{
    if (!sourceString) {
        return nil;//如果sourceString则返回nil，不进行解密。
    }
    NSData *resultData = [[NSData alloc]initWithBase64EncodedString:sourceString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return resultData;
}

@end
