//
//  PlacesViewModel.h
//  aChallenge
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Venue.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlacesViewModel : NSObject

@property(strong, nonatomic) NSArray<Venue *> *venues;
- (void)load;
- (NSInteger)numberOfVenues;
- (NSString*)nameOf:(NSInteger)index;
- (NSString*)addressOf:(NSInteger)index;
- (NSString*)cityOf:(NSInteger)index;
- (NSString*)countryOf:(NSInteger)index;
- (void)getVenueDetail:(NSInteger)index
			   success:(void(^)(void))success
			   failure:(void(^)(NSError* error))failure;
@end

NS_ASSUME_NONNULL_END
