//
//  ApiClient.h
//  aChallenger
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GKVenue;

NS_ASSUME_NONNULL_BEGIN

@interface ApiClient : NSObject
+ (void)searchVenues:(NSString*)query
			  nearby:(NSString* _Nullable)nearby
			 success:(void(^)(NSArray<GKVenue *> *venues))success
			 failure:(void(^)(NSError* error))failure
			complete:(void(^)(void))complete;
@end

NS_ASSUME_NONNULL_END
