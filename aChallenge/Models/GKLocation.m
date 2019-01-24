//
//  GKLocation.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "GKLocation.h"

@implementation GKLocation

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[GKLocation alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		_address = dict[@"address"];
		_lat = dict[@"lat"];
		_lng = dict[@"lng"];
		_city = dict[@"city"];
		_country = dict[@"country"];
	}
	return self;
}


@end
