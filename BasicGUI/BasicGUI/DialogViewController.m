//
//  DialogViewController.m
//  BasicGUI
//
//  Created by Jhovarie on 1/20/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "NavUtil.h"
#import "DialogViewController.h"

@interface DialogViewController ()

@end

@implementation DialogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
 [NavUtil gotoMainVC:self :self.storyboard :false :false];
}

- (IBAction)showok:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@""
                              message:@"Message.."
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
    alertView.tag = 1;
    dispatch_async(dispatch_get_main_queue(), ^{
        [alertView show];
    });
}

- (IBAction)showyesno:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                message:@"...Do you want to proceed?"
                delegate:self
                cancelButtonTitle:@"No"
            otherButtonTitles:@"Yes", nil];
    alert.tag = 2;
    [alert show];
}

- (IBAction)show3option:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"title"
                          message:@"Go To?"
                          delegate:self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"Door ONE", @"Door TWO", nil];
    alert.tag = 3;
    [alert show];
}

- (IBAction)showdialogwithtextfield:(id)sender {
    bool likeinputpassword = true;
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@""
                              message:NSLocalizedString(@"CreatePassword", nil)
                              delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:NSLocalizedString(@"Submit", nil), nil];
    alertView.tag = 4;
    if(likeinputpassword) {
        alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
        [alertView textFieldAtIndex:0].secureTextEntry = YES;
    } else {
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    }
    [[alertView textFieldAtIndex:0] setPlaceholder:NSLocalizedString(@"AccountPassword", nil)];
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 1) {
        NSLog(@"OK Dialog");
    }
    if(alertView.tag == 2) {
        NSLog(@"YES NO Dialog");
        if(buttonIndex == 0) {
            NSLog(@"NO is selected");
        } else if(buttonIndex == 1) {
            NSLog(@"Yes is selected");
        }
    }
    if(alertView.tag == 3) {
        NSLog(@"Multiple button Dialog");
        if(buttonIndex == 0) {
            NSLog(@"Cancel is selected");
        }
        if(buttonIndex == 1) {
            NSLog(@"Door one is selected");
        }
        if(buttonIndex == 2) {
            NSLog(@"Door two is selected");
        }
    }
    if(alertView.tag == 4) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        if ([textField.text length] == 0){
            NSLog(@"TextField no input");
        } else {
            NSLog(@"TextField input = %@", textField.text);
        }
    }
}

@end
