//
//  GKResponse.h
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKVenue.h"

NS_ASSUME_NONNULL_BEGIN

@interface GKResponse : NSObject
@property (nonatomic, copy) NSArray<GKVenue *> *venues;

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

NS_ASSUME_NONNULL_END
