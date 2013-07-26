//
//  JBViewController.h
//  Beiber Smash
//
//  Created by Bryan Rhea on 4/26/13.
//  Copyright (c) 2013 Bryan Rhea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface JBViewController : UIViewController
{
    NSTimer *timer;
    NSTimer *bieberTimer;
    int time;
    int score;
    AVAudioPlayer *audioPlayer;
    AVAudioPlayer *gruntPlayer;
    SystemSoundID audioEffect;
    
}

@property (weak, nonatomic) IBOutlet UILabel *timeLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *bieberButton;
@property (weak, nonatomic) IBOutlet UIButton *startGameButton;
- (IBAction)bieberTouched:(id)sender;
- (IBAction)startGameTouched:(id)sender;
- (void)showBieber;

@end
