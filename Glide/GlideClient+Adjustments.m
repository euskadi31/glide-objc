//
//  GlideClient+Adjustments.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Adjustments.h"

@implementation GlideClient (Adjustments)

- (void) setBrightness:(NSInteger)value {
    
   // NSString* brightness = @"";
    
    if (value < -100) {
        value = -100;
    }
    
    if (value > 100) {
        value = 100;
    }
    
    [self.queries setObject:[NSString stringWithFormat:@"%ld", (long)value] forKey:@"bri"];
}

- (void) setContrast:(NSInteger)value {
    if (value < -100) {
        value = -100;
    }
    
    if (value > 100) {
        value = 100;
    }
    
    [self.queries setObject:[NSString stringWithFormat:@"%ld", (long)value] forKey:@"con"];
}

- (void) setGamma:(float)value {

    if (value < 0.1f) {
        value = 0.1f;
    }
    
    if (value > 9.99f) {
        value = 9.99f;
    }
    
    [self.queries setObject:[NSString stringWithFormat:@"%g", value] forKey:@"gam"];
}

- (void) setSharpen:(NSUInteger)value {
    if (value > 100) {
        value = 100;
    }
    
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (unsigned long)value] forKey:@"sharp"];
}

@end
