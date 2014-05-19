//
//  LoginViewController.m
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "InfoContactViewController.h"
@interface LoginViewController ()

@end
bool login=false;
@implementation LoginViewController
id oppid;

@synthesize activityIndicator;

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [self setActivityIndicator:nil];
}
-(void)viewDidLoad{
    [QBAuth createSessionWithDelegate:self];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)loginAsUser:(id)sender{
 
    
    // Your app connects to QuickBlox server here.
    //
    // Create extended session request with user authorization
    //
    
   
    [QBUsers logInWithUserLogin:_username.text password:_password.text delegate:self];
  login=true;
    [activityIndicator startAnimating];
    NSLog(@"Success");
    
}


#pragma mark -
#pragma mark QBActionStatusDelegate

// QuickBlox API queries delegate
- (void)completedWithResult:(Result *)result{
    if(!login){
        if(result.success && [result isKindOfClass:QBAAuthSessionCreationResult.class]){}}
    else{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    // Success result
      
    if(result.success&&login){
        
        QBUUserLogInResult *res = (QBUUserLogInResult *)result;
               // save current user
        appDelegate.currentUser = res.user;
        
        QBUUser *user=res.user;
        user.ID = res.user.ID;
        user.password = _password.text;
        [QBChat instance].delegate=self;
	 [[QBChat instance] loginWithUser:user];
        [self dismissViewControllerAnimated:YES completion:nil];
        // Errors
    }else if(login){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Errors"
                                                        message:[result.errors description]
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil];
        alert.tag = 1;
        [alert show];
    }
        login=false;
        [activityIndicator stopAnimating];
    
    }
     
}


/*
    // QuickBlox session creation  result
    if([result isKindOfClass:[QBAAuthSessionCreationResult class]]){
        
        // Success result
        if(result.success){
            
            // Set QuickBlox Chat delegate
            //
            [QBChat instance].delegate = self;
            
            QBUUser *user = [QBUUser user];
            user.ID = ((QBAAuthSessionCreationResult *)result).session.userID;
            NSLog(@"%lu",(unsigned long)user.ID);
            user.password = _username.text;
            NSLog(@"%@",user.password);
            // Login to QuickBlox Chat
            //
            [[QBChat instance] loginWithUser:user];
    
            
            [self dismissViewControllerAnimated:YES completion:nil];

        }else{
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[[result errors] description] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            
        }
    }
*/

#pragma mark -
#pragma mark QBChatDelegate



- (void)chatDidNotLogin{
}

- (IBAction)isregisterng:(id)sender {
    
}
@end
