//
//  MainPageViewController.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "MainPageViewController.h"
#import "MainPageViewModel.h"


@interface MainPageViewController ()
@property (weak, nonatomic) IBOutlet UITextField *queryField;
@property (strong, nonatomic) IBOutlet MainPageViewModel *viewModel;
@end

@implementation MainPageViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

 /*
	[ApiClient searchVenues:@"cafe" nearby:nil success:^(NSArray<GKVenue *> * _Nonnull venues) {
		NSLog(@"123%@",venues);
	} failure:^(NSError * _Nonnull error) {
		NSLog(@"%@",error.localizedDescription);
	} complete:^{
		NSLog(@"complete");
	}];
	
	 MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	 hud.mode = MBProgressHUDModeAnnularDeterminate;
	 hud.label.text = @"Loading";
	 [self doSomethingInBackgroundWithProgressCallback:^(float progress) {
	 hud.progress = progress;
	 } completionCallback:^{
	 [hud hideAnimated:YES];
	 }];
	 */
}
- (IBAction)onSearch:(UIButton *)sender {
	
}

@end
