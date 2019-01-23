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


@implementation GKFSResponseRoot


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
		_response = [GKResponse fromJSONDictionary:dict[@"response"]];
	}
	return self;
}

@end


