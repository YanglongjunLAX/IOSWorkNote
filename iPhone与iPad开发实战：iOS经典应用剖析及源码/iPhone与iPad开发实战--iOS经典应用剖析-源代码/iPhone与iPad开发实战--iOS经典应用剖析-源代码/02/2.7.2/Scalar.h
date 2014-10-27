//
//  Scalar.h
//  Polymorphism
//
//  Created by tony on 11-3-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Scalar : NSObject {
	double scal;
}
@property double scal;
-(void)print;
-(void)setScal:(double)sval;
-(Scalar *)add:(Scalar *)s;

@end
