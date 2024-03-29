//
//  NetworkManager.h
//  aChallenge
//
//  Created by Gökhan on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject
+ (NetworkManager*)sharedManager;
- (void)get:(NSString*)url
	 params:(NSDictionary*)params
	success:(void(^)(id data))success
	failure:(void(^)(NSURLSessionTask *operation, NSError* error))failure;
@end

NS_ASSUME_NONNULL_END
