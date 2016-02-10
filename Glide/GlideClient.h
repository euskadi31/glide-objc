//
//  GlideClient.h
//  Glide
//
//  Created by Axel Etcheverry on 02/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GlideClient : NSObject

#pragma mark - Properties

@property (nullable, nonatomic) NSURL *url;

@property (nullable, nonatomic, copy) NSString *scheme;
@property (nullable, nonatomic, copy) NSString *host;
@property (nullable, nonatomic, copy) NSNumber *port;
@property (nullable, nonatomic, copy) NSString *user;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *path;
@property (nullable, nonatomic) NSMutableDictionary *queries;

#pragma mark - Initializers

- (nonnull instancetype)initWithString:(nonnull NSString *)URLString;

#pragma mark - URL Building

- (nullable NSURL *)absoluteURL;

- (nullable NSString*)absoluteString;

@end
