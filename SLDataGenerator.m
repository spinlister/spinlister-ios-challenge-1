//
//  SLDataGenerator.m
//  Spinlister
//
//  Created by Alex Evers on 9/15/2015.
//  Copyright (c) 2015 Spinlister. All rights reserved.
//

#import "SLDataGenerator.h"

const NSInteger kSLCachedLocationsLimit = 25;

@implementation SLDataGenerator

+ (SLDataGenerator *)sharedGenerator
{
	static SLDataGenerator *sharedGenerator = nil;
	static dispatch_once_t setupGenerator;

	dispatch_once(&setupGenerator, ^{
		sharedGenerator = [SLDataGenerator new];
	});

	return sharedGenerator;
}

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		_latitude = 0;
		_longitude = 0;
		_radius = 0;
		_cachedLocations = [NSCache new];
		_cachedLocations.countLimit = kSLCachedLocationsLimit;
	}
	return self;
}

#pragma mark -

NSInteger random_within_value(NSInteger value)
{
	if (!value)
		return 0;
	return (rand() * 10000) % value;
}

CLLocation *location_for_coordinate(double lat, double lng, double radius)
{
	double latVal = lat + (57.2958279f) * (random_within_value(radius) / 6378137.0);
	double lngVal = lng + (57.2958279f) * (random_within_value(radius) / 6378137.0) / cos(lat);
	return [[CLLocation alloc] initWithLatitude:latVal longitude:lngVal];
}

+ (NSArray *)coordinatesForLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude radius:(CLLocationDegrees)radius
{
	SLDataGenerator *generator = [self sharedGenerator];

	NSString *sectorKey = [NSString stringWithFormat:@"%.2f-%.2f", latitude, longitude];
	NSMutableArray *data = [generator.cachedLocations objectForKey:sectorKey];
	if (!data)
	{
		data = [NSMutableArray new];
		[generator.cachedLocations setObject:data forKey:sectorKey];
	}

	NSMutableArray *coordinates = [NSMutableArray new];
	for (NSInteger x = 1; x <= (40 + random_within_value(10)); x++)
	{
		NSInteger idx = abs(random_within_value(x));
		CLLocation *location = data.count < idx && idx >= 0 ? data[idx] : nil;
		if (!location)
		{
			location = location_for_coordinate(latitude, longitude, random_within_value(radius));
			[data addObject:location];
		}

		CLLocationCoordinate2D coordinate = location.coordinate;
		[coordinates addObject:@[@(coordinate.latitude), @(coordinate.longitude)]];
	}

	return coordinates;
}

@end

