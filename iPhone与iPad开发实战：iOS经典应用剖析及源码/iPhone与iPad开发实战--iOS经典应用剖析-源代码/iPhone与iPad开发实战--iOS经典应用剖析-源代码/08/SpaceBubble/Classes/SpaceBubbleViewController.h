//
//  SpaceBubbleViewController.h
//  SpaceBubble
//
//  Created by Nicholas Vellios on 5/11/10.
//  Copyright Nick Vellios 2010. All rights reserved.
//
//	http://www.Vellios.com
//	nick@vellios.com
//
//	This code is released under the "Take a kid fishing or hunting license"
//	In order to use any code in your project you must take a kid fishing or
//	hunting and give some sort of credit to the author of the code either
//	on your product's website, about box, or legal agreement.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVAudioPlayer.h>

#import "GameOverViewController.h"
#import "SpriteHelpers.h"
#import "SplashViewController.h"

//@class SplashViewController;

@interface SpaceBubbleViewController : UIViewController <UIAccelerometerDelegate, AVAudioPlayerDelegate> {
	Sprite *shipView;
	Sprite *enemyView;
	Sprite *bonusView;
	
	UIImageView *splashScreen;

	SplashViewController *splashView;
	
	BOOL soundEffects;
	BOOL backgroundMusic;
	BOOL bonusTime;
	BOOL gamePaused;
	NSMutableArray *enemyArray;
	NSMutableArray *bonusArray;
	UILabel *scoreLabel;
	UILabel *livesLabel;
	NSInteger pointCount;
	NSUInteger enemyRandFeed;
	NSUInteger bonusRandFeed;
	NSUInteger scorePlaceholder;
	NSInteger lives;
	CGFloat halfEnemyWidth;
	CGFloat halfShipWidth;
	CGFloat halfBonusWidth;
	NSTimer *bonusTimer;
	NSTimer *isBonusTimer;
	NSTimer *updateTimer;
	NSUInteger highScore;
	GameOverViewController *gameOverView;
	
	AVAudioPlayer *player;
}

@property (nonatomic, retain) NSTimer *bonusTimer;
@property (nonatomic, retain) NSTimer *updateTimer;
@property (nonatomic, retain) NSTimer *isBonusTimer;
@property (nonatomic, retain) UILabel *scoreLabel;
@property (nonatomic, retain) UILabel *livesLabel;
@property (nonatomic, assign) NSUInteger highScore;
@property (nonatomic, assign) BOOL gamePaused;
@property (nonatomic, assign) BOOL soundEffects;
@property (nonatomic, assign) BOOL backgroundMusic;
@property (nonatomic, retain) AVAudioPlayer *player;

- (void)displayHideSplashScreen;
- (void)updateScore:(NSUInteger)score;

@end

