//
//  Dispatch.m
//  aChallenger
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "Dispatch.h"

@implementation Dispatch

+ (void)main:(void(^)(void))async
{
	dispatch_async(dispatch_get_main_queue(), ^{
		async();
	});
}

+ (void)main:(void(^)(void))async after:(NSInteger)seconds
{
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		async();
	});
}

@end
