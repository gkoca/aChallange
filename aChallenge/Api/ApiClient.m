//
//  ApiClient.m
//  aChallenge
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "ApiClient.h"
#import "NetworkManager.h"
#import "FSResponseRoot.h"
#import "LocationManager.h"

NS_ASSUME_NONNULL_BEGIN
static NSString *SEARCH_VENUES_ENDPOINT = @"https://api.foursquare.com/v2/venues/search";
static NSString *DETAILS_VENUE_ENDPOINT = @"https://api.foursquare.com/v2/venues";
@implementation ApiClient

+ (void)searchVenues:(NSString*)query
			  nearby:(NSString* _Nullable)nearby
			 success:(void(^)(NSArray<Venue *> *venues))success
			 failure:(void(^)(NSError* error))failure
{
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	[params setObject:query forKey:@"query"];
	[params setObject:@(50) forKey:@"limit"];
	[params setObject:@(500) forKey:@"radius"];
	if (nearby && nearby.length > 0) {
		[params setObject:nearby forKey:@"near"];
		[params setObject:@"global" forKey:@"intent"];
		[[NetworkManager sharedManager] get:SEARCH_VENUES_ENDPOINT params:params success:^(id  _Nonnull data) {
			NSError *nullError = [NSError errorWithDomain:@"data is null" code:9404 userInfo:nil];
			FSResponseRoot *root = [FSResponseRoot fromJSONDictionary:data];
			if (root) {
				success(root.response.venues);
			} else {
				failure(nullError);
			}
			
		} failure:^(NSURLSessionTask * _Nonnull operation, NSError * _Nonnull error) {
			failure(error);
		}];
	} else {
		NSLog(@"nearby is null");
		[params setObject:@"browse" forKey:@"intent"];
		[[LocationManager sharedManager]getCurrentLocation:^(CLLocation * _Nonnull location) {
			NSString *llParam = [[NSString alloc] initWithFormat:@"%f,%f",location.coordinate.latitude, location.coordinate.longitude];
			[params setObject:llParam forKey:@"ll"];
			[[NetworkManager sharedManager] get:SEARCH_VENUES_ENDPOINT params:params success:^(id  _Nonnull data) {
				NSError *nullError = [NSError errorWithDomain:@"data is null" code:9404 userInfo:nil];
				FSResponseRoot *root = [FSResponseRoot fromJSONDictionary:data];
				if (root) {
					success(root.response.venues);
				} else {
					failure(nullError);
				}
			} failure:^(NSURLSessionTask * _Nonnull operation, NSError * _Nonnull error) {
				failure(error);
			}];
		} failure:^(NSError * _Nonnull error) {
			failure(error);
		}];
	}
}
+ (void)getVenueDetail:(NSString*)identifier
			   success:(void(^)(Venue *venue))success
			   failure:(void(^)(NSError* error))failure
{
	NSString *url = [[NSString alloc] initWithFormat:@"%@/%@",DETAILS_VENUE_ENDPOINT,identifier];
	[[NetworkManager sharedManager]get:url params:@{} success:^(id  _Nonnull data) {
		NSError *nullError = [NSError errorWithDomain:@"data is null" code:9404 userInfo:nil];
		NSDictionary *responseDict = data[@"response"];
		if (responseDict) {
			NSDictionary *venueDict = responseDict[@"venue"];
			if (venueDict) {
				Venue *venueDetail = [Venue fromJSONDictionary:venueDict];
				success(venueDetail);
			} else {
				failure(nullError);
			}
		} else {
			failure(nullError);
		}
	} failure:^(NSURLSessionTask * _Nonnull operation, NSError * _Nonnull error) {
		failure(error);
	}];
}
@end

NS_ASSUME_NONNULL_END
