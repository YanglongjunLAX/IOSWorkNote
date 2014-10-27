//
//  UITableView+UITableView_SP.h
//  shanpai5.0
//
//  Created by Bailingshidai on 14-7-25.
//  Copyright (c) 2014年 arrowspeed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (SP)

//滚动到底部 + 动画效果的
- (void)scrollToBottom;
//滚动到底部 动画选择
- (void)scrollToBotton:(BOOL)animation;

@end
