//
//  LaunchViewController.m
//  aChallenger
//
//  Created by Gökhan KOCA on 23.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "LaunchViewController.h"
#import "Dispatch.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	__weak typeof(self) weakSelf = self;
	[Dispatch main:^{
		__strong typeof(weakSelf) strongSelf = weakSelf;
		[strongSelf openMain];
	} after:2];
}

- (void)openMain
{
//	MainPageNavigation
	
	NSLog(@"open main");
	
	UINavigationController * mainNavigation = [self.storyboard instantiateViewControllerWithIdentifier:@"MainPageNavigation"];
	
	[self presentViewController:mainNavigation animated:YES completion:nil];
}

@end
