//
//  GKVenue.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "GKVenue.h"
#import "Utils.h"

@implementation GKVenue

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[GKVenue alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		_identifier = dict[@"id"];
		_name =  dict[@"name"];
		_location = [GKLocation fromJSONDictionary:dict[@"location"]];
	}
	return self;
}

@end
