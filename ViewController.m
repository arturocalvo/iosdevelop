//
//  ViewController.m
//  App
//
//  Created by Arturo Calvo on 2/4/14.
//  Copyright (c) 2014 Arturo Calvo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_title.png"]];
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timeLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    buttonbeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondbeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgsound = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)botonPresionado{
    count++;
    
    scoreLabel.text = [NSString stringWithFormat:@"Score %i", count];
    [buttonbeep play];
}

-(void)setupGame{
    seconds = 30;
    count = 0;
    
    timeLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i", count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
    [backgsound setVolume:0.3];
    [backgsound play];
}

-(void)subtractTime{
    seconds--;
    timeLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    [secondbeep play];
    
    if(seconds == 0){
         [timer invalidate];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                        message:[NSString stringWithFormat:@"You scored %i points", count]
                                                       delegate:self
                                              cancelButtonTitle:@"Play Again"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self setupGame];
}

-(AVAudioPlayer*)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *error;
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if(!audioPlayer){
        NSLog(@"%@", [error description]);
    }
    
    return audioPlayer;
}

@end
