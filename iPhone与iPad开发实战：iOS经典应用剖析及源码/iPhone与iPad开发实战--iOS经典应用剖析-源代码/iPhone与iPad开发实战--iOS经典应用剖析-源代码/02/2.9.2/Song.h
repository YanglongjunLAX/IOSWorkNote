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
@property NSString *title;
@property NSString *artist;
@property(readwrite) long int duration;

//构造函数
-(Song*) initWithTitle: (NSString *) title andArtist: (NSString *) artist andDuration:( long int )duration ;


@end
