//
//  GlideClient+Border.h
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

typedef NS_ENUM(NSInteger, GlideBorderType) {
    GlideBorderOverlay,
    GlideBorderShrink,
    GlideBorderExpand
};

@interface GlideClient (Border)

- (void) setBorderWithWidth:(NSUInteger)width color:(nonnull NSString*)color andType:(GlideBorderType)type;

@end
