//
//  GlideClient+GlideCrop.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Crop.h"

@implementation GlideClient (Crop)

- (void) setCropWithWidth:(NSUInteger)width height:(NSUInteger)height x:(NSUInteger)x y:(NSUInteger)y {
    [self.queries setObject:[NSString stringWithFormat:@"%lu,%lu,%lu,%lu",
                             (unsigned long)width,
                             (unsigned long)height,
                             (unsigned long)x,
                             (unsigned long)y
                             ] forKey:@"crop"];
}

@end
