//
//  ApiClient.h
//  aChallenger
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Venue;

NS_ASSUME_NONNULL_BEGIN

@interface ApiClient : NSObject
+ (void)searchVenues:(NSString*)query
			  nearby:(NSString* _Nullable)nearby
			 success:(void(^)(NSArray<Venue *> *venues))success
			 failure:(void(^)(NSError* error))failure;
+ (void)getVenueDetail:(NSString*)identifier
			   success:(void(^)(Venue *venue))success
			   failure:(void(^)(NSError* error))failure;
@end

NS_ASSUME_NONNULL_END
