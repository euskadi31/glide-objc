//
//  GlideClient+GlideSize.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Size.h"

@implementation GlideClient (Size)


- (void) setWidth:(NSUInteger)width andHeight:(NSUInteger)height {
    [self setWidth:width];
    [self setHeight:height];
}

- (void) setWidth:(NSUInteger)width {
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (unsigned long)width] forKey:@"w"];
}

- (void) setHeight:(NSUInteger)height {
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (unsigned long)height] forKey:@"h"];
}

- (void) setFit:(nonnull NSString*)fit {
    [self.queries setObject:fit forKey:@"fit"];
}

- (void) setFitWithPosition:(GlideFitType)type {
    NSString* fit = @"";
    
    switch (type) {
        case GlideFitContain:
            fit = @"contain";
            break;
        case GlideFitMax:
            fit = @"max";
            break;
        case GlideFitFill:
            fit = @"fill";
            break;
        case GlideFitStretch:
            fit = @"stretch";
            break;
        case GlideCrop:
            fit = @"crop";
            break;
        case GlideFitCropTopLeft:
            fit = @"crop-top-left";
            break;
        case GlideFitCropTop:
            fit = @"crop-top";
            break;
        case GlideFitCropTopRight:
            fit = @"crop-top-right";
            break;
        case GlideFitCropLeft:
            fit = @"crop-left";
            break;
        case GlideFitCropCenter:
            fit = @"crop-center";
            break;
        case GlideFitCropRight:
            fit = @"crop-right";
            break;
        case GlideFitCropBottomLeft:
            fit = @"crop-bottom-left";
            break;
        case GlideFitCropBottom:
            fit = @"crop-bottom";
            break;
        case GlideFitCropBottomRight:
            fit = @"crop-bottom-right";
            break;
    }
    
    [self.queries setObject:fit forKey:@"fit"];
}

- (void) setFitWithPoint:(NSUInteger)x andY:(NSUInteger)y {
    [self.queries setObject:[NSString stringWithFormat:@"crop-%lu-%lu",
                             (unsigned long)x,
                             (unsigned long)y
                             ] forKey:@"fit"];
}

@end
