//
//  GKResponse.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "GKResponse.h"

@implementation GKResponse

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[GKResponse alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		if ([dict[@"venues"] isKindOfClass:[NSArray class]]) {
			NSMutableArray<GKVenue *> *venues = [NSMutableArray array];
			for (NSDictionary *item in dict[@"venues"]) {
				GKVenue *ven = [GKVenue fromJSONDictionary:item];
				[venues addObject:ven];
			}
			_venues = [[NSArray alloc] initWithArray:venues];
		}
		
	}
	return self;
}

@end
