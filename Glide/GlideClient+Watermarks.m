//
//  GlideClient+Watermarks.m
//  Glide
//
//  Created by Axel Etcheverry on 03/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient+Watermarks.h"

@implementation GlideClient (Watermarks)

- (void) setMarkPath:(NSString*)path {
    [self.queries setObject:path forKey:@"mark"];
}

- (void) setMarkWidth:(NSUInteger)width {
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (unsigned long)width] forKey:@"markw"];
}

- (void) setMarkHeight:(NSUInteger)height {
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (unsigned long)height] forKey:@"markh"];
}

- (void) setMarkFit:(GlideMarkFitType)type {
    NSString* fit = @"";
    
    switch (type) {
        case GlideMarkFitContain:
            fit = @"contain";
            break;
        case GlideMarkFitMax:
            fit = @"max";
            break;
        case GlideMarkFitFill:
            fit = @"fill";
            break;
        case GlideMarkFitStretch:
            fit = @"stretch";
            break;
        case GlideMarkFitCrop:
            fit = @"crop";
            break;
    }
    
    [self.queries setObject:fit forKey:@"markfit"];
}

- (void) setMarkX:(NSUInteger)pixel {
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (unsigned long)pixel] forKey:@"markx"];
}

- (void) setMarkY:(NSUInteger)pixel {
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (unsigned long)pixel] forKey:@"marky"];
}

- (void) setMarkPadding:(NSUInteger)pixel {
    [self.queries setObject:[NSString stringWithFormat:@"%lu", (unsigned long)pixel] forKey:@"markpad"];
}

- (void) setMarkPosition:(GlideMarkPosType)pos {
    NSString* value = @"";
    
    switch (pos) {
        case GlideMarkPosTopLeft:
            value = @"top-left";
            break;
        case GlideMarkPosTop:
            value = @"top";
            break;
        case GlideMarkPosTopRight:
            value = @"top-right";
            break;
        case GlideMarkPosLeft:
            value = @"left";
            break;
        case GlideMarkPosCenter:
            value = @"center";
            break;
        case GlideMarkPosRight:
            value = @"right";
            break;
        case GlideMarkPosBottomLeft:
            value = @"bottom-left";
            break;
        case GlideMarkPosBottom:
            value = @"bottom";
            break;
        case GlideMarkPosBottomRight:
            value = @"bottom-right";
            break;
    }
    
    [self.queries setObject:value forKey:@"markpos"];
}

@end
