//
//  APCountry.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APCountry.h"
#import "APCountryInfoBuilder.h"

@implementation APCountry

+ (instancetype)countryWithGEODictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithGeoDictionary:dictionary];
}

- (instancetype)init
{
    return nil;
}

- (instancetype)initWithGeoDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        /* Set default values */
        _code = dictionary[@"id"];
        _name = dictionary[@"properties"][@"name"];
        
        /* Extract additional info from the code */
        APCountryInfoBuilder *infoBuilder = [APCountryInfoBuilder builderWithCountryCode:_code];
        NSDictionary *countryInfo = [infoBuilder build];
        
        _shortCode = countryInfo[APCountryInfoBuilderISO31661Alpha2Key];
        _localizedName = countryInfo[APCountryInfoBuilderLocalizedNameKey];
        _currencyCode = countryInfo[APCountryInfoBuilderCurrencyCodeKey];
        _currencySymbol = countryInfo[APCountryInfoBuilderCurrencySymbolKey];
        _calendar = countryInfo[APCountryInfoBuilderCalendarKey];
    }
    return self;
}

@end

