//
//  DetailViewController.h
//  proyectodemo
//
//  Created by Maddy on 12/02/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

- (IBAction)logout:(id)sender;

@end
