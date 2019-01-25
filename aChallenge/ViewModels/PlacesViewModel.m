//
//  PlacesViewModel.m
//  aChallenge
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "PlacesViewModel.h"
#import "Cache.h"
#import "ApiClient.h"

@implementation PlacesViewModel
- (void)load
{
	_venues = [Cache shared].venues;
}
- (NSInteger)numberOfVenues
{
	return (NSInteger)_venues.count;
}
- (NSString*)nameOf:(NSInteger)index
{
	return [_venues objectAtIndex:index].name;
}
- (NSString*)addressOf:(NSInteger)index
{
	return [_venues objectAtIndex:index].location.address;
}
- (NSString*)cityOf:(NSInteger)index
{
	return [_venues objectAtIndex:index].location.city;
}
- (NSString*)countryOf:(NSInteger)index
{
	return [_venues objectAtIndex:index].location.country;
}
- (void)getVenueDetail:(NSInteger)index
			   success:(void(^)(void))success
			   failure:(void(^)(NSError* error))failure
{
	[ApiClient getVenueDetail:[_venues objectAtIndex:index].identifier success:^(Venue * _Nonnull venue) {
		[Cache shared].selectedVenue = venue;
		success();
	} failure:^(NSError * _Nonnull error) {
		failure(error);
	}];
}
@end
