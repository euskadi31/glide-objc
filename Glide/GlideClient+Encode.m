//
//  GlideClient+Encode.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Encode.h"

@implementation GlideClient (Encode)

- (void) setQuality:(NSUInteger)value {
    if (value > 100) {
        value = 100;
    }
    
    [self.queries setObject:[NSString stringWithFormat:@"%ld", (long)value] forKey:@"q"];
}

- (void) setFormat:(GlideFormatType)type {
    NSString* format = @"";
    
    switch (type) {
        case GlideFormatJpg:
            format = @"jpg";
            break;
        case GlideFormatPjpg:
            format = @"pjpg";
            break;
        case GlideFormatPng:
            format = @"png";
            break;
        case GlideFormatGif:
            format = @"gif";
            break;
    }
    
    [self.queries setObject:format forKey:@"fm"];
}

@end
