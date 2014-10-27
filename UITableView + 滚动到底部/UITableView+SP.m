//
//  UITableView+UITableView_SP.m
//  shanpai5.0
//
//  Created by Bailingshidai on 14-7-25.
//  Copyright (c) 2014年 arrowspeed. All rights reserved.
//

#import "UITableView+SP.h"

@implementation UITableView (SP)

- (void)scrollToBottom
{
    [self scrollToBotton:YES];
}

- (void)scrollToBotton:(BOOL)animation
{
    NSInteger section=1;
    if (self.dataSource&&[self.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        section=[self.dataSource numberOfSectionsInTableView:self];
    }
    if (self.dataSource&&[self.dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        NSInteger row=[self.dataSource tableView:self numberOfRowsInSection:section-1];
        if (row>0||section>1) {
            NSIndexPath * index=[NSIndexPath indexPathForRow:row-1 inSection:section-1];
            [self scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionBottom animated:animation];
        }
    }
}

@end
