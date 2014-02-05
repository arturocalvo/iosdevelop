//
//  ViewController.h
//  App
//
//  Created by Arturo Calvo on 2/4/14.
//  Copyright (c) 2014 Arturo Calvo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timeLabel;
    
    //Puntuacion y tiempo
    NSInteger count;
    NSInteger score;
    NSInteger seconds;
    NSTimer *timer;
    
    AVAudioPlayer *buttonbeep;
    AVAudioPlayer *secondbeep;
    AVAudioPlayer *backgsound;
    
}

-(IBAction)botonPresionado;


@end
