//
//  VenueTableViewCell.h
//  aChallenge
//
//  Created by Gökhan KOCA on 24.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VenueTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@end

NS_ASSUME_NONNULL_END
