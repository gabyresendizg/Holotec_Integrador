//
//  LoginViewController.h
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<QBActionStatusDelegate, QBChatDelegate>{
   }

@property (retain, nonatomic) UIWindow *window;

/* VideoChat test opponents */
@property (retain, nonatomic) NSArray *testOpponents;

/* Current logged in test user*/
@property (assign, nonatomic) int currentUser;
@property (nonatomic, strong) id OppID;
- (IBAction)isregisterng:(id)sender;

@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginbutton;
- (IBAction)loginAsUser:(id)sender;

@end
