//
//  ApiClient.m
//  aChallenger
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "ApiClient.h"
#import "NetworkManager.h"
#import "FSResponseRoot.h"

NS_ASSUME_NONNULL_BEGIN

@implementation ApiClient

+ (void)searchVenues:(NSString*)query
		  nearby:(NSString* _Nullable)nearby
			 success:(void(^)(NSArray<GKVenue *> *venues))success
			 failure:(void(^)(NSError* error))failure
			complete:(void(^)(void))complete
{
	
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	if (!nearby) {
		NSLog(@"nearby is null");
		[params setObject:@"40.7243,-74.0018" forKey:@"ll"];
	} else {
		[params setObject:nearby forKey:@"near"];
	}
	[params setObject:query forKey:@"query"];
	[params setObject:@(50) forKey:@"limit"];
	[params setObject:@"global" forKey:@"intent"];
	[params setObject:@(500) forKey:@"radius"];
	
	NetworkManager* manager = [NetworkManager sharedManager];
	[manager get:@"https://api.foursquare.com/v2/venues/search" params:params success:^(id  _Nonnull data) {
		NSError *error;
		FSResponseRoot *root = [FSResponseRoot fromJSONDictionary:data];
		if (error) {
			failure(error);
		} else {
			success(root.response.venues);
		}
	} failure:^(NSURLSessionTask * _Nonnull operation, NSError * _Nonnull error) {
		failure(error);
	} complete:^{
		complete();
	}];
}


@end

NS_ASSUME_NONNULL_END
