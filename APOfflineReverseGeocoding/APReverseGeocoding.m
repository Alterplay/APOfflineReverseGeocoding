//
//  APReverseGeocoding.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APReverseGeocoding.h"

static NSString *const APReverseGeocodingDefaultDBName = @"countries.geo";

@interface APReverseGeocoding ()

@property (nonatomic, strong, readwrite) NSArray *countries;

@end

@implementation APReverseGeocoding

+ (instancetype)defaultGeocoding
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *url = [bundle URLForResource:APReverseGeocodingDefaultDBName withExtension:@"json"];
    return [self geocodingWithGeoJSONURL:url];
}

+ (instancetype)geocodingWithGeoJSONURL:(NSURL *)url
{
    return [[self alloc] initWithGeoJSONURL:url];
}

- (instancetype)initWithGeoJSONURL:(NSURL *)url
{
    NSParameterAssert(url);
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

#pragma mark - Public

- (APCountry *)geocodeCountryWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    return [self _geocodeCountryWithCoordinate:coordinate];
}

#pragma mark - Private

- (APCountry *)_geocodeCountryWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSDictionary *usa = @{@"id":@"USA"};
    return [APCountry countryWithGEODictionary:usa];
}

- (NSArray *)countries
{
    if (!_countries) {
        
        NSError *error = nil;
        NSData *jsonData = [[NSData alloc] initWithContentsOfURL:self.url];
        NSArray *parsedJSON = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        if (!error) {
            _countries = [parsedJSON copy];
        } else {
            [NSException raise:@"Cannot parse JSON." format:@"JSON URL - %@\nError:%@", self.url, parsedJSON];
        }
    }
    return _countries;
}

@end
