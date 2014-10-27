//
//  PlumbBobAppDelegate.h
//  PlumbBob
//
//  Created by tony on 11-9-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class RootViewController;

@interface PlumbBobAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet RootViewController *rootViewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *rootViewController;

@end
