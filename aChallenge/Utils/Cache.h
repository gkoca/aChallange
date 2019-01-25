//
//  Cache.h
//  aChallenge
//
//  Created by Gökhan KOCA on 24.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Venue;

NS_ASSUME_NONNULL_BEGIN

@interface Cache : NSObject
@property(strong, nonatomic)NSArray<Venue *> *venues;
@property(strong, nonatomic)Venue *selectedVenue;
- (void)cleanCache;
+ (Cache*)shared;
@end

NS_ASSUME_NONNULL_END
