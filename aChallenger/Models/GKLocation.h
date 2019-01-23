//
//  GKLocation.h
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GKLocation : NSObject
@property (nonatomic, nullable, copy) NSString *address;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;
@property (nonatomic, assign) NSInteger distance;
@property (nonatomic, copy)   NSString *city;
@property (nonatomic, copy)   NSString *country;

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

NS_ASSUME_NONNULL_END
