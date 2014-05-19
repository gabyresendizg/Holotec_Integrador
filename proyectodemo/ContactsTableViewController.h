//
//  ContactsTableViewController.h
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCellCell.h"

@interface ContactsTableViewController : UITableViewController <QBActionStatusDelegate, UITextFieldDelegate,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate,QBChatDelegate>
@property (nonatomic, retain) NSArray* contacts;


@property (nonatomic, retain) NSMutableArray* searchContacts;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) IBOutlet CustomTableViewCellCell* _cell;


- (void) retrieveUsers;
@end
