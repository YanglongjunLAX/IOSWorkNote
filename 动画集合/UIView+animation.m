//
//  UIView+animation.m
//  shanpai5.0
//
//  Created by liang chunyan on 14-8-7.
//  Copyright (c) 2014年 arrowspeed. All rights reserved.
//

#import "UIView+animation.h"

@implementation UIView (animation)

/**type 各种动画效果样式
 * @"cube" @"moveIn" @"reveal" @"fade"(default) @"pageCurl" @"pageUnCurl" @"suckEffect" @"rippleEffect" @"oglFlip"
 *
 *  @param type
 */
- (void)translationAmition:(NSString*)type
{
    [CATransaction begin];
    CATransition *tran=[CATransition animation];
    tran.type = type;
    tran.duration=.5;
    tran.delegate=self;
    [self.layer addAnimation:tran forKey:@"type"];
    [CATransaction commit];
}

- (void)rippleEffectAmition
{
    [self translationAmition:@"rippleEffect"];
}

@end
