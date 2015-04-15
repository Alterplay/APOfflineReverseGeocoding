//
//  ViewController.m
//  APReverseGeocodingExample
//
//  Created by Sergii Kryvoblotskyi on 4/15/15.
//  Copyright (c) 2015 Sergii Kryvoblotskyi. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "APReverseGeocoding.h"

@interface ViewController () <MKMapViewDelegate>

@property (nonatomic, strong) APReverseGeocoding *reverseGeocoding;
@property (strong, nonatomic) IBOutlet UILabel *countryNameLabel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _reverseGeocoding = [APReverseGeocoding defaultGeocoding];
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    CLLocationCoordinate2D centre = [mapView centerCoordinate];
    APCountry *country = [self.reverseGeocoding geocodeCountryWithCoordinate:centre];
    self.countryNameLabel.text = country.name;
}

@end
