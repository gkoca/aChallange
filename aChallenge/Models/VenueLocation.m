//
//  VenueLocation.m
//  aChallenge
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "VenueLocation.h"

@implementation VenueLocation
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[VenueLocation alloc] initWithJSONDictionary:dict] : nil;
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
