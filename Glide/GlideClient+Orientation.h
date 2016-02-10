//
//  GlideClient+GlideOrientation.h
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

typedef NS_ENUM(NSInteger, GlideOrientationType) {
    GlideOrientationAuto,
    GlideOrientation0,
    GlideOrientation90,
    GlideOrientation180,
    GlideOrientation270
};

@interface GlideClient (Orientation)

/*! Rotates the image.
 \param value The value of orientation
 \return void
 */
- (void) setOrientation:(GlideOrientationType)value;


@end
