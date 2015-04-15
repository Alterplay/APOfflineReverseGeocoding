//
//  APReverseGeocoding.h
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "APCountry.h"

@interface APReverseGeocoding : NSObject

/**
 *  Instantiates geocoing with local geo json from bundle
 *
 *  @return APReverseGeocoding
 */
+ (instancetype)defaultGeocoding;

/**
 *  Instantiates geocoding with custom geo json.
 *  @note See: https://github.com/johan/world.geo.json
 *
 *  @param url NSURL
 *
 *  @return APReverseGeocoding
 */
+ (instancetype)geocodingWithGeoJSONURL:(NSURL *)url __attribute__((nonnull));

/**
 *  Designated initializer.
 *
 *  @param url NSURL. Sett +geocodingWithGeoJSONURL for details
 *
 *  @return APReverseGeocoding
 */
- (instancetype)initWithGeoJSONURL:(NSURL *)url __attribute__((nonnull)) NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, readonly) NSURL *url;

/**
 *  Returns country for a given location. Returns NIL if country cannot be geocoded
 *
 *  @param coordinate CLLocationCoordinate2D
 *
 *  @return APCountry
 */
- (APCountry *)geocodeCountryWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end

@interface APReverseGeocoding (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end