//
//  APCountryCodeImporterTests.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "APCountryInfoBuilder.h"

@interface APCountryCodeImporterTests : XCTestCase

@end

@implementation APCountryCodeImporterTests

- (void)testUSImported
{
    APCountryInfoBuilder *builder = [APCountryInfoBuilder builderWithCountryCode:@"USA"];
    NSDictionary *info = [builder build];
    NSString *code = info[APCountryInfoBuilderISO31661Alpha2Key];
    XCTAssertTrue([code isEqualToString:@"US"]);
}

- (void)testNILCodeHandled
{
    APCountryInfoBuilder *builder = [APCountryInfoBuilder builderWithCountryCode:nil];
    NSDictionary *info = [builder build];
    NSString *code = info[APCountryInfoBuilderISO31661Alpha2Key];
    XCTAssertTrue(code == nil);
}

- (void)testUnknownCodeHandled
{    
    APCountryInfoBuilder *builder = [APCountryInfoBuilder builderWithCountryCode:@"UsadadaaA"];
    NSDictionary *info = [builder build];
    NSString *code = info[APCountryInfoBuilderISO31661Alpha2Key];
    XCTAssertTrue(code == nil);
}

@end
