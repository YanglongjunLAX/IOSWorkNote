//
//  NSDate+Addition.m
//  weibo
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)

- (NSDateComponents *)components {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    return [calendar components:unitFlags fromDate:self];
}

- (NSString *)diff2now {
    NSString *timeStr;
    
    NSDate *now = [NSDate date];
    
    // 计算当前时间和微博发表时间的差距
    int diff = -1 * [self timeIntervalSinceDate:now];
    
    if (diff < 60) {// 1分钟内
        timeStr = @"刚刚";
    } else if (diff < 60 * 60) {// 1个小时内
        timeStr = [NSString stringWithFormat:@"%i分钟前", diff/60];
    } else if (diff < 60 * 60 * 24) {// 1天内
        timeStr = [NSString stringWithFormat:@"%i小时前", diff/(60 * 60)];
    } else if (diff < 60 * 60 * 24 * 7) { // 1个星期内
        diff = diff / 60 / 60 / 24;
        timeStr = [NSString stringWithFormat:@"%i天前", diff];
    } else if (diff < 60 * 60 * 24 * 7 * 4) { // 1个月内
        diff = diff / 60 / 60 / 24 / 7;
        timeStr = [NSString stringWithFormat:@"%i星期前", diff];
    } else if ([now components].year == [self components].year) {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"MM-dd HH:mm";
        timeStr = [format stringFromDate:self];
    } else {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"yyyy-MM-dd HH:mm";
        timeStr = [format stringFromDate:self];
    }
    
    return timeStr;
}
@end
