//
//  GlideClient+GlideSize.h
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

typedef NS_ENUM(NSInteger, GlideFitType) {
    GlideFitContain,
    GlideFitMax,
    GlideFitFill,
    GlideFitStretch,
    GlideCrop,
    GlideFitCropTopLeft,
    GlideFitCropTop,
    GlideFitCropTopRight,
    GlideFitCropLeft,
    GlideFitCropCenter,
    GlideFitCropRight,
    GlideFitCropBottomLeft,
    GlideFitCropBottom,
    GlideFitCropBottomRight
};

@interface GlideClient (Size)

- (void) setWidth:(NSUInteger)width andHeight:(NSUInteger)height;

- (void) setWidth:(NSUInteger)width;

- (void) setHeight:(NSUInteger)height;

- (void) setFit:(NSString*)fit;

- (void) setFitWithPosition:(GlideFitType)type;

- (void) setFitWithPoint:(NSUInteger)x andY:(NSUInteger)y;

@end


