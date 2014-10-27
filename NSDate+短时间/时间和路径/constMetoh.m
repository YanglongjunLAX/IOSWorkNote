//
//  constMetoh.m
//  shanpai5.0
//
//  Created by liang chunyan on 14-4-16.
//  Copyright (c) 2014年 arrowspeed. All rights reserved.
//

#import "constMetoh.h"

#define Kfiledata @"alarm.sqlite"
@implementation constMetoh

//SQLITE存储的路径
-(NSString *)DataPath
{
    NSArray * Paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * DocumentDirectory = [Paths objectAtIndex:0];
    NSString * dbpath = [DocumentDirectory stringByAppendingPathComponent:Kfiledata];
    
    return dbpath;
}

/**
 *  获取当前的日期
 *
 *  @return 返回日期
 */
-(NSString*)getCurrentDate
{
    
    NSDate * date = [NSDate date];
    NSCalendar * Calendar = [NSCalendar currentCalendar];
    NSDateComponents * DateComponents = [Calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:date];
    NSInteger year = [DateComponents year];
    NSInteger month = [DateComponents month];
    NSInteger day = [DateComponents day];
    
    NSString * currentDate = [NSString stringWithFormat:@"%d-%d-%d",year,month,day];
    
    return currentDate;
    
    
}

-(NSString*)getCurrentTime
{
    NSDate * date = [NSDate date];
    NSDateFormatter * f = [[NSDateFormatter alloc]init];
    [f setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString * time = [f stringFromDate:date];
    
//    return [time substringToIndex:[time length]-3];
    return time;
}


-(NSString*)changeTimeFormat:(NSDate*)date :(NSString*)dateString
{
    
    NSDateFormatter * f = [[NSDateFormatter alloc]init];
    [f setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    if (date==nil)
    {
        NSDate * _date = [f dateFromString:dateString];
        NSString * selectTime = [f stringFromDate:_date];
        NSRange range = NSMakeRange(10,6);
        NSString * time = [selectTime substringWithRange:range];
        return time;
    }else
    {
        NSString * selectTime = [f stringFromDate:date];
        NSRange range = NSMakeRange(10,6);
        NSString * time = [selectTime substringWithRange:range];
    
        return time;
    
    }

}

-(NSDate*)stringChangeDateFormat:(NSString*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:(@"yyyy-MM-dd HH:mm:ss")];
    NSDate *_date = [formatter dateFromString:date];
    return _date;
}

@end
