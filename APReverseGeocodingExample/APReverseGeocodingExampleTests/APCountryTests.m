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

- (void)testAPCountryImported {
    
    NSString *countryId = @"foo";
    NSString *countryName = @"bar";
    
    NSDictionary *geoDictionary = @{@"id":countryId, @"name": countryName};
    
    APCountry *country = [APCountry countryWithGEODictionary:geoDictionary];
    XCTAssertEqual(country.code, countryId);
    XCTAssertEqual(country.name, countryName);
}

@end
