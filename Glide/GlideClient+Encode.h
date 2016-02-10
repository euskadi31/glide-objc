//
//  GlideClient+Encode.h
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

typedef NS_ENUM(NSInteger, GlideFormatType) {
    GlideFormatJpg,
    GlideFormatPjpg,
    GlideFormatPng,
    GlideFormatGif
};

@interface GlideClient (Encode)

- (void) setQuality:(NSUInteger)value;

- (void) setFormat:(GlideFormatType)type;

@end
