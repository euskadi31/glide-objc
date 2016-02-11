//
//  GlideUtils.m
//  Glide
//
//  Created by Axel Etcheverry on 11/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideUtils.h"

@implementation GlideUtils

+ (nullable NSString *)leftTrimOfString:(nonnull NSString *)string {
    NSString *first = [string substringToIndex:1];
    
    if ([first compare:@"/"] == NSOrderedSame) {
        return [string substringFromIndex:1];
    }
    
    return string;
}

+ (nullable NSString *)md5:(nonnull NSString *)value {
    const char *cstr = [value UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (uint)strlen(cstr), result);
    
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

@end
