//
//  APCountry.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APCountry.h"
#import "APCountryCodeImporter.h"

@implementation APCountry

+ (instancetype)countryWithGEODictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithGeoDictionary:dictionary];
}

- (instancetype)initWithGeoDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _code = dictionary[@"id"];
        _shortCode = [APCountryCodeImporter importShortCountryCodeWithCode:_code];
        _name = dictionary[@"properties"][@"name"];
    }
    return self;
}

@end

