//
//  NSString+DES.h
//  FoundationCategory
//
//  Created by lhs7248 on 16/12/22.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)

/// 加密
+(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;
//解密
+(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;
@end
