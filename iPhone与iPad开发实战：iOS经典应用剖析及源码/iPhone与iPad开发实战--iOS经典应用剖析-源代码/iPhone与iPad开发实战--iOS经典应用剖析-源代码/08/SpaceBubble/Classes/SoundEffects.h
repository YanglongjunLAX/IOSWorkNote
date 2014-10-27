//
//  SoundEffects.h
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
#import <AudioToolbox/AudioToolbox.h>

typedef enum {
	Sound_AxeThrow,
	Sound_Laser,
	Sound_Click,
	Sound_Mechanical,
	Sound_Hit,
	Sound_Alien,
	
	Sound_COUNT
	
} GameSoundEffects;

struct SoundEffect {
	GameSoundEffects	gameSoundID;
	const char*			soundResourceName;
	SystemSoundID		systemSoundID;
};

void InitializeSoundEffects();
void PlaySoundEffect(GameSoundEffects soundID);

@interface SoundEffects : NSObject {
}

+ (SoundEffects*)sharedInstance;
- (void)initializeSoundEffects;
- (void)playSoundEffect:(GameSoundEffects)soundID;

@end
