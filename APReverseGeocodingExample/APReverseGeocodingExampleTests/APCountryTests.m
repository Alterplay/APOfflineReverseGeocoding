//
//  APCountryTests.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "APCountry.h"

@interface APCountryTests : XCTestCase

@end

@implementation APCountryTests

- (void)testCountryImported {
    
    NSString *countryId = @"USA";
    NSString *countryName = @"United States";
    
    NSDictionary *geoDictionary = @{@"id":countryId, @"properties":@{@"name":countryName}};
    
    APCountry *country = [APCountry countryWithGEODictionary:geoDictionary];
    XCTAssertEqual(country.code, countryId);
    XCTAssertTrue([country.shortCode isEqualToString:country.shortCode]);
    XCTAssertEqual(country.name, countryName);
}

@end
