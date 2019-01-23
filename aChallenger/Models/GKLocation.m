//
//  GKLocation.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "GKLocation.h"

@interface GKLocation (JSONConversion)

@end

@implementation GKLocation
+ (NSDictionary<NSString *, NSString *> *)properties
{
	static NSDictionary<NSString *, NSString *> *properties;
	return properties = properties ? properties : @{
													@"address": @"address",
													@"lat": @"lat",
													@"lng": @"lng",
													@"distance": @"distance",
													@"city": @"city",
													@"country": @"country",
													};
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[GKLocation alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		[self setValuesForKeysWithDictionary:[self simplificate:dict]];
	}
	return self;
}

- (NSDictionary *)JSONDictionary
{
	return [self dictionaryWithValuesForKeys:GKLocation.properties.allValues];
}

//MARK - simplification
- (NSDictionary *)simplificate:(NSDictionary *)dict
{
	
	NSMutableDictionary *simpleDict = [[NSMutableDictionary alloc] init];
	if (dict[@"address"] != nil) {
		[simpleDict setValue:dict[@"address"] forKey:@"address"];
	}
	[simpleDict setValue:dict[@"lat"] forKey:@"lat"];
	[simpleDict setValue:dict[@"lng"] forKey:@"lng"];
	[simpleDict setValue:dict[@"distance"] forKey:@"distance"];
	[simpleDict setValue:dict[@"city"] forKey:@"city"];
	[simpleDict setValue:dict[@"country"] forKey:@"country"];
	
	
	
	return simpleDict;
	
}
@end
