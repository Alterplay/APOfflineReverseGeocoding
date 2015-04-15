//
//  APCountryCodeImporter.h
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APCountryCodeImporter : NSObject

/**
 *  Imports 2 digits country code from 3 digits one
 *
 *  @param code NSString code
 *
 *  @return NSString
 */
+ (NSString *)importShortCountryCodeWithCode:(NSString *)code;

@end
