//
//  AddContactTableViewController.h
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCellCell.h"
@interface AddContactTableViewController :UITableViewController <QBActionStatusDelegate, UITextFieldDelegate,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (nonatomic, retain) NSArray* contacts;
@property (nonatomic, retain) NSMutableArray* searchContacts;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) IBOutlet CustomTableViewCellCell* _cell;
@property (strong, nonatomic) IBOutlet UISearchBar *mySearchBar;

- (void) retrieveUsers;
@end
