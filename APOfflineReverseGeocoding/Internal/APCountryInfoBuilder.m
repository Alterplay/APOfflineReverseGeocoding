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
@property (nonatomic, copy) NSString *code;

/* Represents country locale from code */
@property (nonatomic, strong) NSLocale *countryLocale;

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
    
    NSString *currencyCode = [self _importCurrencyCode];
    if (currencyCode) {
        [dictionary setObject:currencyCode forKey:APCountryInfoBuilderCurrencyCodeKey];
    }
    
    NSString *currencySymbol = [self _importCurrencySymbol];
    if (currencySymbol) {
        [dictionary setObject:currencySymbol forKey:APCountryInfoBuilderCurrencySymbolKey];
    }
    
    NSCalendar *calendar = [self _importCalendar];
    if (calendar) {
        [dictionary setObject:calendar forKey:APCountryInfoBuilderCalendarKey];
    }
    return [dictionary copy];
}

#pragma mark - Private

- (NSString *)_import2DigitsCode
{
    return [self.countryLocale objectForKey: NSLocaleCountryCode];
}

- (NSString *)_importCurrencyCode
{
    return [self.countryLocale objectForKey: NSLocaleCurrencyCode];
}

- (NSString *)_importCurrencySymbol
{
    return [self.countryLocale objectForKey:NSLocaleCurrencySymbol];
}

- (NSCalendar *)_importCalendar
{
    return [self.countryLocale objectForKey:NSLocaleCalendar];
}

- (NSString *)_importLocalizedCountryName
{
    NSString *countryCode = [self.countryLocale objectForKey: NSLocaleCountryCode];
    NSString *localizedCountryName = [self.countryLocale displayNameForKey:NSLocaleCountryCode value:countryCode];
    return localizedCountryName;
}

#pragma mark - Accessors

- (NSLocale *)countryLocale
{
    if (!_countryLocale) {
        NSString *identifier = [NSLocale localeIdentifierFromComponents: @{NSLocaleCountryCode: self.code}];
        _countryLocale = [NSLocale localeWithLocaleIdentifier:identifier];
    }
    return _countryLocale;
}

@end
