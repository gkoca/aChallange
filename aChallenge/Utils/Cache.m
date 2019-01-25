//
//  Cache.m
//  aChallenge
//
//  Created by Gökhan KOCA on 24.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "Cache.h"

@implementation Cache

static Cache *shared = nil;

+ (Cache*)shared {
	static dispatch_once_t once;
	dispatch_once(&once, ^
				  {
					  shared = [[Cache alloc] init];
				  });
	return shared;
}

- (instancetype)init
{
	self = [super init];
	return self;
}
- (void)cleanCache
{
	_venues = nil;
	_selectedVenue = nil;
}
@end
