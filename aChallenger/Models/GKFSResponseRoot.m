//
//  GKFSResponseRoot.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "GKFSResponseRoot.h"
#import "Utils.h"



@interface GKFSResponseRoot (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

GKFSResponseRoot *_Nullable GKFSResponseRootFromData(NSData *data, NSError **error)
{
	@try {
		id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
		return *error ? nil : [GKFSResponseRoot fromJSONDictionary:json];
	} @catch (NSException *exception) {
		*error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
		return nil;
	}
}

GKFSResponseRoot *_Nullable GKFSResponseRootFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
	return GKFSResponseRootFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable GKFSResponseRootToData(GKFSResponseRoot *fSResponseRoot, NSError **error)
{
	@try {
		id json = [fSResponseRoot JSONDictionary];
		NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
		return *error ? nil : data;
	} @catch (NSException *exception) {
		*error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
		return nil;
	}
}

NSString *_Nullable GKFSResponseRootToJSON(GKFSResponseRoot *fSResponseRoot, NSStringEncoding encoding, NSError **error)
{
	NSData *data = GKFSResponseRootToData(fSResponseRoot, error);
	return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation GKFSResponseRoot
+ (NSDictionary<NSString *, NSString *> *)properties
{
	static NSDictionary<NSString *, NSString *> *properties;
	return properties = properties ? properties : @{
													@"response": @"response",
													};
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
	return GKFSResponseRootFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
	return GKFSResponseRootFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
	return dict ? [[GKFSResponseRoot alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
	if (self = [super init]) {
		[self setValuesForKeysWithDictionary:[self simplificate:dict]];
		_response = [GKResponse fromJSONDictionary:(id)_response];
	}
	return self;
}

- (NSDictionary *)JSONDictionary
{
	id dict = [[self dictionaryWithValuesForKeys:GKFSResponseRoot.properties.allValues] mutableCopy];
	
	// Map values that need translation
	[dict addEntriesFromDictionary:@{
									 @"response": [_response JSONDictionary],
									 }];
	
	return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
	return GKFSResponseRootToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
	return GKFSResponseRootToJSON(self, encoding, error);
}

//MARK - simplification
- (NSDictionary *)simplificate:(NSDictionary *)dict
{
	return @{
			 @"response" : dict[@"response"]
			 };
}

@end


