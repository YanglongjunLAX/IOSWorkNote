//
//  AnimationViewController.h
//  Animation
//
//  Created by fei lu on 13-3-12.
//  QQ:383571785
//  email:lufei_fly@163.com
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

@interface AnimationViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UIImageView *image;
    IBOutlet UISlider *animationDuration;
    IBOutlet UISwitch *enableAnimation;
    IBOutlet UILabel *animationDurationLabel;
    NSArray *arrLayerItem;
    NSArray *arrUIViewItem;
    NSArray *arrCATransitionItem;
    NSArray *arrCABasicAnimationItem;
    NSArray *arrCAKeyframeAnimationItem;
    NSArray *arrCAAnimationGroup;
    NSArray *arrCATransfrom3D;
    NSArray *arrSection;
    NSInteger tmpSection;
    NSMutableArray *arrSelSection;
    UITableView *tableView1;
    UILabel *label;
}
- (IBAction)animationDurationChanged:(id)sender;

@end
