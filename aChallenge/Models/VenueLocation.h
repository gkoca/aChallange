//
//  VenueLocation.h
//  aChallenge
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VenueLocation : NSObject
@property (nonatomic, nullable, copy)   NSString *address;
@property (nonatomic, nullable, strong) NSNumber *lat;
@property (nonatomic, nullable, strong) NSNumber *lng;
@property (nonatomic, nullable, strong) NSNumber *distance;
@property (nonatomic, nullable, copy)   NSString *city;
@property (nonatomic, nullable, copy)   NSString *country;
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
