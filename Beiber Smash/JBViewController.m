//
//  JBViewController.m
//  Beiber Smash
//
//  Created by Bryan Rhea on 4/26/13.
//  Copyright (c) 2013 Bryan Rhea. All rights reserved.
//

#import "JBViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface JBViewController ()

@end

@implementation JBViewController
@synthesize timeLeftLabel;
@synthesize scoreLabel;
@synthesize bieberButton;
@synthesize startGameButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    bieberButton.hidden = YES;
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bieber.mp3", [[NSBundle mainBundle] resourcePath]]];
	
    NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
    audioPlayer.volume = 0.5;
    [audioPlayer prepareToPlay];
    
    NSURL *gruntUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/hey2.mp3", [[NSBundle mainBundle] resourcePath]]];
    AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain(gruntUrl), &audioEffect);
    
    //AudioServicesDisposeSystemSoundID(audioEffect);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showBieber {
    int xVal = arc4random() % 650;
    int yVal = arc4random() % 750;
    
    bieberButton.center = CGPointMake(xVal, yVal);
}

- (IBAction)bieberTouched:(id)sender {
    NSLog(@"Bieber touched!");
    AudioServicesPlaySystemSound(audioEffect);

    score = score + time;
    scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    [self performSelector:@selector(showBieber)];
}

- (IBAction)startGameTouched:(id)sender {
    NSLog(@"Game started!");
    if (audioPlayer != nil)
		[audioPlayer play];

    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateTimer)
                                           userInfo:nil
                                            repeats:YES];
    time =20;
    bieberButton.hidden = NO;
    startGameButton.hidden = YES;
    score = 0;
    scoreLabel.text = @"0";
    timeLeftLabel.text = [NSString stringWithFormat:@"%d", time];
}

- (void)updateTimer {
    NSLog(@"timer! %d", time);
    time -= 1;
    if (time <= 0) {
        [timer invalidate];
        if (audioPlayer != nil)
            [audioPlayer stop];

        timeLeftLabel.text = @"0";
        
        bieberButton.hidden = YES;
        startGameButton.hidden = NO;
    }
    timeLeftLabel.text = [NSString stringWithFormat:@"%d", time];
}


@end
