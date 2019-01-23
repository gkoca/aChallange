//
//  PlacesViewModel.h
//  aChallenger
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Venue.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlacesViewModel : NSObject
@property(strong, nonatomic) NSArray<Venue *> *venues;
@end

NS_ASSUME_NONNULL_END
