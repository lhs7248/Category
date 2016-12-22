//
//  NSString+RC4.m
//  FoundationCategory
//
//  Created by lhs7248 on 16/12/22.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

#import "NSString+RC4.h"

@implementation NSString (RC4)

+(NSString*) rc4Key:(NSString*) key str:(NSString*) str
{
    if (key.length==0 || str.length == 0) {
        return nil;
    }
    int j = 0;
    unichar res[str.length];
    const unichar* buffer = res;
    unsigned char s[256];
    for (int i = 0; i < 256; i++)
    {
        s[i] = i;
    }
    for (int i = 0; i < 256; i++)
    {
        j = (j + s[i] + [key characterAtIndex:(i % key.length)]) % 256;
        unsigned char tempVar; // make a temporary variable
        tempVar = s[i];
        s[i] = s[j];
        s[j] = tempVar;
    }
    
    int i = j = 0;
    
    for (int y = 0; y < str.length; y++)
    {
        i = (i + 1) % 256;
        j = (j + s[i]) % 256;
        //swap(s[i], s[j]);
        unsigned char tempVar; // make a temporary variable
        tempVar = s[i];
        s[i] = s[j];
        s[j] = tempVar;
        unsigned char f = [str characterAtIndex:y] ^ s[ (s[i] + s[j]) % 256];
        res[y] = f;
    }
    return [NSString stringWithCharacters:buffer length:str.length];
}
@end
