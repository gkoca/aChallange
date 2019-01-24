//
//  LocationManager.m
//  aChallenger
//
//  Created by Gökhan KOCA on 24.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager

static LocationManager *sharedManager = nil;

+ (LocationManager*)sharedManager {
	static dispatch_once_t once;
	dispatch_once(&once, ^
				  {
					  sharedManager = [[LocationManager alloc] init];
				  });
	return sharedManager;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		
	}
	return self;
}
@end
