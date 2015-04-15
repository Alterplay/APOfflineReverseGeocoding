//
//  APCountryCodeImporterTests.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "APCountryCodeImporter.h"

@interface APCountryCodeImporterTests : XCTestCase

@end

@implementation APCountryCodeImporterTests

- (void)testUSImported
{
    NSString *code = [APCountryCodeImporter importShortCountryCodeWithCode:@"USA"];
    XCTAssertTrue([code isEqualToString:@"US"]);
}

- (void)testNILCodeHandled
{
    NSString *code = [APCountryCodeImporter importShortCountryCodeWithCode:nil];
    XCTAssertTrue(code == nil);
}

- (void)testUnknownCodeHandled
{
    NSString *code = [APCountryCodeImporter importShortCountryCodeWithCode:@"USadsdasA"];
    XCTAssertTrue(code == nil);
}

@end
