//
//  APPolygon.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "APPolygon.h"

@interface APPolygon ()

@property(nonatomic, strong, readwrite) NSArray *points;

@end

@implementation APPolygon

+ (instancetype)polygonWithPoints:(NSArray *)points
{
    return [[self alloc] initWithPoints:points];
}

- (instancetype)initWithPoints:(NSArray *)points
{
    self = [super init];
    if (self) {
        _points = points;
    }
    return self;
}

#pragma mark - Public

- (BOOL)containsPoint:(CGPoint)point
{
    NSUInteger nvert = self.points.count;

    double testx = point.y;
    double testy = point.x;
    
    double vertx[nvert];
    double verty[nvert];
    
    for (NSInteger i = 0; i < self.points.count; i++) {
        
        NSArray *pointInfo = self.points[i];
        
        double x = [pointInfo[0] doubleValue];
        double y = [pointInfo[1] doubleValue];
        vertx[i] = x;
        verty[i] = y;
    }
    
    NSInteger i, j = 0;
    BOOL contains = NO;
    for (i = 0, j = nvert-1; i < nvert; j = i++) {
        if ( ((verty[i]>testy) != (verty[j]>testy)) &&
            (testx < (vertx[j]-vertx[i]) * (testy-verty[i]) / (verty[j]-verty[i]) + vertx[i]) )
            contains = !contains;
    }
    return contains;
}

@end

@implementation APPolygon (CoreLocation)

- (BOOL)containsLocation:(CLLocationCoordinate2D)location
{
    return [self containsPoint:CGPointMake(location.latitude, location.longitude)];
}

@end
