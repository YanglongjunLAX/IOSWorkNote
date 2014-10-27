//
//  NSDate+Addition.h
//  weibo
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)
// 生成时间间隔字符串
- (NSString *)diff2now;
- (NSDateComponents *)components;
@end
