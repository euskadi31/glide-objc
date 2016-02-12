//
//  GlideClient+PixelDensity.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+PixelDensity.h"
#import <math.h>

@implementation GlideClient (PixelDensity)

- (void) setDpr:(float)dpr {
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (NSUInteger) roundf(dpr)] forKey:@"dpr"];
}

@end
