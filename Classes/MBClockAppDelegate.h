//
//  MBClockAppDelegate.h
//  MBClock
//
//  Created by Michal Bencur on 3/11/11.
//  Copyright 2011 Michal Bencur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBClockViewController;

@interface MBClockAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MBClockViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MBClockViewController *viewController;

@end

