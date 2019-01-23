//
//  FSResponse.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "FSResponse.h"

@implementation FSResponse

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[FSResponse alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		if ([dict[@"venues"] isKindOfClass:[NSArray class]]) {
			NSMutableArray<Venue *> *venues = [NSMutableArray array];
			for (NSDictionary *item in dict[@"venues"]) {
				Venue *venue = [Venue fromJSONDictionary:item];
				[venues addObject:venue];
			}
			_venues = [[NSArray alloc] initWithArray:venues];
		}
		
	}
	return self;
}

@end
