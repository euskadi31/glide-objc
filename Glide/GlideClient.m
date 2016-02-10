//
//  GlideClient.m
//  Glide
//
//  Created by Axel Etcheverry on 02/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"
#import "GlideClient+PixelDensity.h"

#if TARGET_OS_IOS
#import <UIKit/UIKit.h>;
#endif

@implementation GlideClient

#pragma mark - Initializers

- (instancetype)init {
    if ((self = [super init])) {
        self.queries = [[NSMutableDictionary alloc] init];
#if TARGET_OS_IOS
        [self setDpr: [[UIScreen mainScreen] scale]];
#endif
    }
    
    return self;
}

- (nonnull instancetype)initWithString:(nonnull NSString *)URLString {
    if ((self = [self init])) {
        NSURL* url = [NSURL URLWithString: URLString];
    
        self.scheme = [url scheme];
        self.host = [url host];
        self.port = [url port];
        self.user = [url user];
        self.password = [url password];
        self.path = [url path];
        
    }
    
    return self;
}

#pragma mark - URL Building

- (nullable NSURL *)absoluteURL {
    return [[NSURL alloc] init];
}

- (nullable NSString*)absoluteString {
    return @"";
}

/*
- (NSString *)queryStringWithPath:(NSString *)path {
    NSMutableArray *components = [[NSMutableArray alloc] init];
    NSArray *keys = [[self.options allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    [keys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        id value = self.options[key];
        [components addObject:[[NSString alloc] initWithFormat:@"%@=%@", key, value]];
    }];
    
    NSString *query = [components componentsJoinedByString:@"&"];
    if (query.length > 0) {
        query = [@"?" stringByAppendingString:query];
    }
    
    if (self.token) {
        NSString *input = [[NSString alloc] initWithFormat:@"%@%@%@", self.token, path, query];
        NSString *signature = [input imgix_MD5];
        
        [components addObject:[[NSString alloc] initWithFormat:@"s=%@", signature]];
        query = [components componentsJoinedByString:@"&"];
        
        if (query.length > 0) {
            query = [@"?" stringByAppendingString:query];
        }
    }
    
    return query;
}

- (glide_nullable NSURL *)URLWithPath:(glide_nonnull NSString *)path {
    NSString *scheme = self.secure ? @"https" : @"http";
    
    if (![path hasPrefix:@"/"]) {
        path = [@"/" stringByAppendingString:path];
    }
    
    NSString *query = [self queryStringWithPath:path];
    
    NSString *string = [[NSString alloc] initWithFormat:@"%@://%@%@%@", scheme, self.host, path, query];
    return [[NSURL alloc] initWithString:string];
}

#pragma mark - Private

- (void)setBool:(BOOL)value forKey:(glide_nonnull NSString *)key {
    if (value) {
        self.options[key] = @"true";
    } else {
        [self.options removeObjectForKey:key];
    }
}*/

@end
