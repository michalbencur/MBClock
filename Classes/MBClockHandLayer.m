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

- (void)setFrame:(CGRect)newFrame
{
    self.anchorPoint = CGPointMake(newFrame.size.height / 2 / newFrame.size.width, 0.5);
    [super setFrame:newFrame];
}

- (void)drawInContext:(CGContextRef)context
{
    // inset the rect, otherwise there's not enough place for drawing
    CGRect rect = CGRectInset(self.bounds, 2, 2);
    CGFloat h = rect.size.height;
    CGPoint p = rect.origin;
    CGPoint m = CGPointMake(p.x + h/2, p.y + h/2); // middle of the circles
    
    CGContextSaveGState(context);
    CGContextSetShouldAntialias(context, YES);
    CGContextSetAllowsAntialiasing(context, YES);
    CGContextSetLineWidth(context, 1.0);
    if (self.color == nil) {
        self.color = [UIColor colorWithWhite:0.3 alpha:1.0];
    }
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    // draw middle-clock outer circle
    CGRect circleRect = CGRectMake(p.x, p.y, h, h);
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, circleRect);
    CGContextDrawPath(context, kCGPathFill);

    // draw middle-clock inner clear circle
    circleRect = CGRectInset(circleRect, 5, 5);
    CGContextSaveGState(context);
    CGContextBeginPath(context);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextAddEllipseInRect(context, circleRect);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    // draw hand
    CGContextBeginPath(context);
    CGFloat angle = M_PI_4/2;
    CGContextMoveToPoint(context, m.x + h*cosf(angle)/2, m.y - h*sinf(angle)/2);
    CGContextAddLineToPoint(context, rect.size.width, m.y);
    CGContextAddLineToPoint(context, m.x + h*cosf(angle)/2, m.y + h*sinf(angle)/2);

    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);

    CGContextRestoreGState(context);
}

@end
