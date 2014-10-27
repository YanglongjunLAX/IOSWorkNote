//
//  MainViewController.h
//  PasswordGen
//
//  Created by amuck on 8/18/08.
//  Copyright AppsAmuck LLC 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController {
	IBOutlet UIButton *createPassword;
	IBOutlet UIButton *emailPassword;
}
@property (nonatomic, retain) UIButton *createPassword;
@property (nonatomic, retain) UIButton *emailPassword;

@end
