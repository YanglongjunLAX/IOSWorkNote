//
//  ClassA.h
//  ClassLevelAccessTest
//
//  Created by tony on 10-8-5.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <Foundation/NSObject.h>

static int count;

@interface ClassA: NSObject {
	int aaa;
	
}
+(int) initCount;
+(void) initialize;
@end

