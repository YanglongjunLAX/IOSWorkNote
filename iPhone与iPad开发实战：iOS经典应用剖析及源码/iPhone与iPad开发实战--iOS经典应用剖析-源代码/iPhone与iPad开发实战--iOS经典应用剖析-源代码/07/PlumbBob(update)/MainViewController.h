//
//  MainViewController.h
//  PlumbBob
//
//  Created by tony on 11-9-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController <UIAccelerometerDelegate> {
	UIImageView* plumbBobView;
}
- (void)rotatePlumbStringToDegree:(CGFloat)positionInDegrees;
@end

CGFloat DegreesToRadians(CGFloat degrees);
CGFloat RadiansToDegrees(CGFloat radians);
