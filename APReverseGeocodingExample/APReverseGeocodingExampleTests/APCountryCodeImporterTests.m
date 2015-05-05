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

#pragma mark - Code

- (void)testUSImported
{
    APCountryInfoBuilder *builder = [APCountryInfoBuilder builderWithCountryCode:@"USA"];
    NSDictionary *info = [builder build];
    NSString *code = info[APCountryInfoBuilderISO31661Alpha2Key];
    NSString *currencyCode = info[APCountryInfoBuilderCurrencyCodeKey];
    NSString *currencySymbol = info[APCountryInfoBuilderCurrencySymbolKey];
    NSCalendar *calendar = info[APCountryInfoBuilderCalendarKey];
    XCTAssertTrue([code isEqualToString:@"US"]);
    XCTAssertTrue([currencyCode isEqualToString:@"USD"]);
    XCTAssertTrue([currencySymbol isEqualToString:@"US$"]);
    XCTAssertTrue([calendar.calendarIdentifier isEqualToString:@"gregorian"]);
}

- (void)testNILCodeHandled
{
    APCountryInfoBuilder *builder = [APCountryInfoBuilder builderWithCountryCode:nil];
    NSDictionary *info = [builder build];
    XCTAssertTrue(info == nil);
}

- (void)testUnknownCodeHandled
{    
    APCountryInfoBuilder *builder = [APCountryInfoBuilder builderWithCountryCode:@"vcsadadaaA"];
    NSDictionary *info = [builder build];
    XCTAssertTrue(info[APCountryInfoBuilderCurrencyCodeKey] == nil);
}

- (void)testImportPerformance
{
    [self measureBlock:^{
        APCountryInfoBuilder *builder = [APCountryInfoBuilder builderWithCountryCode:@"USA"];
        [builder build];
    }];
}

@end
