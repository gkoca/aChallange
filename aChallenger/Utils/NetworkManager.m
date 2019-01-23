//
//  NetworkManager.m
//  aChallenger
//
//  Created by Gökhan on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager()

@property(strong, readonly)AFHTTPSessionManager *manager;
@property(nonatomic, copy) NSString *apiVersion;
@property(nonatomic, copy) NSString *clientId;
@property(nonatomic, copy) NSString *clientSecret;

@end

@implementation NetworkManager

static NetworkManager *sharedManager = nil;

+ (NetworkManager*)sharedManager {
	static dispatch_once_t once;
	dispatch_once(&once, ^
				  {
					  sharedManager = [[NetworkManager alloc] init];
				  });
	return sharedManager;
}

- (id)init {
	if ((self = [super init])) {
		
		_manager = [AFHTTPSessionManager manager];
		_apiVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"API_VERSION"];
		_clientSecret = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CLIENT_SECRET"];
		_clientId = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CLIENT_ID"];
		
	}
	return self;
}

- (void)get:(NSString*)url
	 params:(NSDictionary*)params
	success:(void(^)(id data))success
	failure:(void(^)(NSURLSessionTask *operation, NSError* error))failure
   complete:(void(^)(void))complete
{
	NSMutableDictionary *addingDefaultParams = [[NSMutableDictionary alloc] initWithDictionary:params];
	[addingDefaultParams setObject:_apiVersion forKey:@"v"];
	[addingDefaultParams setObject:_clientId forKey:@"client_id"];
	[addingDefaultParams setObject:_clientSecret forKey:@"client_secret"];
	
	[_manager GET:url parameters:addingDefaultParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		success(responseObject);
		complete();
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		failure(task,error);
		complete();
	}];
}
@end
