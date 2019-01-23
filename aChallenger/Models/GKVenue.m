//
//  GKVenue.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "GKVenue.h"
#import "Utils.h"

@interface GKVenue (JSONConversion)

@end

@implementation GKVenue
+ (NSDictionary<NSString *, NSString *> *)properties
{
	static NSDictionary<NSString *, NSString *> *properties;
	return properties = properties ? properties : @{
													@"id": @"identifier",
													@"name": @"name",
													@"location": @"location",
													};
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[GKVenue alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		[self setValuesForKeysWithDictionary:[self simplificate:dict]];
		_location = [GKLocation fromJSONDictionary:(id)_location];
	}
	return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
	id resolved = GKVenue.properties[key];
	if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
	id dict = [[self dictionaryWithValuesForKeys:GKVenue.properties.allValues] mutableCopy];
	
	// Rewrite property names that differ in JSON
	for (id jsonName in GKVenue.properties) {
		id propertyName = GKVenue.properties[jsonName];
		if (![jsonName isEqualToString:propertyName]) {
			dict[jsonName] = dict[propertyName];
			[dict removeObjectForKey:propertyName];
		}
	}
	
	// Map values that need translation
	[dict addEntriesFromDictionary:@{
									 @"location": [_location JSONDictionary],
									 }];
	
	return dict;
}

//MARK - simplification
- (NSDictionary *)simplificate:(NSDictionary *)dict
{
	return dict;
	return @{
			 @"id" : dict[@"id"],
			 @"name" : dict[@"name"],
			 @"location" : dict[@"location"]
			 };
}

@end
