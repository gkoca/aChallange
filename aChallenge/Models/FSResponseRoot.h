//
//  FSResponseRoot.h
//  aChallenge
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSResponseRoot : NSObject
@property (nonatomic, strong) FSResponse *response;
+ (_Nullable instancetype)fromJSON:(NSString *)json
						  encoding:(NSStringEncoding)encoding
							 error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END


