//
//  MBClockView.m
//  MBClock
//
//  Created by Michal Bencur on 3/12/11.
//  Copyright 2011 MB. All rights reserved.
//

#import "MBClockView.h"
#import <QuartzCore/QuartzCore.h>

@interface MBClockView () {
    NSMutableArray *numberLayers;
}

- (void)setupNumbers;

@end

@implementation MBClockView

- (void)dealloc
{
    [numberLayers release];
    [super dealloc];
}

- (void)awakeFromNib
{
    [self setupNumbers];
}

- (void)setupNumbers
{
    numberLayers = [[NSMutableArray alloc] init];

    CGPoint m = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    CGFloat w = 90.0;
    
	NSInteger n = 1;
	CGFloat numberAngle = (2 * M_PI / 12);
	while (numberAngle < (2 * M_PI)) {
		CATextLayer *layer = [CATextLayer layer];
		layer.position = CGPointMake(m.x + w*cos(numberAngle - M_PI_2), m.y + w*sin(numberAngle - M_PI_2));
		layer.bounds = CGRectMake(0, 0, 30, 30);
		layer.foregroundColor = [UIColor colorWithWhite:0.3 alpha:1.0].CGColor;
		layer.font = @"Helvetica Neue Bold";
		layer.fontSize = 24;
		layer.alignmentMode = kCAAlignmentCenter;
		layer.contentsScale = [[UIScreen mainScreen] scale];
		layer.string = [NSString stringWithFormat:@"%i", n];
		layer.cornerRadius = 15;
		[self.layer addSublayer:layer];
		[numberLayers addObject:layer];
		numberAngle += (2 * M_PI / 12);
		n++;
	}
}

@end