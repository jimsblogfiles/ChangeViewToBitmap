//
//  SphereView.m
//  ChangeViewToBitmap
//
//  Created by James Border on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SphereView.h"

@implementation SphereView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];

    if (self) {

		self.backgroundColor = [UIColor clearColor];

    }

    return self;

}

- (void)drawRect:(CGRect)rect {
	
	//// General Declarations
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	//// Color Declarations
	UIColor* gradientColor2 = [UIColor colorWithRed: 0.99 green: 0.99 blue: 0.99 alpha: 1];
	
	//// Gradient Declarations
	NSArray* gradientColors = [NSArray arrayWithObjects: 
							   (id)gradientColor2.CGColor, 
							   (id)[UIColor redColor].CGColor, nil];
	CGFloat gradientLocations[] = {0, 1};
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
	
	//// Oval Drawing
	UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(83.5, 223.5, 597, 597)];
	CGContextSaveGState(context);
	[ovalPath addClip];
	CGContextDrawRadialGradient(context, gradient,
								CGPointMake(317.17, 432.11), 11.9,
								CGPointMake(360.95, 498.45), 275.11,
								kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
	CGContextRestoreGState(context);
	
	[[UIColor blackColor] setStroke];
	ovalPath.lineWidth = 1;
	[ovalPath stroke];
	
	//// Cleanup
	CGGradientRelease(gradient);
	CGColorSpaceRelease(colorSpace);	
	
}

@end
