//
//  GlideClient+GlideOrientation.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Orientation.h"

@implementation GlideClient (Orientation)


- (void) setOrientation:(GlideOrientationType)value {
    NSString* or = @"";
    
    switch (value) {
        case GlideOrientationAuto:
            or = @"auto";
            break;
        case GlideOrientation0:
            or = @"0";
            break;
        case GlideOrientation90:
            or = @"90";
            break;
        case GlideOrientation180:
            or = @"180";
            break;
        case GlideOrientation270:
            or = @"270";
            break;
    }

    [self.queries setObject:or forKey:@"or"];
}


@end
