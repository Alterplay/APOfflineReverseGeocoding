//
//  APReverseGeocodingTests.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "APReverseGeocoding.h"
#import "APCountry.h"

@interface APReverseGeocodingTests : XCTestCase

@end

@implementation APReverseGeocodingTests

- (void)testURLImported {
    
    NSURL *url = [[NSBundle bundleForClass:[self class]] URLForResource:@"countries.geo" withExtension:@"json"];
    APReverseGeocoding *geocoding = [APReverseGeocoding geocodingWithGeoJSONURL:url];
    XCTAssertEqual(geocoding.url, url);
}

- (void)testNewYorkCoordinatesGeocodesUSA
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(40.7142700, -74.0059700);
    APReverseGeocoding *geocoding = [APReverseGeocoding defaultGeocoding];
    APCountry *country = [geocoding geocodeCountryWithCoordinate:coordinate];
    
    XCTAssertTrue([country.code isEqualToString:@"USA"]);
}

- (void)testPerformanceNewYorkGeocoding {

    [self measureBlock:^{
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(40.7142700, -74.0059700);
        APReverseGeocoding *geocoding = [APReverseGeocoding defaultGeocoding];
        [geocoding geocodeCountryWithCoordinate:coordinate];
    }];
}

@end
