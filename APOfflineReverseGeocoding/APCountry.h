//
//  APCountry.h
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APCountry : NSObject

/**
 *  Convenience initializer
 *
 *  @param dictionary NSDictionary with json data. See more here:
 *  https://github.com/johan/world.geo.json
 *
 *  @return APCountry
 */
+ (instancetype)countryWithGEODictionary:(NSDictionary *)dictionary;

/**
 *  Designated initializer.
 *
 *  @param dictionary NSDictionary See +countryWithGEODictionary:(NSDictionary *)
 *
 *  @return APCountry
 */
- (instancetype)initWithGeoDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

/* Represents country 3 digits code ISO 3166-1 Alpha 3 */
@property (nonatomic, copy, readonly) NSString *code;

/* Represents country 2 digits code ISO 3166-1 Alpha 2 */
@property (nonatomic, copy, readonly) NSString *shortCode;

/* Represents country name */
@property (nonatomic, copy, readonly) NSString *name;

/* Represents country name in current locale */
@property (nonatomic, copy, readonly) NSString *localizedName;

@end

@interface APCountry (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end