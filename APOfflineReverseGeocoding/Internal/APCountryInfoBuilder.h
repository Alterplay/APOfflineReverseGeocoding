//
//  APCountryInfoBuilder.h
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APCountryInfoBuilderDefines.h"

@interface APCountryInfoBuilder : NSObject

/**
 *  Convenience initializer
 *
 *  @param countryCode NString. See -initWithCountryCode:
 *
 *  @return APCountryInfoBuilder
 */
+ (instancetype)builderWithCountryCode:(NSString *)countryCode;

/**
 *  Designated initializer
 *
 *  @param countryCode NSString. APCountryInfoImporterISO31661Alpha3Key (3 digits)
 *
 *  @return APCountryCodeImporter
 */
- (instancetype)initWithCountryCode:(NSString *)countryCode NS_DESIGNATED_INITIALIZER;

/**
 *  Imports the country info
 *
 *  @return NSDictionary that contains keys from APCountryInfoBuilderDefines.h
 */
- (NSDictionary *)build;

@end

@interface APCountryInfoBuilder (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end