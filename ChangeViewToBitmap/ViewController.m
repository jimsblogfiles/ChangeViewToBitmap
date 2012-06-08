//
//  ViewController.m
//  ChangeViewToBitmap
//
//  Created by James Border on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SphereView.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

-(void)captureViewAsBitMap:(UIView*)view;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

	SphereView *aSphereView =[[SphereView alloc]initWithFrame:self.view.bounds];

	// not so fast it'll be added below
	//[self.view addSubview:aSphereView];
	
	[self captureViewAsBitMap:aSphereView];
	
}

-(void)captureViewAsBitMap:(UIView*)view {

    UIGraphicsBeginImageContext(view.bounds.size);
	[view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *bitMapView = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *proxyView = [[UIImageView alloc] initWithImage:bitMapView];
    
	[self.view addSubview:proxyView];

}

- (void)viewDidUnload {

    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
