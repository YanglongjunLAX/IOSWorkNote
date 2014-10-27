//
//  SpriteHelpers.h
//  SpaceBubble
//
//  Created by Nicholas Vellios on 5/13/10.
//  Copyright 2010 Nick Vellios. All rights reserved.
//
//	http://www.Vellios.com
//	nick@vellios.com
//
//	This code is released under the "Take a kid fishing or hunting license"
//	In order to use any code in your project you must take a kid fishing or
//	hunting and give some sort of credit to the author of the code either
//	on your product's website, about box, or legal agreement.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface SpriteHelpers : NSObject {

}

+ (Sprite *)setupAnimatedSprite:(id)sender numFrames:(NSInteger)frames withFilePrefix:(NSString *)filePrefix withDuration:(CGFloat)duration ofType:(NSString *)ext withValue:(NSInteger)val;

@end
