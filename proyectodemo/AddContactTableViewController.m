//
//  AddContactTableViewController.m
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import "AddContactTableViewController.h"
#import "CustomTableViewCellCell.h"
#import "AppDelegate.h"
#import "InfoContactViewController.h"
@interface AddContactTableViewController ()

@end
int usernum;
NSInteger sections;
@implementation AddContactTableViewController
bool friends;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       self.navigationItem.hidesBackButton = YES;    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated{
 [self retrieveUsers];
}
- (void) retrieveUsers{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    //cambiar a querie del usuario nadamas no de las paginas
    // retrieve 100 users
    PagedRequest* request = [[PagedRequest alloc] init];
    request.perPage = 100;
	[QBUsers usersWithPagedRequest:request delegate:self];
    
}
// QuickBlox API queries delegate
- (void)completedWithResult:(Result *)result
{
    // Retrieve Users result
    if([result isKindOfClass:[QBUUserPagedResult class]])
    {
        // Success result
        if (result.success)
        {
            // update table
            QBUUserPagedResult *usersSearchRes = (QBUUserPagedResult *)result;
            self.contacts = usersSearchRes.users;
            self.searchContacts = [_contacts mutableCopy];
            [_myTableView reloadData];
            
            // Errors
        }else{
            NSLog(@"Errors=%@", result.errors);
        }
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.recentSegue=@"aboutsegue";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return [self.searchContacts count];
    

}

// Making table view using custom cells
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    CustomTableViewCellCell* cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil)
    {
        [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
        cell = self._cell;
    }
       QBUUser* obtainedUser = [self.searchContacts objectAtIndex:[indexPath row]];
    if(obtainedUser.login != nil){
        cell.userLogin.text = obtainedUser.login;
    }
    else{
        cell.userLogin.text = obtainedUser.email;
    }
    
    for(NSString *tag in obtainedUser.tags){
        if([cell.userTag.text length] == 0){
            cell.userTag.text = tag;
        }else{
            cell.userTag.text = [NSString stringWithFormat:@"%@, %@", cell.userTag.text, tag];
        }

 //       NSArray* friendsarray=[QBChat instance].contactList.pendingApproval;
   //     cell.userLogin.text=[friendsarray objectAtIndex:[indexPath row]];
    
    
   
    }
 return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


-(void) searchBarSearchButtonClicked:(UISearchBar *)SearchBar{
    [self.mySearchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    [self.searchContacts removeAllObjects];
    
    if([searchText length] == 0){
        
        [self.searchContacts addObjectsFromArray:self.contacts];
        
    }else{
        for(QBUUser *user in self.contacts){
            
            NSRange loginRange = NSMakeRange(NSNotFound, 0);
            if(user.login != nil){
                loginRange = [user.login rangeOfString:searchText options:NSCaseInsensitiveSearch];
            }
            NSRange fullNameRange = NSMakeRange(NSNotFound, 0);
            if(user.fullName != nil){
                fullNameRange= [user.fullName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            }
            NSRange tagsRange = NSMakeRange(NSNotFound, 0);
            if(user.tags != nil && [user.tags count] > 0){
                tagsRange = [[user.tags description] rangeOfString:searchText options:NSCaseInsensitiveSearch];;
            }
            if(loginRange.location != NSNotFound || fullNameRange.location != NSNotFound || tagsRange.location != NSNotFound){
                [self.searchContacts addObject:user];
            }
        }
    }
    
    [self.myTableView reloadData];
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)_textField
{
    [_textField resignFirstResponder];
    return YES;
}

- (void)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mySearchBar resignFirstResponder];
    
    // show user details
    
    
    InfoContactViewController *detailsController = [[InfoContactViewController alloc] init];
    usernum=(int)[indexPath row];
    detailsController.choosedUser = [self.searchContacts objectAtIndex:[indexPath row]];
    
    [self performSegueWithIdentifier:@"aboutsegue" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"aboutsegue"])
        [segue.destinationViewController setChoosedUser:[self.searchContacts objectAtIndex:usernum]];
}

@end

/*
- (UITableViewCell *)tableView:(UITableView *)tableView  :(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

