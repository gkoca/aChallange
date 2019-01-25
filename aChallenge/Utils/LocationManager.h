//
//  LocationManager.h
//  aChallenge
//
//  Created by Gökhan KOCA on 24.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationManager : NSObject
+ (LocationManager*)sharedManager;
- (void)getCurrentLocation:(void(^)(CLLocation *location))success
				   failure:(void(^)(NSError* error))failure;
@end

NS_ASSUME_NONNULL_END
