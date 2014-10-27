//
//  CoreTextMagazineAppDelegate.h
//  CoreTextMagazine
//
//  Created by Marin Todorov on 8/11/11.
//  Copyright 2011 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreTextMagazineViewController;

@interface CoreTextMagazineAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CoreTextMagazineViewController *viewController;

@end
