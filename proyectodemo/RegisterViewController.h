//
//  RegisterViewController.h
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,QBActionStatusDelegate>
{
    
    UIImagePickerController *pickerController;

    IBOutlet UIImageView *selectedImage;
   
    
}
@property (weak, nonatomic) IBOutlet UITextField *fullname;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *conpassword;
@property (weak, nonatomic) IBOutlet UITextField *phone;
- (IBAction)addphoto:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *placename;
@property (weak, nonatomic) IBOutlet UILabel *placeemail;
@property (weak, nonatomic) IBOutlet UILabel *placephone;
- (IBAction)register:(id)sender;
- (IBAction)cancel:(id)sender;

@end
