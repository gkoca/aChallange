//
//  Venue.h
//  aChallenge
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VenueLocation.h"

NS_ASSUME_NONNULL_BEGIN

@interface Venue : NSObject
@property (nonatomic, nullable, copy)   NSString *identifier;
@property (nonatomic, nullable, copy)   NSString *name;
@property (nonatomic, nullable, copy)   NSString *tip;
@property (nonatomic, nullable, copy)   NSString *imageUrl;
@property (nonatomic, nullable, strong) VenueLocation *location;
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
