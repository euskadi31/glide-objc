//
//  GlideClient+GlideCrop.h
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

@interface GlideClient (Crop)

/*! Crops the image to specific dimensions.
 \param width The width of image
 \param height The height of image
 \param x The x of image
 \param y The y of image
 \return void
 */
- (void) setCropWithWidth:(NSUInteger)width height:(NSUInteger)height x:(NSUInteger)x y:(NSUInteger)y;

@end
