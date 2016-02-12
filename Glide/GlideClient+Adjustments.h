//
//  GlideClient+Adjustments.h
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

#if TARGET_OS_IOS
#import <CoreGraphics/CGBase.h>
#endif

@interface GlideClient (Adjustments)

- (void) setBrightness:(NSInteger)value;

- (void) setContrast:(NSInteger)value;

- (void) setGamma:(float)value;

- (void) setSharpen:(NSUInteger)value;

@end
