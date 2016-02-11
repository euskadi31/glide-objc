//
//  GlideClient.m
//  Glide
//
//  Created by Axel Etcheverry on 02/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import "GlideClient.h"

@implementation GlideClient

#pragma mark - Initializers

- (instancetype)init {
    if ((self = [super init])) {
        self.queries = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (nonnull instancetype)initWithString:(nonnull NSString *)URLString {
    if ((self = [self init])) {
        NSURL *url = [NSURL URLWithString: URLString];
    
        self.scheme = [url scheme];
        self.host = [url host];
        self.port = [url port];
        self.user = [url user];
        self.password = [url password];
        self.path = [url path];
    }
    
    return self;
}

- (nonnull instancetype)initWithBase:(NSString *)BaseString {
    if ((self = [self init])) {
        NSURL *url = [NSURL URLWithString: BaseString];
        
        self.scheme = [url scheme];
        self.host = [url host];
        self.port = [url port];
        self.user = [url user];
        self.password = [url password];
    }
    
    return self;
}

#pragma mark - Signature


#pragma mark - URL Building

- (nullable NSURL *)absoluteURL {
    return [[NSURL alloc] initWithString: [self absoluteString]];
}

- (nullable NSString *)absoluteString {
    NSString *sign;
    
    if (self.signature && self.signature.length > 0) {
        sign = [self generateSignature];
    }
    
    NSMutableString *url = [[NSMutableString alloc] initWithFormat:@"%@://", [self scheme]];
    
    if (self.user && self.user.length > 0) {
        [url appendString:self.user];
        
        if (self.password && self.password.length > 0) {
            [url appendFormat:@":%@", self.password];
        }
        
        [url appendString:@"@"];
    }
    
    [url appendString:self.host];
    
    if (self.port && self.port.intValue != 0 && self.port.intValue != 80 && self.port.intValue != 443) {
        [url appendFormat:@":%@", self.port.stringValue];
    }
    
    [url appendString:self.path];
    
    if (self.queries.count > 0) {
        [url appendFormat:@"?%@", [self queryString]];
    }
    
    if (sign && sign.length > 0) {
        [url appendFormat:@"&s=%@", sign];
    }
    
    return url;
}

- (nullable NSString *)absoluteStringFromPath:(nonnull NSString *)path {
    [self setPath:path];
    
    return [self absoluteString];
}

- (nullable NSString *)queryString {
    NSMutableArray *components = [[NSMutableArray alloc] init];
    
    NSArray *keys = [[self.queries allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    [keys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        id value = self.queries[key];
        [components addObject:[[NSString alloc] initWithFormat:@"%@=%@", key, value]];
    }];
    
    return [components componentsJoinedByString:@"&"];
}

#pragma mark - Private

- (nullable NSString *)generateSignature {
    if ([self.queries objectForKey:@"s"]) {
        [self.queries removeObjectForKey:@"s"];
    }
    
    NSString *sign = [[NSString alloc] initWithFormat:
                      @"%@:%@?%@",
                      self.signature,
                      [GlideUtils leftTrimOfString:self.path],
                      [self queryString]
                      ];
    
    return [GlideUtils md5: sign];
}


@end
