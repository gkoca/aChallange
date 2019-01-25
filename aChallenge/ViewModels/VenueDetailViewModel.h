//
//  VenueDetailViewModel.h
//  aChallenge
//
//  Created by Gökhan KOCA on 25.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Venue.h"

NS_ASSUME_NONNULL_BEGIN

@interface VenueDetailViewModel : NSObject
@property(strong, nonatomic) Venue *venue;
- (void)load;
- (NSString*)getVenueName;
- (NSString*)getVenueTip;
- (CLLocationDegrees)getLatitude;
- (CLLocationDegrees)getLongtitude;
- (NSURL*)getImageUrl;
@end

NS_ASSUME_NONNULL_END
