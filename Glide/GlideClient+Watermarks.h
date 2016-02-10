//
//  GlideClient+Watermarks.h
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

typedef NS_ENUM(NSInteger, GlideMarkFitType) {
    GlideMarkFitContain,
    GlideMarkFitMax,
    GlideMarkFitFill,
    GlideMarkFitStretch,
    GlideMarkFitCrop
};

typedef NS_ENUM(NSInteger, GlideMarkPosType) {
    GlideMarkPosTopLeft,
    GlideMarkPosTop,
    GlideMarkPosTopRight,
    GlideMarkPosLeft,
    GlideMarkPosCenter,
    GlideMarkPosRight,
    GlideMarkPosBottomLeft,
    GlideMarkPosBottom,
    GlideMarkPosBottomRight
};

@interface GlideClient (Watermarks)

- (void) setMarkPath:(NSString*)path;

- (void) setMarkWidth:(NSUInteger)width;

- (void) setMarkHeight:(NSUInteger)height;

- (void) setMarkFit:(GlideMarkFitType)type;

- (void) setMarkX:(NSUInteger)pixel;

- (void) setMarkY:(NSUInteger)pixel;

- (void) setMarkPadding:(NSUInteger)pixel;

- (void) setMarkPosition:(GlideMarkPosType)pos;

@end


