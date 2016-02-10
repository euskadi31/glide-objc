//
//  GlideClient+Effects.h
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

typedef NS_ENUM(NSInteger, GlideFilterType) {
    GlideFilterGreyscale,
    GlideFilterSepia
};

@interface GlideClient (Effects)

- (void) setBlur:(NSUInteger)value;

- (void) setPixelate:(NSUInteger)value;

- (void) setFilter:(GlideFilterType)type;

@end
