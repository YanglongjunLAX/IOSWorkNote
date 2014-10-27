#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SendEmailViewController : UIViewController {
	UIView *_parentView;
	NSString *emailBody;
    IBOutlet UITextField *toEmailField;
}
- (IBAction)cancelClicked;
- (IBAction)sendEmailClicked;
- (BOOL) showInView: (UIView*) parentView;
@property (nonatomic, retain) NSString *emailBody;
@property (nonatomic, retain) UITextField *toEmailField;
@end
