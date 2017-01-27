//
//  AppDelegate.m
//  BasicGUI
//
//  Created by Jhovarie on 1/20/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIStoryboard *storyboard = [self getStoryboard];
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

-(UIStoryboard*) getStoryboard {
    //Device orientation please uncheck portrait support.. landscape only
    /*
     IF Error exists like
     erminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Application windows are expected to have a root view controller at the end of application launch'
     
     Solution
     check the is initial View Controller ViewController.m from storyboard
     */
    UIStoryboard *storyboard;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending){
        int screenHeight = [UIScreen mainScreen].bounds.size.width;
        switch (screenHeight) {
            case 320:
                storyboard = [UIStoryboard storyboardWithName:@"iP5" bundle:nil];
                break;
            default:
                storyboard = [UIStoryboard storyboardWithName:@"iPad" bundle:nil];
                break;
        }
    }else{
        int screenHeight = [UIScreen mainScreen].bounds.size.height;
        switch (screenHeight) {
            case 320:
                storyboard = [UIStoryboard storyboardWithName:@"iP5" bundle:nil];
                break;
                
            case 375:
                storyboard = [UIStoryboard storyboardWithName:@"iP6" bundle:nil];
                break;
                
            case 414:
                storyboard = [UIStoryboard storyboardWithName:@"iP6p" bundle:nil];
                break;
                
            case 768:
                storyboard = [UIStoryboard storyboardWithName:@"iPad" bundle:nil];
                break;
                
            default:
                storyboard = [UIStoryboard storyboardWithName:@"iP6" bundle:nil];
                break;
        }
    }
    return storyboard;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
