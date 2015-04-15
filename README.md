[![Build Status](https://travis-ci.org/Alterplay/APOfflineReverseGeocoding.svg?branch=master)](https://travis-ci.org/Alterplay/APOfflineReverseGeocoding)

![teaser](/Screenshots/git-teaser-08.png)

# APOfflineReverseGeocoding
Offline reverse geocoding library written in Objective-C

### Usage
```objc
CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(48.296054999999996, 31.223209000000058);
APReverseGeocoding *reverseGeocoding = [APReverseGeocoding defaultGeocoding];
APCountry *country = [reverseGeocoding geocodeCountryWithCoordinate:coordinate];

NSLog(@"%@", country.code);
NSLog(@"%@", country.shortCode);
NSLog(@"%@", country.name);
```
Output:
```
UKR
UA
Ukraine
```
### Algorithm

http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html

### Inspiration and data

https://github.com/johan/world.geo.json

### Notes

Since it uses polygons algorithm the accuracy is not guaranteed for short ranges.

### Example 

Checkout example project at APReverseGeocodingExample folder.

![image](/Screenshots/1.png)

### Contribution

Feel free to place issues and pull requests.

### License
The MIT License (MIT)

Copyright (c) 2015 Alterplay

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
