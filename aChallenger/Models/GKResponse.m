//
//  GKResponse.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "GKResponse.h"
#import "Utils.h"

@interface GKResponse (JSONConversion)

@end

@implementation GKResponse
+ (NSDictionary<NSString *, NSString *> *)properties
{
	static NSDictionary<NSString *, NSString *> *properties;
	return properties = properties ? properties : @{
													@"venues": @"venues",
													};
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[GKResponse alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		[self setValuesForKeysWithDictionary:[self simplificate:dict]];
		_venues = map(_venues, λ(id x, [GKVenue fromJSONDictionary:x]));
	}
	return self;
}

- (NSDictionary *)JSONDictionary
{
	id dict = [[self dictionaryWithValuesForKeys:GKResponse.properties.allValues] mutableCopy];
	
	// Map values that need translation
	[dict addEntriesFromDictionary:@{
									 @"venues": map(_venues, λ(id x, [x JSONDictionary])),
									 }];
	
	return dict;
}

//MARK - simplification
- (NSDictionary *)simplificate:(NSDictionary *)dict
{
	return dict;
	return @{
			 @"venues" : dict[@"venues"]
			 };
}

@end
