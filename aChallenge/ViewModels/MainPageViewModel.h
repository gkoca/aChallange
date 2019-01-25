//
//  MainPageViewModel.h
//  aChallenge
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageViewModel : NSObject
- (void)search:(NSString*)query
		  near:(NSString* _Nullable)near
	   success:(void(^)(void))success
	   failure:(void(^)(NSError* error))failure;
@end

NS_ASSUME_NONNULL_END
