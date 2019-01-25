//
//  LocationManager.m
//  aChallenge
//
//  Created by Gökhan KOCA on 24.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "LocationManager.h"

typedef void (^LocationSucces)(CLLocation *location);
typedef void (^LocationError)(NSError* error);

@interface LocationManager()<CLLocationManagerDelegate>
@property(strong, readonly)CLLocationManager *manager;
@property(readwrite, nonatomic, copy)LocationSucces successBlock;
@property(readwrite, nonatomic, copy)LocationError failureBlock;
@property (nonatomic) BOOL didCalledBack;
@end

@implementation LocationManager
static LocationManager *sharedManager = nil;
+ (LocationManager*)sharedManager {
	static dispatch_once_t once;
	dispatch_once(&once, ^
				  {
					  sharedManager = [[LocationManager alloc] init];
				  });
	return sharedManager;
}
- (instancetype)init
{
	self = [super init];
	if (self) {
		_manager = [[CLLocationManager alloc] init];
		_manager.delegate = self;
		_manager.distanceFilter = kCLDistanceFilterNone;
		_manager.desiredAccuracy = kCLLocationAccuracyBest;
		_didCalledBack = NO;
	}
	return self;
}
- (void)getCurrentLocation:(LocationSucces)success
				   failure:(LocationError)failure
{
	_successBlock = success;
	_failureBlock = failure;
	NSError *authError = [NSError errorWithDomain:@"LocationAuthorization" code:9401 userInfo:nil];
	switch ([CLLocationManager authorizationStatus]) {
		case kCLAuthorizationStatusNotDetermined:
			[_manager requestWhenInUseAuthorization];
			break;
		case kCLAuthorizationStatusRestricted:
			_failureBlock(authError);
			break;
		case kCLAuthorizationStatusDenied:
			_failureBlock(authError);
			break;
		case kCLAuthorizationStatusAuthorizedAlways:
			_didCalledBack = NO;
			[_manager startUpdatingLocation];
			break;
		case kCLAuthorizationStatusAuthorizedWhenInUse:
			_didCalledBack = NO;
			[_manager startUpdatingLocation];
			break;
	}
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
	[_manager stopUpdatingLocation];
	NSError *nullError = [NSError errorWithDomain:@"LocationIsNull" code:9404 userInfo:nil];
	NSLog(@"locationManager didUpdateLocations : %@", locations);
	if (locations.lastObject) {
		if (!_didCalledBack) {
			_didCalledBack = YES;
			_successBlock(locations.lastObject);
		}
	} else {
		if (!_didCalledBack) {
			_didCalledBack = YES;
			_failureBlock(nullError);
		}
	}
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	_failureBlock(error);
}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
	NSError *authError = [NSError errorWithDomain:@"LocationAuthorization" code:9401 userInfo:nil];
	switch (status) {
		case kCLAuthorizationStatusNotDetermined:
			[_manager requestWhenInUseAuthorization];
			break;
		case kCLAuthorizationStatusRestricted:
			_failureBlock(authError);
			break;
		case kCLAuthorizationStatusDenied:
			_failureBlock(authError);
			break;
		case kCLAuthorizationStatusAuthorizedAlways:
			[_manager startUpdatingLocation];
			break;
		case kCLAuthorizationStatusAuthorizedWhenInUse:
			[_manager startUpdatingLocation];
			break;
	}
	[_manager requestWhenInUseAuthorization];
}
@end
