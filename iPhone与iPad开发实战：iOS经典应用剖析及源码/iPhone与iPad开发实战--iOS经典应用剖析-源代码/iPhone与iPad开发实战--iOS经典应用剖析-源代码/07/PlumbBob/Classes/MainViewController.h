//
//  MainViewController.h
//  PlumbBob
//
//  Created by apple on 10/11/08.
//  Copyright Amuck LLC 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIAccelerometerDelegate> {
	UIImageView* plumbBobView;
	IBOutlet UILabel *lbl;
}
- (void)rotatePlumbStringToDegree:(CGFloat)positionInDegrees;
@end

CGFloat DegreesToRadians(CGFloat degrees);
CGFloat RadiansToDegrees(CGFloat radians);
