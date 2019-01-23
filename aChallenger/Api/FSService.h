//
//  FSService.h
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKFSResponseRoot.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSService : NSObject

- (GKFSResponseRoot *_Nullable)searchWith:(NSString *)query and:(double)lat and:(double)lng;

@end

NS_ASSUME_NONNULL_END
