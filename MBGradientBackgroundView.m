//
//  MBGradientBackgroundView.m
//  Berater
//
//  Created by Michal Bencur on 10/5/10.
//  Copyright 2010 michalbencur.com. All rights reserved.
//

#import "MBGradientBackgroundView.h"


@implementation MBGradientBackgroundView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	
    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 0.91, 0.91, 0.91, 1.0,
		0.71, 0.71, 0.71, 1.0 };
	
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
	
    CGRect currentBounds = self.bounds;
    CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
    CGPoint bottomCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMaxY(currentBounds));
    CGContextDrawLinearGradient(context, glossGradient, topCenter, bottomCenter, 0);
	
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace);
	
	CGContextRestoreGState(context);
}

- (void)dealloc {
    [super dealloc];
}


@end
