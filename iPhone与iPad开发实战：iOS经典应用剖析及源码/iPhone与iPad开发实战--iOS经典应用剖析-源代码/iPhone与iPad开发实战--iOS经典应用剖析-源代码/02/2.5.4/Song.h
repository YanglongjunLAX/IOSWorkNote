//
//  Song.h
//  2.5.2_1
//
//  Created by tony on 11-9-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject {
	NSString *title;
	NSString *artist;
	long int duration;
}

//操作方法
- (void)start;	
- (void)stop;	
- (void)seek:(long int)time;

//访问成员变量方法
@property(copy,readwrite) NSString *title;
@property(nonatomic,retain) NSString *artist;
@property(readonly) long int duration;

@end
