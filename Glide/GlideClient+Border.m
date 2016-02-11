//
//  GlideClient+Border.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Border.h"

@implementation GlideClient (Border)

- (void) setBorderWithWidth:(NSUInteger)width color:(nonnull NSString*)color andType:(GlideBorderType)type {
    NSString* method = @"";
    
    switch (type) {
        case GlideBorderOverlay:
            method = @"overlay";
            break;
            
        case GlideBorderShrink:
            method = @"shrink";
            break;
            
        case GlideBorderExpand:
            method = @"expand";
            break;
    }
    
    [self.queries setObject:[NSString stringWithFormat:@"%lu,%@,%@", width, color, method] forKey:@"border"];
}

@end
