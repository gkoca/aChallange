//
//  NetworkManager.m
//  aChallenger
//
//  Created by Gökhan on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager()

@end

@implementation NetworkManager

static NetworkManager *sharedManager = nil;

+ (NetworkManager*)sharedManager {
	static dispatch_once_t once;
	dispatch_once(&once, ^
				  {
					  sharedManager = [[NetworkManager alloc] init];
				  });
	return sharedManager;
}

- (id)init {
	if ((self = [super init])) {
	}
	return self;
}

@end
