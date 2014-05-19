//
//  AppDelegate.h
//  proyectodemo
//
//  Created by Maddy on 12/02/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate :  UIResponder <UIApplicationDelegate>{
}

@property (retain, nonatomic) UIWindow *window;

/* VideoChat test opponents */


/* Current logged in test user*/

@property (retain, nonatomic) NSMutableArray *testOpponents;

@property (nonatomic, retain) QBUUser *currentUser;

@property (nonatomic, retain) QBUUser *choosedUser;
@property (nonatomic, retain) QBUUser *OpponentUser;
@property (nonatomic, strong) NSNumber* OppID;
@property (nonatomic, strong) NSString *recentSegue;

@property (nonatomic, strong) NSString *iscalling;
@end
