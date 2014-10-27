//
//  Vector.h
//  Polymorphism
//
//  Created by tony on 11-3-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Vector : NSObject {
	double vec1;
	double vec2;
}

@property double vec1,vec2;
-(void)print;
-(void)setVec1:(double)v1 andVec2:(double) v2;
-(Vector *)add:(Vector *)v;

@end
