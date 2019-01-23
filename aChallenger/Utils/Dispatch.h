//
//  Dispatch.h
//  aChallenger
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dispatch : NSObject
+ (void)main:(void(^)(void))async;
+ (void)main:(void(^)(void))async after:(NSInteger)seconds;
@end

NS_ASSUME_NONNULL_END
