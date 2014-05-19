//
//  RegisterViewController.m
//  proyectodemo
//
//  Created by Maddy on 02/04/14.
//  Copyright (c) 2014 Maddy. All rights reserved.
//

#import "RegisterViewController.h"
NSString *fullname;
NSString *email;
NSString *username;
NSString *password;
NSString *conpassword;
NSString *phone;
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)IsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (IBAction)checkname:(id)sender {
    _placename.text=_fullname.text;
}
- (IBAction)checkemail:(id)sender {
    if ([self IsValidEmail:_placeemail.text])
    _placeemail.text=_email.text;
    else
    _placeemail.text=@"Not a Email!";

}
- (IBAction)checkusername:(id)sender {
    //querie de username no repetido
    //if (unico)
    username=_username.text;
    //else
       //mensaje de error de usuario repetido
}
- (IBAction)checkpassword:(id)sender {
    
    
}
- (IBAction)checkconpassword:(id)sender {
    
}
- (IBAction)checkphone:(id)sender {
     _placephone.text=_phone.text;
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

- (IBAction)addphoto:(id)sender {
    UIActionSheet *sourceMenu= sourceMenu = [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Select the source for your profile picture", @"Select the source for your profile picture")  delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", @"Cancel")  destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"PhotoLibrary", @"PhotoLibrary") ,NSLocalizedString(@"Camera", @"Camera") , nil];;
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    if ([window.subviews containsObject:self.view]) {
        [sourceMenu showInView:self.view];
        [sourceMenu setTag:0];

    } else {
        [sourceMenu showInView:window];
    }
  }
- (IBAction)register:(id)sender {
    QBUUser *user=[QBUUser user];
    user.password=_password.text;
    user.login=_username.text;
    user.email=_email.text;
    user.phone=_phone.text;
    user.fullName=_fullname.text;

    [QBUsers signUp:user delegate:self];
    
    
    
}

-(void)cameraAsSource{
    pickerController = [[UIImagePickerController alloc]init ];
    pickerController.delegate=self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    [self presentViewController:pickerController animated:YES completion:nil];
}

-(void)libraryAsSource{
    pickerController = [[UIImagePickerController alloc]init ];
    pickerController.delegate=self;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    [self presentViewController:pickerController animated:YES completion:nil];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];

    
}

- (void)imagePickerController:(UIImagePickerController *) Picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
   
        selectedImage.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [[Picker presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    }


-(void)completedWithResult:(Result*)result{ // QuickBlox User creation result
    if([result isKindOfClass:[QBUUserResult class]]){ // Success result
        if(result.success){ UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Registration was successful. Please now sign in." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: @"Ok", nil];
            [alert show];
            
             // Errors
        }else{ UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Errors" message:[result.errors description] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
       
        }
    }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView firstOtherButtonIndex]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
