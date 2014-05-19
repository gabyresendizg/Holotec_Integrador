//
//  VideoCallViewController.h
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCallViewController : UIViewController <QBChatDelegate, AVAudioPlayerDelegate, UIAlertViewDelegate,AVCaptureVideoDataOutputSampleBufferDelegate>{

        IBOutlet UIButton *callButton;
        IBOutlet UILabel *ringigngLabel;
        IBOutlet UIActivityIndicatorView *callingActivityIndicator;
        IBOutlet UIActivityIndicatorView *startingCallActivityIndicator;
        IBOutlet UIImageView *opponentVideoView;
        IBOutlet UIImageView *myVideoView;
        IBOutlet UINavigationBar *navBar;
    IBOutlet UIImageView *opponentVideoViewright;
        
    IBOutlet UIImageView *opponentVideoViewleft;
    IBOutlet UIImageView *opponentVideoViewbot;
        AVAudioPlayer *ringingPlayer;
        
        //
        NSUInteger videoChatOpponentID;
        enum QBVideoChatConferenceType videoChatConferenceType;
        NSString *sessionID;
    }
    
    @property (retain) NSNumber *opponentID;
    @property (retain) QBVideoChat *videoChat;
    @property (retain) UIAlertView *callAlert;
    @property (retain) AVCaptureSession *captureSession;
    - (IBAction)call:(id)sender;
    - (void)reject;
    - (void)accept;
@end
