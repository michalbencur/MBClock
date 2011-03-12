//
//  MBClockGlassReflectionLayer.m
//  MBClock
//
//  Created by Michal Bencur on 3/12/11.
//  Copyright 2011 michalbencur.com. All rights reserved.
//

#import "MBClockGlassReflectionLayer.h"


@implementation MBClockGlassReflectionLayer

- (void)drawInContext:(CGContextRef)context
{
    CGRect rect = self.bounds;
    CGPoint topCenter = CGPointMake(CGRectGetMidX(rect), 0.0f);
    CGPoint bottomCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    
    // setup transparent gradient
    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 1.0, 0.9,
		1.0, 1.0, 1.0, 0.3 };
	
    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);

    // draw first circle
    CGFloat radius = 105.0;
    CGFloat y = bottomCenter.y - radius;
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, CGRectMake(bottomCenter.x - radius, y, 2 * radius, 2 * radius));
    CGContextClip(context);
    	
    CGContextDrawLinearGradient(context, glossGradient, topCenter, bottomCenter, 0);
	
    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace);

    // draw second circle in clear blend mode
    radius = 150.0;
    y = y + 50;
    CGContextBeginPath(context);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextAddEllipseInRect(context, CGRectMake(bottomCenter.x - radius, y, 2 * radius, 2 * radius));
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextRestoreGState(context);
}

@end
