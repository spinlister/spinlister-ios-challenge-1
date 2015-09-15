//
//  SLDataGenerator.m
//  Spinlister
//
//  Created by Alex Evers on 9/15/2015.
//  Copyright (c) 2015 Spinlister. All rights reserved.
//

const NSInteger kSLCachedLocationsLimit = 25;

@implementation SLDataGenerator

+ (SLDataGenerator *)sharedGenerator
{
	static SLDataGenerator *sharedGenerator = nil
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
	srand(time(NULL));
	return (NSInteger)(rand() % (NSInteger)value);
}

NSArray *location_for_coordinate(double lat, double lng, double radius)
{
	double latVal = random_within_value(lat + (180 / M_PI) * (random_within_value(radius) / 6378137));
	double lngVal = random_within_value(lng + (180 / M_PI) * (random_within_value(radius) / 6378137) / cos(lat));
	return [[CLLocation alloc] initWithLatitude:latVal longitude:lngVal];
}

+ (NSArray *)coordinatesForLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude zoomRadius:(CLLocationDegrees)radius
{
	SLDataGenerator *generator = [self sharedGenerator];

	NSString *sectorKey = [NSString stringWithFormat:@"%.2f-%.2f", latitude, longitude];
	NSMutableArray *data = [_cachedLocations objectForKey:sectorKey];
	if (!data)
	{
		data = [NSMutableArray new];
		[_cachedLocations setObject:data forKey:sectorKey];
	}

	NSMutableArray *coordinates = [NSMutableArray new];
	for (NSInteger x = 0; x < 50; x++)
	{
		NSInteger idx = random_within_value(x);
		CLLocation *location =
		if (!location)
		{
			location = location_for_coordinate(latitude, longitude, radius);
			[data addObject:location];
		}
		[coordinates addObject:@[location.latitude, location.longitude]];
	}

	return data;
}

@end

