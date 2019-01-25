//
//  VenueDetailViewModel.m
//  aChallenge
//
//  Created by Gökhan KOCA on 25.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "VenueDetailViewModel.h"
#import "Cache.h"

@implementation VenueDetailViewModel
- (void)load
{
	_venue = [Cache shared].selectedVenue;
}
- (NSString*)getVenueName
{
	return _venue.name;
}
- (NSString*)getVenueTip
{
	return _venue.tip;
}
- (CLLocationDegrees)getLatitude
{
	return _venue.location.lat.doubleValue;
}
- (CLLocationDegrees)getLongtitude
{
	return _venue.location.lng.doubleValue;
}
- (NSURL*)getImageUrl
{
	if (_venue.imageUrl) {
		return [[NSURL alloc] initWithString:_venue.imageUrl];
	}
	return nil;
}
@end
