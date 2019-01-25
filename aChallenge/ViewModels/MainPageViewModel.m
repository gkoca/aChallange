//
//  MainPageViewModel.m
//  aChallenge
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "MainPageViewModel.h"
#import "ApiClient.h"
#import "Cache.h"

@implementation MainPageViewModel
- (void)search:(NSString*)query
		  near:(NSString* _Nullable)near
	   success:(void(^)(void))success
	   failure:(void(^)(NSError* error))failure
{
	[ApiClient searchVenues:query nearby:near success:^(NSArray<Venue *> * _Nonnull venues) {
		[Cache shared].venues = venues;
		success();
	} failure:^(NSError * _Nonnull error) {
		failure(error);
	}];
}
@end

