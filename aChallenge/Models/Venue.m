//
//  Venue.m
//  aChallenge
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "Venue.h"

@implementation Venue
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[Venue alloc] initWithJSONDictionary:dict] : nil;
}
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		_identifier = dict[@"id"];
		_name =  dict[@"name"];
		_location = [VenueLocation fromJSONDictionary:dict[@"location"]];
		if (dict[@"tips"] && dict[@"tips"][@"groups"]) {
			NSArray *groups = dict[@"tips"][@"groups"];
			if (groups.firstObject) {
				NSDictionary *group = groups.firstObject;
				if (group) {
					NSArray *items = group[@"items"];
					if (items.firstObject) {
						_tip = items.firstObject[@"text"];
					}
				}
			}
		}
		if (dict[@"bestPhoto"]) {
			NSString *prefix = dict[@"bestPhoto"][@"prefix"];
			NSString *suffix = dict[@"bestPhoto"][@"suffix"];
			if (suffix && prefix) {
				_imageUrl = [[NSString alloc] initWithFormat:@"%@1024x1024%@",prefix,suffix];
			}
		}
	}
	return self;
}
@end
