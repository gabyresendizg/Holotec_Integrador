//
//  InfoContactViewController.m
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import "InfoContactViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "AddContactTableViewController.h"
#import "VideoCallViewController.h"
@interface InfoContactViewController ()

@end

@implementation InfoContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.hidesBackButton = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
       _username.text = _choosedUser.login;
    _fullname.text=_choosedUser.fullName;
     _email.text=_choosedUser.email;
     _phone.text=_choosedUser.phone;
     _fullname.text=_choosedUser.fullName;
    if (   [_username.text isEqualToString:@"jessica"]) {
        UIImage *image = [UIImage imageNamed: @"jessica.jpg"];
        [_photo setImage:image];
    }
    else  if (   [_username.text isEqualToString:@"gerardo"]){
        UIImage *image = [UIImage imageNamed: @"gerardo.png"];
        [_photo setImage:image];
    }
    else if (   [_username.text isEqualToString:@"gaby"]){
        UIImage *image = [UIImage imageNamed: @"gaby.jpg"];
        [_photo setImage:image];
    }
    else if (   [_username.text isEqualToString:@"Da_W"]){
        UIImage *image = [UIImage imageNamed: @"Da_W.jpg"];
        [_photo setImage:image];
    }
    if (   [_username.text isEqualToString:@"pochi"]){
        UIImage *image = [UIImage imageNamed: @"pochi.jpg"];
        [_photo setImage:image];
    }
    if (   [_username.text isEqualToString:@"jorge"]){
        UIImage *image = [UIImage imageNamed: @"jorge.jpg"];
        [_photo setImage:image];
    }
    if ([appDelegate.recentSegue isEqualToString:@"aboutsegue"]) {
        _callbutton.hidden=YES;
        _addbutton.hidden=NO;
    }
    else if ([appDelegate.recentSegue isEqualToString:@"friendsegue"]){
        _callbutton.hidden=YES;
        _addbutton.hidden=YES;}
    else{
        self.navigationItem.hidesBackButton = YES;
    _callbutton.hidden=NO;
        _addbutton.hidden=YES;}
    // Do any additional setup after loading the view.
    if([appDelegate.iscalling isEqualToString:@"calling"]){AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        VideoCallViewController *videocallviewcontroller = [[VideoCallViewController alloc] init];
        appDelegate.choosedUser = _choosedUser;
        UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:@"VideoCall" bundle:nil];
        videocallviewcontroller = [secondStoryBoard instantiateInitialViewController];
        [self presentViewController:videocallviewcontroller animated:YES completion:NULL];
}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 - (void)call:(id)sender{
     NSLog(@"chat login");

 AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
 VideoCallViewController *videocallviewcontroller = [[VideoCallViewController alloc] init];
 appDelegate.choosedUser = _choosedUser;
 UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:@"VideoCall" bundle:nil];
 videocallviewcontroller = [secondStoryBoard instantiateInitialViewController];
 [self presentViewController:videocallviewcontroller animated:YES completion:NULL];
 
 }


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addfriend:(id)sender {
    [[QBChat instance] addUserToContactListRequest:_choosedUser.ID];
    NSLog(@"added user %lu",(unsigned long)_choosedUser.ID);
}
@end
