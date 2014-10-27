#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MainView : UIView<UITextFieldDelegate> {
    IBOutlet UITextField *passwordLength;
	IBOutlet UITextField *emailAddress;
    IBOutlet UISwitch *includeLowerCase;
    IBOutlet UISwitch *includeNumbers;
    IBOutlet UISwitch *includePunctuation;
    IBOutlet UISwitch *includeUpperCase;
    IBOutlet UISwitch *showPhonetics;
    IBOutlet UITextField *password;
	IBOutlet UITextView *phoneticPassword;
	IBOutlet UIButton *emailPasswordButton;
}

@property (nonatomic, retain) UITextField *emailAddress;
@property (nonatomic, retain) UITextView *phoneticPassword;
@property (nonatomic, retain) UITextField *passwordLength;
@property (nonatomic, retain) UIButton *emailPasswordButton;

- (IBAction)setPasssword;
- (IBAction)resignResponder;
- (IBAction)emailPassword;

@end
