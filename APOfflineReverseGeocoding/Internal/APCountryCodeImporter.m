//
//  APCountryCodeImporter.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APCountryCodeImporter.h"

@implementation APCountryCodeImporter

+ (NSString *)importShortCountryCodeWithCode:(NSString *)code
{
    if (!code) {
        return nil;
    }
    NSString *identifier = [NSLocale localeIdentifierFromComponents: @{NSLocaleCountryCode: code}];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:identifier];
    
    NSString *countryCode = [locale objectForKey: NSLocaleCountryCode];
    return countryCode;
}

@end
