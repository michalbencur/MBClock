//
//  MBClockHandLayer.m
//  MBClock
//
//  Created by Michal Bencur on 3/12/11.
//  Copyright 2011 michalbencur.com. All rights reserved.
//

#import "MBClockHandLayer.h"


@implementation MBClockHandLayer

@synthesize color;

- (void)dealloc
{
    self.color = nil;
    [super dealloc];
}

- (void)setFrame:(CGRect)frame
{
    self.anchorPoint = CGPointMake(frame.size.height / 2 / frame.size.width, 0.5);
    [super setFrame:frame];
}

- (void)drawInContext:(CGContextRef)context
{
    // inset the rect, otherwise there's not enough place for drawing
    CGRect rect = CGRectInset(self.bounds, 1, 1);
    CGFloat h = rect.size.height;
    CGPoint p = rect.origin;
    CGPoint a = CGPointMake(p.x + h/2, p.y + h/2); 
    
    CGContextSaveGState(context);
    if (self.color == nil) {
        self.color = [UIColor colorWithWhite:0.3 alpha:1.0];
    }
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    // draw middle-clock outer circle
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, CGRectMake(p.x, p.y, h, h));
    CGContextDrawPath(context, kCGPathFill);
    
    // draw middle-clock inner clear circle
    CGContextSaveGState(context);
    CGContextBeginPath(context);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextAddEllipseInRect(context, CGRectMake(p.x + h / 4.0, p.y + h / 4.0, h / 2.0, h / 2.0));
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    // draw hand
    CGContextBeginPath(context);
    CGFloat angle = M_PI_4;
    CGContextMoveToPoint(context, a.x + h*cos(angle)/2, a.y - h*sin(angle)/2);
    CGContextAddLineToPoint(context, rect.size.width, a.y);
    CGContextAddLineToPoint(context, a.x + h*cos(angle)/2, a.y + h*sin(angle)/2);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextRestoreGState(context);
}

@end
