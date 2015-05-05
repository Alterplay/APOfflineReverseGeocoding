//
//  APCountryCodeImporter.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APCountryInfoBuilder.h"

@interface APCountryInfoBuilder ()

/* Represents the country code */
@property (nonatomic, copy, readwrite) NSString *code;

@end

@implementation APCountryInfoBuilder

+ (instancetype)builderWithCountryCode:(NSString *)countryCode
{
    return [[self alloc] initWithCountryCode:countryCode];
}

- (instancetype)initWithCountryCode:(NSString *)countryCode
{
    self = [super init];
    if (self) {
        _code = countryCode;
    }
    return self;
}

#pragma mark - Public

- (NSDictionary *)build
{
    if (!self.code) {
        return nil;
    }
    
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    NSString *shortCode = [self _import2DigitsCode];
    if (shortCode) {
        [dictionary setObject:shortCode forKey:APCountryInfoBuilderISO31661Alpha2Key];
    }
    NSString *localizedName = [self _importLocalizedCountryName];
    if (localizedName) {
        [dictionary setObject:localizedName forKey:APCountryInfoBuilderLocalizedNameKey];
    }
    return [dictionary copy];
}

#pragma mark - Private

- (NSString *)_import2DigitsCode
{
    NSString *identifier = [NSLocale localeIdentifierFromComponents: @{NSLocaleCountryCode: self.code}];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:identifier];
    NSString *countryCode = [locale objectForKey: NSLocaleCountryCode];
    return countryCode;
}

- (NSString *)_importLocalizedCountryName
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey: NSLocaleCountryCode];
    NSString *localizedCountryName = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
    return localizedCountryName;
}


@end
