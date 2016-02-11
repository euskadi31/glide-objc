//
//  GlideTests.m
//  GlideTests
//
//  Created by Axel Etcheverry on 02/02/2016.
//  Copyright © 2016 Axel Etcheverry. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GlideClient.h"
#import "GlideClient+PixelDensity.h"
#import "GlideClient+Size.h"
#import "GlideClient+Orientation.h"
#import "GlideClient+Crop.h"
#import "GlideClient+Adjustments.h"
#import "GlideClient+Effects.h"
#import "GlideClient+Watermarks.h"
#import "GlideClient+Background.h"
#import "GlideClient+Border.h"
#import "GlideClient+Encode.h"

@interface GlideTests : XCTestCase

@end

@implementation GlideTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGlide {
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://images.domain.tld/path/to/image.jpg"];
    
    GlideClient *client = [[GlideClient alloc] initWithString: [url absoluteString]];

    XCTAssertEqualObjects([client scheme], @"https");
    XCTAssertEqualObjects([client host], @"images.domain.tld");
    XCTAssertEqualObjects([client path], @"/path/to/image.jpg");
    
    XCTAssertEqualObjects([client absoluteString], @"https://images.domain.tld/path/to/image.jpg");
    
    XCTAssertEqualObjects([client absoluteURL], url);
}

- (void)testGlideWithSignature {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setSignature:@"AzErTy123"];
    
    [client setWidth:200 andHeight:205];
    
    [[client queries] setObject:@"foo" forKey:@"s"];
    
    XCTAssertEqualObjects([client signature], @"AzErTy123");
    
    XCTAssertEqualObjects([client absoluteString], @"https://images.domain.tld/path/to/image.jpg?h=205&w=200&s=397a59f9993e5dc2d46564d6fe59a9bf");
}

- (void)testGlideWithAuth {
    
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://user:pass@images.domain.tld/path/to/image.jpg"];
    
    XCTAssertEqualObjects([client scheme], @"https");
    XCTAssertEqualObjects([client host], @"images.domain.tld");
    XCTAssertEqualObjects([client path], @"/path/to/image.jpg");
    XCTAssertEqualObjects([client user], @"user");
    XCTAssertEqualObjects([client password], @"pass");
    
    XCTAssertEqualObjects([client absoluteString], @"https://user:pass@images.domain.tld/path/to/image.jpg");
}

- (void)testGlideWithPort {
    
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld:8080/path/to/image.jpg"];
    
    XCTAssertEqualObjects([client scheme], @"https");
    XCTAssertEqualObjects([client host], @"images.domain.tld");
    XCTAssertEqualObjects([client path], @"/path/to/image.jpg");
    XCTAssertEqualObjects([client port], @8080);
    
    XCTAssertEqualObjects([client absoluteString], @"https://images.domain.tld:8080/path/to/image.jpg");
}

- (void)testBuildUrl {
    
    GlideClient *client = [[GlideClient alloc] initWithBase:@"https://images.domain.tld"];
    
    [client setWidth:200 andHeight:205];
    
    XCTAssertEqualObjects([client absoluteStringFromPath:@"/path/to/image.jpg"], @"https://images.domain.tld/path/to/image.jpg?h=205&w=200");
}


- (void)testPixelDensity {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setDpr: 3.0];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"dpr"], @"3");
}

- (void)testSize {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setWidth: 400];
    [client setHeight: 300];
    
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"w"], @"400");
    XCTAssertEqualObjects([[client queries] objectForKey:@"h"], @"300");
    
    [client setWidth:500 andHeight:400];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"w"], @"500");
    XCTAssertEqualObjects([[client queries] objectForKey:@"h"], @"400");
    
    [client setFit:@"foo"];
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"foo");
    
    [client setFitWithPoint:20 andY:30];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-20-30");
    
    [client setFitWithPosition: GlideFitContain];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"contain");
    
    [client setFitWithPosition: GlideFitMax];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"max");
    
    [client setFitWithPosition: GlideFitFill];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"fill");
    
    [client setFitWithPosition: GlideFitStretch];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"stretch");
    
    [client setFitWithPosition: GlideCrop];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop");
    
    [client setFitWithPosition: GlideFitCropTopLeft];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-top-left");
    
    [client setFitWithPosition: GlideFitCropTop];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-top");
    
    [client setFitWithPosition: GlideFitCropTopRight];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-top-right");
    
    [client setFitWithPosition: GlideFitCropLeft];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-left");
    
    [client setFitWithPosition: GlideFitCropCenter];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-center");
    
    [client setFitWithPosition: GlideFitCropRight];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-right");
    
    [client setFitWithPosition: GlideFitCropBottomLeft];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-bottom-left");
    
    [client setFitWithPosition: GlideFitCropBottom];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-bottom");
    
    [client setFitWithPosition: GlideFitCropBottomRight];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fit"], @"crop-bottom-right");
}

- (void)testOrientation {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setOrientation:GlideOrientationAuto];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"or"], @"auto");
    
    [client setOrientation:GlideOrientation0];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"or"], @"0");
    
    [client setOrientation:GlideOrientation90];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"or"], @"90");
    
    [client setOrientation:GlideOrientation180];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"or"], @"180");
    
    [client setOrientation:GlideOrientation270];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"or"], @"270");
}

- (void)testCrop {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setCropWithWidth:50 height:55 x:0 y:1];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"crop"], @"50,55,0,1");
}


- (void)testAdjustments {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setBrightness:-120];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"bri"], @"-100");
    
    [client setBrightness:-20];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"bri"], @"-20");
    
    [client setBrightness:20];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"bri"], @"20");
    
    [client setBrightness:200];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"bri"], @"100");
    
    
    [client setContrast:-120];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"con"], @"-100");
    
    [client setContrast:-20];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"con"], @"-20");
    
    [client setContrast:20];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"con"], @"20");
    
    [client setContrast:200];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"con"], @"100");
    
    
    [client setGamma:0.01];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"gam"], @"0.1");
    
    [client setGamma:0.2];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"gam"], @"0.2");
    
    [client setGamma:2.2];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"gam"], @"2.2");
    
    [client setGamma:10.0];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"gam"], @"9.99");
    
    
    [client setSharpen:0];
    
    XCTAssertEqual([[client queries] count], 4);
    XCTAssertEqualObjects([[client queries] objectForKey:@"sharp"], @"0");
    
    [client setSharpen:10];
    
    XCTAssertEqual([[client queries] count], 4);
    XCTAssertEqualObjects([[client queries] objectForKey:@"sharp"], @"10");
    
    [client setSharpen:120];
    
    XCTAssertEqual([[client queries] count], 4);
    XCTAssertEqualObjects([[client queries] objectForKey:@"sharp"], @"100");
}

- (void)testEffects {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setBlur:10];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"blur"], @"10");
    
    [client setBlur:110];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"blur"], @"100");
    
    
    [client setPixelate: 10];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"pixel"], @"10");
    
    [client setPixelate: 1001];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"pixel"], @"1000");
    
    
    [client setFilter: GlideFilterGreyscale];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"filt"], @"greyscale");
    
    [client setFilter: GlideFilterSepia];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"filt"], @"sepia");
}

- (void)testWatermarks {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setMarkPath:@"logo.png"];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"mark"], @"logo.png");
    
    [client setMarkWidth:245];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markw"], @"245");
    
    [client setMarkHeight:240];
    
    XCTAssertEqual([[client queries] count], 3);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markh"], @"240");

    
    [client setMarkFit:GlideMarkFitContain];
    
    XCTAssertEqual([[client queries] count], 4);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markfit"], @"contain");
    
    [client setMarkFit:GlideMarkFitMax];
    
    XCTAssertEqual([[client queries] count], 4);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markfit"], @"max");
    
    [client setMarkFit:GlideMarkFitFill];
    
    XCTAssertEqual([[client queries] count], 4);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markfit"], @"fill");
    
    [client setMarkFit:GlideMarkFitStretch];
    
    XCTAssertEqual([[client queries] count], 4);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markfit"], @"stretch");
    
    [client setMarkFit:GlideMarkFitCrop];
    
    XCTAssertEqual([[client queries] count], 4);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markfit"], @"crop");
    
    [client setMarkX:4];
    
    XCTAssertEqual([[client queries] count], 5);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markx"], @"4");
    
    [client setMarkY:5];
    
    XCTAssertEqual([[client queries] count], 6);
    XCTAssertEqualObjects([[client queries] objectForKey:@"marky"], @"5");
    
    
    [client setMarkPadding:35];
    
    XCTAssertEqual([[client queries] count], 7);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpad"], @"35");
    
    [client setMarkPosition:GlideMarkPosTopLeft];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"top-left");
    
    [client setMarkPosition:GlideMarkPosTop];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"top");
    
    [client setMarkPosition:GlideMarkPosTopRight];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"top-right");
    
    [client setMarkPosition:GlideMarkPosLeft];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"left");
    
    [client setMarkPosition:GlideMarkPosCenter];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"center");
    
    [client setMarkPosition:GlideMarkPosRight];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"right");
    
    [client setMarkPosition:GlideMarkPosBottomLeft];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"bottom-left");
    
    [client setMarkPosition:GlideMarkPosBottom];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"bottom");
    
    [client setMarkPosition:GlideMarkPosBottomRight];
    
    XCTAssertEqual([[client queries] count], 8);
    XCTAssertEqualObjects([[client queries] objectForKey:@"markpos"], @"bottom-right");
    
}

- (void)testBackground {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setBackground:@"black"];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"bg"], @"black");
}

- (void)testBorder {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setBorderWithWidth:2 color:@"black" andType:GlideBorderOverlay];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"border"], @"2,black,overlay");
    
    [client setBorderWithWidth:2 color:@"black" andType:GlideBorderExpand];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"border"], @"2,black,expand");
    
    [client setBorderWithWidth:2 color:@"black" andType:GlideBorderShrink];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"border"], @"2,black,shrink");

}

- (void)testEncode {
    GlideClient *client = [[GlideClient alloc] initWithString: @"https://images.domain.tld/path/to/image.jpg"];
    
    [client setQuality:85];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"q"], @"85");
    
    [client setQuality:101];
    
    XCTAssertEqual([[client queries] count], 1);
    XCTAssertEqualObjects([[client queries] objectForKey:@"q"], @"100");
    
    [client setFormat:GlideFormatGif];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fm"], @"gif");
    
    [client setFormat:GlideFormatJpg];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fm"], @"jpg");
    
    [client setFormat:GlideFormatPjpg];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fm"], @"pjpg");
    
    [client setFormat:GlideFormatPng];
    
    XCTAssertEqual([[client queries] count], 2);
    XCTAssertEqualObjects([[client queries] objectForKey:@"fm"], @"png");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
