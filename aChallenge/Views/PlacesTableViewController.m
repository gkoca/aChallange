//
//  PlacesTableViewController.m
//  aChallenger
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "PlacesTableViewController.h"
#import "PlacesViewModel.h"
#import "VenueTableViewCell.h"
#import "VenueDetailViewController.h"
#import "MZFormSheetPresentationViewController.h"
#import "MBProgressHUD.h"

@interface PlacesTableViewController ()
@property (strong, nonatomic) IBOutlet PlacesViewModel *viewModel;
@property (strong, nonatomic) VenueDetailViewController *venueDetail;
@property (strong, nonatomic) MZFormSheetPresentationViewController *formSheetController;
@end

@implementation PlacesTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[_viewModel load];
	[self.tableView reloadData];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_viewModel numberOfVenues];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VenueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"venueCell" forIndexPath:indexPath];
	cell.nameLabel.text = [_viewModel nameOf:indexPath.row];
	cell.addressLabel.text = [_viewModel addressOf:indexPath.row];
	cell.cityLabel.text = [_viewModel cityOf:indexPath.row];
	cell.countryLabel.text = [_viewModel countryOf:indexPath.row];    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[_viewModel getVenueDetail:indexPath.row success:^{
		[hud hideAnimated:YES];
		[self createFormSheet];
	} failure:^(NSError * _Nonnull error) {
		NSLog(@"fail : %@",error.localizedDescription);
		[hud hideAnimated:YES];
	}];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)createFormSheet
{
	_venueDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"VenueDetailView"];
	_formSheetController = [[MZFormSheetPresentationViewController alloc] initWithContentViewController:_venueDetail];
	_formSheetController.contentViewCornerRadius = 12;
	_formSheetController.contentViewControllerTransitionStyle = MZFormSheetPresentationTransitionStyleFade;
	_formSheetController.presentationController.shouldDismissOnBackgroundViewTap = YES;
	CGSize size = [UIScreen mainScreen].bounds.size;
	float width = size.width - 64;
	float height = size.height - 172;
	_formSheetController.presentationController.contentViewSize = CGSizeMake(width, height);
	[self presentViewController:_formSheetController animated:YES completion:nil];
}

@end
