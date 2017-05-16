//
//  NSString+Base64.h
//  FoundationCategory
//
//  Created by lhs7248 on 16/12/22.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)


//base64加密
+(NSString *)base64EncodingWithData:(NSData *)sourceData;

+(NSString *)base64EncodingWithString:(NSString *)sourceStr;

// 解密
+(NSData *)base64DecodingWithString:(NSString *)sourceString;
@end
