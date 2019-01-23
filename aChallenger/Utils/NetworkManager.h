//
//  NetworkManager.h
//  aChallenger
//
//  Created by Gökhan on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (id)sharedManager;
- (void)get:(NSString*)url
	 params:(NSDictionary*)params
	success:(void(^)(id data))success
	failure:(void(^)(NSURLSessionTask *operation, NSError* error))failure
   complete:(void(^)(void))complete;
@end

NS_ASSUME_NONNULL_END
