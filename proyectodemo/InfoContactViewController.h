//
//  InfoContactViewController.h
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoContactViewController : UIViewController <QBChatDelegate, AVAudioPlayerDelegate, UIAlertViewDelegate>{
    NSUInteger videoChatOpponentID;
    enum QBVideoChatConferenceType videoChatConferenceType;
    NSString *sessionID;
}
@property (nonatomic, retain) QBUUser *choosedUser;
@property (weak, nonatomic) IBOutlet UILabel *fullname;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UIButton *status;
@property (strong, nonatomic) IBOutlet UIButton *callbutton;
@property (strong, nonatomic) IBOutlet UIButton *addbutton;

@property (retain) UIAlertView *callAlert;
@property (retain) QBVideoChat *videoChat;
@property (retain) NSNumber *opponentID;
- (IBAction)call:(id)sender;
- (IBAction)email:(id)sender;
- (IBAction)logout:(id)sender;
- (IBAction)addfriend:(id)sender;
- (void)reject;
- (void)accept;

@end
