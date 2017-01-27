//
//  ViewController.m
//  FaceBookLogin
//
//  Created by Jhovarie on 1/12/17.
//  Copyright © 2017 Jhovarie. All rights reserved.
//


//https://developers.facebook.com/docs/ios/getting-started

//to add facebook app
//https://developers.facebook.com/apps

//read it
//https://developers.facebook.com/docs/facebook-login/ios

//dashboard
//https://developers.facebook.com/apps/<some#here>/dashboard/

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self faceBookLoginSetup];
}

-(void) faceBookLoginSetup {
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    //loginButton.readPermissions =  @[@"email"];
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int screenwidth = screenBounds.size.width * 2;
    int screenheight = screenBounds.size.height * 2;
   
    int adjust = 200;
    [loginButton setFrame:CGRectMake(264 + (adjust/2), 213, 497 - adjust, 33)];
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
}

- (void) loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
               error:(NSError *)error {
    NSLog(@"loginButton ------------------------------------------");
    
    //this code get facebook id, and info of the user
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                      id result, NSError *error) {
             if (!error) {
                 NSString *facebookid = result[@"id"];
 
                 NSLog(@"facebookID = %@",facebookid);
                 
                 NSString *name = result[@"name"];
                 NSLog(@"name fullname : %@",name);
                 
                 NSArray *strings = [name componentsSeparatedByString:@" "];
                 NSString *firstname = [strings objectAtIndex:0];
                 NSString *lastname = [strings objectAtIndex:1];
                 NSLog(@"First name: %@",firstname);
                 NSLog(@"Last name: %@",lastname);
                 
             }
         }];
    }
    
    //This code get email
    NSDictionary *parameters = @{@"fields":@"email"};
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                      id result, NSError *error) {
             if (!error) {
                 if(result[@"email"] != NULL){
                     NSString *email_from_fb = result[@"email"];;
                     NSLog(@"Email from fb = %@ ",email_from_fb);
                 } else {
                     NSLog(@"Facebook user did not used Email");
                 }
             }
         }];
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"loginButtonDidLogOut ------------------------------------------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
