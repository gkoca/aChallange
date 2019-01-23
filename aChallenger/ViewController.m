//
//  ViewController.m
//  aChallenger
//
//  Created by Gökhan KOCA on 22.01.2019.
//  Copyright © 2019 gkoca. All rights reserved.
//

#import "ViewController.h"
#import "GKFSResponseRoot.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSString* json = [self JSONFromFile];
	NSError* error;
	GKFSResponseRoot* root = [GKFSResponseRoot fromJSON:json encoding:NSUTF8StringEncoding error:&error];
	NSLog(@"root : %@",root);
	
	for (GKVenue* ven in root.response.venues) {
		NSLog(@"venue : %@", ven.name);
	}
	
}

- (NSString *)JSONFromFile
{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"json"];
	NSData *data = [NSData dataWithContentsOfFile:path];
	return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}
@end
