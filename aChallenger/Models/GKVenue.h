//
//  GKVenue.h
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKLocation.h"

NS_ASSUME_NONNULL_BEGIN

@interface GKVenue : NSObject
@property (nonatomic, nullable, copy)   NSString *identifier;
@property (nonatomic, nullable, copy)   NSString *name;
@property (nonatomic, nullable, strong) GKLocation *location;

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
