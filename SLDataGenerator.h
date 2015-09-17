//
//  SLDataGenerator.h
//  Spinlister
//
//  Created by Alex Evers on 9/15/2015.
//  Copyright (c) 2015 Spinlister. All rights reserved.
//

@import Foundation;
@import CoreLocation;

@interface SLDataGenerator : NSObject

// These are left as read/write for testing purposes. They should not be set directly.
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;
@property (nonatomic, assign) CLLocationDegrees radius;
@property (nonatomic, strong) NSCache *cachedLocations;

/**
	@param latitude A double value indicating the latitude component of the viewport center.
	@param longitude A double value indicating the longitude component of the viewport center.
	@param radius A double value indicating the radius (diameter / 2) of the viewport from corner to center. This indicates the zoom level.

	@return An array of coordinate pairs for annotations/objects 'found' in the given viewport values.
 */
+ (NSArray *)coordinatesForLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude radius:(CLLocationDegrees)radius;

@end
