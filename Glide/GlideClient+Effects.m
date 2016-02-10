//
//  GlideClient+Effects.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Effects.h"

@implementation GlideClient (Effects)

- (void) setBlur:(NSUInteger)value {
    if (value > 100) {
        value = 100;
    }
    
    [self.queries setObject:[NSString stringWithFormat:@"%lu", value] forKey:@"blur"];
}

- (void) setPixelate:(NSUInteger)value {
    if (value > 1000) {
        value = 1000;
    }
    
    [self.queries setObject:[NSString stringWithFormat:@"%lu", value] forKey:@"pixel"];
}

- (void) setFilter:(GlideFilterType)type {
    NSString* filter = @"";
    
    switch (type) {
        case GlideFilterGreyscale:
            filter = @"greyscale";
            break;
        case GlideFilterSepia:
            filter = @"sepia";
            break;
    }
    
    [self.queries setObject:filter forKey:@"filt"];
}

@end
