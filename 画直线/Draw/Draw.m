//
//  Draw.m
//  AS-UHui
//
//  Created by user on 11/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Draw.h"


@implementation Draw

+(void)Line:(UIImageView *)view startX:(CGFloat)startX startY:(CGFloat)startY endX:(CGFloat)endX endY:(CGFloat)endY{
	UIGraphicsBeginImageContext(view.frame.size);
	[view.image drawInRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
	CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineJoinBevel);
	CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 0.1);
	CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
	CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
	CGContextBeginPath(UIGraphicsGetCurrentContext());
	CGContextMoveToPoint(UIGraphicsGetCurrentContext(), endX, endY);
	CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), startX, startY);
	CGContextStrokePath(UIGraphicsGetCurrentContext());
	view.image=UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
}
@end
