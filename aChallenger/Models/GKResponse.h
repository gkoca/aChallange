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
@property (nonatomic, nullable, copy) NSArray<GKVenue *> *venues;

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
