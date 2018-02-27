//
//  APPolygon.h
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreLocation/CoreLocation.h>

@interface APPolygon : NSObject

/**
 *  Convenience initializer.
 *
 *  @param points NSArray of points
 *
 *  @return APPolygon
 */
+ (instancetype)polygonWithPoints:(NSArray *)points;

/**
 *  Designated initializer
 *
 *  @param points NSArray
 *
 *  @return APPolygon
 */
- (instancetype)initWithPoints:(NSArray *)points;

/**
 *  Checks if polygon contains given point
 *
 *  @return contains point result BOOL
 */
- (BOOL)containsPoint:(CGPoint)point;

@end

@interface APPolygon (CoreLocation)

/**
 *  Checks if polygon contains given location
 *
 *  @return contains location result BOOL
 */
- (BOOL)containsLocation:(CLLocationCoordinate2D)location;

@end

@interface APPolygon (Unavailable)

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
