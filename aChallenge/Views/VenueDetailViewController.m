//
//  VenueDetailViewController.m
//  aChallenge
//
//  Created by Gökhan KOCA on 24.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "VenueDetailViewController.h"
#import "VenueDetailViewModel.h"
#import <MapKit/MapKit.h>
#import "UIImageView+AFNetworking.h"

@interface VenueDetailViewController ()
@property (strong, nonatomic) IBOutlet VenueDetailViewModel *viewModel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipTitleHeightConstraint; //24
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipLabelHeightConstraint; //80
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightConstraint; //200
@end

@implementation VenueDetailViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	[_viewModel load];
	[self configureMapView];
	[self configureImageView];
	[self configureNameLabel];
	[self configureTipLabel];
}
- (void)configureMapView
{
	CLLocationCoordinate2D location = CLLocationCoordinate2DMake([_viewModel getLatitude], [_viewModel getLongtitude]);
	MKCoordinateSpan span = MKCoordinateSpanMake(0.02, 0.02);
	MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
	[_mapView setRegion:region animated:YES];
	MKPointAnnotation *ann = [[MKPointAnnotation alloc] init];
	ann.coordinate = location;
	[_mapView addAnnotation:ann];
}
- (void)configureImageView
{
	if ([_viewModel getImageUrl]) {
		[_imageView setImageWithURL:[_viewModel getImageUrl]];
	} else {
		_imageViewHeightConstraint.constant = 0;
	}
}
- (void)configureNameLabel
{
	_nameLabel.text = [_viewModel getVenueName];
}
- (void)configureTipLabel
{
	if ([_viewModel getVenueTip]) {
		_tipLabel.text = [_viewModel getVenueTip];
	} else {
		_tipLabelHeightConstraint.constant = 0;
		_tipTitleHeightConstraint.constant = 0;
	}
}
@end
