//
//  ViewController.m
//  BasicGUI
//
//  Created by Jhovarie on 1/20/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "PickerViewController.h"
#import "WebViewController.h"
#import "DialogViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    //To add the notification
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(deviceOrientationDidChange:) name: UIDeviceOrientationDidChangeNotification object: nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    //to remove the
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)deviceOrientationDidChange:(NSNotification *)notification{
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    if (deviceOrientation == UIDeviceOrientationPortrait){
        NSLog(@"Orientation UIDeviceOrientationPortrait");
    } else if (deviceOrientation == UIDeviceOrientationPortraitUpsideDown){
        NSLog(@"Orientation UIDeviceOrientationPortraitUpsideDown");
    } else if (deviceOrientation == UIDeviceOrientationLandscapeLeft){
        NSLog(@"Orientation UIDeviceOrientationLandscapeLeft");
    } else if (deviceOrientation == UIDeviceOrientationLandscapeRight){
        NSLog(@"Orientation UIDeviceOrientationLandscapeRight");
    } else {
        NSLog(@"Default");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotoTableViewController:(id)sender {
    [self gotoTableVC:self.storyboard :self.navigationController : false : false];
}

- (IBAction)gotoPickerViewController:(id)sender {
    [self gotoPickerVC:self.storyboard :self.navigationController : false : false];
}

- (IBAction)gotoWebViewController:(id)sender {
    [self gotoWebviewVC:self.storyboard :self.navigationController : false : false];
}
- (IBAction)gotoDialogViewController:(id)sender {
[self gotoDialogVC:self.storyboard :self.navigationController : false : false];
}


-(void) gotoTableVC :(UIStoryboard *)storyboard : (UINavigationController *)navigationController :(bool)isanimated :(bool)ispushviewcontroller{
    /*
     to invoke
      [self gotoTableVC:self.storyboard :self.navigationController : false : false];
     */
    NSString *storboardid = @"tablevc_ip6";
    if ([UIScreen mainScreen].bounds.size.height == 768){ //iPad
        storboardid = @"tablevc_ipad";
    }else if ([UIScreen mainScreen].bounds.size.height == 414){ //iP6p
        storboardid = @"tablevc_ip6p";
    }else if ([UIScreen mainScreen].bounds.size.height == 375){ //iP6
        storboardid = @"tablevc_ip6";
    }else if ([UIScreen mainScreen].bounds.size.height == 320){ //iP5
        storboardid = @"tablevc_ip5";
    }
    TableViewController *vc = [storyboard instantiateViewControllerWithIdentifier:storboardid];
    if(ispushviewcontroller == false) {
       [self presentViewController:vc animated:isanimated completion:nil];
    } else {
        [navigationController pushViewController:vc animated:isanimated];
    }
}

-(void) gotoPickerVC :(UIStoryboard *)storyboard : (UINavigationController *)navigationController :(bool)isanimated :(bool)ispushviewcontroller{
    /*
     to invoke
     [self gotoTableVC:self.storyboard :self.navigationController : false : false];
     */
    NSString *storboardid = @"pickervc_ip6";
    if ([UIScreen mainScreen].bounds.size.height == 768){ //iPad
        storboardid = @"pickervc_ipad";
    }else if ([UIScreen mainScreen].bounds.size.height == 414){ //iP6p
        storboardid = @"pickervc_ip6p";
    }else if ([UIScreen mainScreen].bounds.size.height == 375){ //iP6
        storboardid = @"pickervc_ip6";
    }else if ([UIScreen mainScreen].bounds.size.height == 320){ //iP5
        storboardid = @"pickervc_ip5";
    }
    PickerViewController *vc = [storyboard instantiateViewControllerWithIdentifier:storboardid];
    if(ispushviewcontroller == false) {
        [self presentViewController:vc animated:isanimated completion:nil];
    } else {
        [navigationController pushViewController:vc animated:isanimated];
    }
}

-(void) gotoWebviewVC :(UIStoryboard *)storyboard : (UINavigationController *)navigationController :(bool)isanimated :(bool)ispushviewcontroller{
    /*
     to invoke
     [self gotoTableVC:self.storyboard :self.navigationController : false : false];
     */
    NSString *storboardid = @"webviewvc_ip6";
    if ([UIScreen mainScreen].bounds.size.height == 768){ //iPad
        storboardid = @"webviewvc_ipad";
    }else if ([UIScreen mainScreen].bounds.size.height == 414){ //iP6p
        storboardid = @"webviewvc_ip6p";
    }else if ([UIScreen mainScreen].bounds.size.height == 375){ //iP6
        storboardid = @"webviewvc_ip6";
    }else if ([UIScreen mainScreen].bounds.size.height == 320){ //iP5
        storboardid = @"webviewvc_ip5";
    }
    WebViewController *vc = [storyboard instantiateViewControllerWithIdentifier:storboardid];
    if(ispushviewcontroller == false) {
        [self presentViewController:vc animated:isanimated completion:nil];
    } else {
        [navigationController pushViewController:vc animated:isanimated];
    }
}

-(void) gotoDialogVC :(UIStoryboard *)storyboard : (UINavigationController *)navigationController :(bool)isanimated :(bool)ispushviewcontroller{
    /*
     to invoke
     [self gotoTableVC:self.storyboard :self.navigationController : false : false];
     */
    NSString *storboardid = @"dialogvc_ip6";
    if ([UIScreen mainScreen].bounds.size.height == 768){ //iPad
        storboardid = @"dialogvc_ipad";
    }else if ([UIScreen mainScreen].bounds.size.height == 414){ //iP6p
        storboardid = @"dialogvc_ip6p";
    }else if ([UIScreen mainScreen].bounds.size.height == 375){ //iP6
        storboardid = @"dialogvc_ip6";
    }else if ([UIScreen mainScreen].bounds.size.height == 320){ //iP5
        storboardid = @"dialogvc_ip5";
    }
    DialogViewController *vc = [storyboard instantiateViewControllerWithIdentifier:storboardid];
    if(ispushviewcontroller == false) {
        [self presentViewController:vc animated:isanimated completion:nil];
    } else {
        [navigationController pushViewController:vc animated:isanimated];
    }
}

@end

