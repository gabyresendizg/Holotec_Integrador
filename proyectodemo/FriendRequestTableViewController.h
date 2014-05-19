//
//  FriendRequestTableViewController.h
//  proyectodemo
//
//  Created by Maddy on 17/05/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCellCell.h"

@interface FriendRequestTableViewController:UITableViewController <QBActionStatusDelegate, UITextFieldDelegate,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, QBChatDelegate>
@property (nonatomic, retain) NSArray* contacts;
@property (nonatomic, retain) NSMutableArray* searchContacts;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) IBOutlet CustomTableViewCellCell* _cell;



@end
