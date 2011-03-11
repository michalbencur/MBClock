//
//  MBClockViewController.m
//  MBClock
//
//  Created by Michal Bencur on 3/11/11.
//  Copyright 2011 Michal Bencur. All rights reserved.
//

#import "MBClockViewController.h"

@implementation MBClockViewController

@synthesize clockView;

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.clockView = nil;
}

- (void)dealloc
{
    self.clockView = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

@end
