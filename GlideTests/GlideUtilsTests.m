//
//  GlideUtilsTests.m
//  Glide
//
//  Created by Axel Etcheverry on 11/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GlideUtils.h"

@interface GlideUtilsTests : XCTestCase

@end

@implementation GlideUtilsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLeftTrimOfString {
    XCTAssertEqualObjects([GlideUtils leftTrimOfString:@"/path/to/image.jpg"], @"path/to/image.jpg");
    XCTAssertEqualObjects([GlideUtils leftTrimOfString:@"path/to/image.jpg"], @"path/to/image.jpg");
}

- (void)testMd5 {
    XCTAssertEqualObjects([GlideUtils md5:@"hello"], @"5d41402abc4b2a76b9719d911017c592");
}

- (void)testPerformanceLeftTrimOfString {
    // This is an example of a performance test case.
    [self measureBlock:^{
        [GlideUtils leftTrimOfString:@"/path/to/image.jpg"];
    }];
}

- (void)testPerformanceMd5 {
    // This is an example of a performance test case.
    [self measureBlock:^{
        [GlideUtils md5:@"hello"];
        
    }];
}

@end
