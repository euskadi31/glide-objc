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
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), digest);
    
    NSMutableString *md5 = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5 appendFormat: @"%02x", (int)digest[i]];
    }
    
    return [md5 lowercaseString];
}

@end
