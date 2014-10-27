//
//  SettingsWindow.h
//  SpaceBubble
//
//  Created by Nicholas Vellios on 5/14/10.
//  Copyright 2010 Nick Vellios. All rights reserved.
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

@interface SettingsWindow : UIViewController {
	IBOutlet UIButton *saveButton;
	IBOutlet UISwitch *backgroundSwitch;
	IBOutlet UISwitch *effectsSwitch;
	id myCreator;
}

-(IBAction)onButtonClick:(id)sender;
-(IBAction)onBackgroundSwitch:(id)sender;
-(IBAction)onEffectsSwitch:(id)sender;

@property (nonatomic, retain) id myCreator;


@end
