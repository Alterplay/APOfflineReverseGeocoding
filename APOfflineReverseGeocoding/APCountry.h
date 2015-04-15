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

/* Represents country 3 digits code */
@property (nonatomic, strong, readonly) NSString *code;

/* Represents country name */
@property (nonatomic, strong, readonly) NSString *name;

@end

@interface APCountry (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end