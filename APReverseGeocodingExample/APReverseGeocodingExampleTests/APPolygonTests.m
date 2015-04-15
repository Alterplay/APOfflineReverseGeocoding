//
//  APPolygonTests.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "APPolygon.h"

@interface APPolygonTests : XCTestCase

@property (nonatomic, strong) NSArray *rectangle;

@property (nonatomic, strong) NSArray *customPolygon;

@end

@implementation APPolygonTests

- (void)setUp {
    [super setUp];
    
    _rectangle = @[@[@(0),@(0)],
                   @[@(10),@(0)],
                   @[@(20),@(5)],
                   @[@(10),@(10)],
                   @[@(0),@(10)]];
    
}

- (void)tearDown {
    
    _rectangle = nil;
    _customPolygon = nil;
    
    [super tearDown];
}

- (void)testRectanglePointContains {
    
    APPolygon *polygon = [APPolygon polygonWithPoints:self.rectangle];
    
    CGPoint testPoint = CGPointMake(0.0, 5.0f);
    
    XCTAssertTrue([polygon containsPoint:testPoint]);
}

- (void)testRectanglePointNotContains {
    
    APPolygon *polygon = [APPolygon polygonWithPoints:self.rectangle];
    
    CGPoint testPoint = CGPointMake(0.0, 15.0f);
    
    XCTAssertFalse([polygon containsPoint:testPoint]);
}

- (void)testRectangleLocationContains {
    
    APPolygon *polygon = [APPolygon polygonWithPoints:self.rectangle];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(0.0f, 5.0f);
    XCTAssertTrue([polygon containsLocation:coord]);
}

- (void)testRectangleLocationNotContains {
    
    APPolygon *polygon = [APPolygon polygonWithPoints:self.rectangle];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(0.0f, 15.0f);
    
    XCTAssertFalse([polygon containsLocation:coord]);
}

@end
