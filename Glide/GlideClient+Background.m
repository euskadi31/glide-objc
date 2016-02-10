//
//  GlideClient+Background.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Background.h"

@implementation GlideClient (Background)

- (void) setBackground:(NSString*)color {
    [self.queries setObject:color forKey:@"bg"];
}

@end
