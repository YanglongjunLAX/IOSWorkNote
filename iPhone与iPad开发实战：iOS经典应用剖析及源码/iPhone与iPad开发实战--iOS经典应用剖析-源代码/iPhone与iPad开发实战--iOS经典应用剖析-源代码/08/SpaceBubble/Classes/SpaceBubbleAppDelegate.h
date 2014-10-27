//
//  SpaceBubbleAppDelegate.h
//  SpaceBubble
//
//  Created by Nicholas Vellios on 5/11/10.
//  Copyright Nick Vellios 2010. All rights reserved.
//
//	http://www.Vellios.com
//	nick@vellios.com
//
//	This code is released under the "Take a kid fishing or hunting license"
//	In order to use any code in your project you must take a kid fishing or
//	hunting and give some sort of credit to the author of the code either
//	on your product's website, about box, or legal agreement.
//

#import <UIKit/UIKit.h>

@class SpaceBubbleViewController;

@interface SpaceBubbleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SpaceBubbleViewController *viewController;
	NSUInteger score;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SpaceBubbleViewController *viewController;

@end

