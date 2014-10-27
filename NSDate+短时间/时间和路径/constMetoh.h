//
//  constMetoh.h
//  shanpai5.0
//
//  Created by liang chunyan on 14-4-16.
//  Copyright (c) 2014年 arrowspeed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface constMetoh : NSObject
/**
 *  fmdb文件路径
 *
 *  @return 路径
 */
-(NSString *)DataPath;

#pragma mark - 时间日期相关
/**
 *  获取当前的日期
 *
 *  @return 返回日期
 */
-(NSString*)getCurrentDate;

/**
 *  获取当前的时间
 *
 *  @return 返回当前时间
 */
-(NSString*)getCurrentTime;

/**
 *  截取时间段
 *
 *  @param date       格式是date
 *  @param dateString 格式是string
 *
 *  @return 截取出来的时间
 */
-(NSString*)changeTimeFormat:(NSDate*)date :(NSString*)dateString;

/**
 *  将时间格式的字符串转变成date Format
 *
 *  @param date 字符串
 *
 *  @return date format  
 */
-(NSDate*)stringChangeDateFormat:(NSString*)date;

@end
