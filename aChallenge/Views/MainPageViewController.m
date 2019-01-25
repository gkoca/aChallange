//
//  MainPageViewController.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "MainPageViewController.h"
#import "MainPageViewModel.h"
#import "PlacesTableViewController.h"
#import "MBProgressHUD.h"
#import "Cache.h"

@interface MainPageViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *queryField;
@property (weak, nonatomic) IBOutlet UITextField *nearField;
@property (strong, nonatomic) IBOutlet MainPageViewModel *viewModel;
@property (strong, nonatomic) PlacesTableViewController *places;
@end

@implementation MainPageViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	_places = [self.storyboard instantiateViewControllerWithIdentifier:@"PlacesTableView"];
	_places.title = @"Places";
	_queryField.delegate = self;
}
- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	[[Cache shared] cleanCache];
}
-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	_queryField.text = @"";
	_nearField.text = @"";
}
- (IBAction)onSearch:(UIButton *)sender
{
	if (_queryField.text.length >= 3) {
		[self.view endEditing:YES];
		MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
		[_viewModel search:_queryField.text near:_nearField.text success:^{
			[hud hideAnimated:YES];
			[self.navigationController pushViewController:self->_places animated:YES];
		} failure:^(NSError * _Nonnull error) {
			NSLog(@"fail : %@",error.localizedDescription);
			[hud hideAnimated:YES];
		}];
	} else {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Text field should be at least 3 characters." preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
		[alert addAction:ok];
		[self presentViewController:alert animated:YES completion:nil];
	}
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	if ([string isEqualToString:@". "]) {
		return NO;
	}
	const char * _char = [string cStringUsingEncoding:NSUTF8StringEncoding];
	int isBackSpace = strcmp(_char, "\b");
	if (isBackSpace == -8) {
		return YES;
	}
	BOOL canEdit=NO;
	NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "];
	for (int i = 0; i < [string length]; i++) {
		unichar c = [string characterAtIndex:i];
		if (![myCharSet characterIsMember:c]) {
			canEdit=NO;
		} else {
			canEdit=YES;
		}
	}
	return canEdit;
}
@end
