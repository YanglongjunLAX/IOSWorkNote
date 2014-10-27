//
//  UIView+animation.h
//  shanpai5.0
//
//  Created by liang chunyan on 14-8-7.
//  Copyright (c) 2014年 arrowspeed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (animation)
/**
 *  UIView 执行动画
 *
 *  @param type 动画类型描述
 */
- (void)translationAmition:(NSString*)type;
/**
 *  rippleEffec 效果
 */
- (void)rippleEffectAmition;
@end
