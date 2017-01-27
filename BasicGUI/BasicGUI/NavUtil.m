//
//  NavUtil.m
//  BasicGUI
//
//  Created by Jhovarie on 1/20/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "NavUtil.h"

@implementation NavUtil

+(void) gotoMainVC : (UIViewController*)currentvc: (UIStoryboard *)storyboard :(bool)isanimated :(bool)ispushviewcontroller{
    /*
     to invoke
     [NavUtil gotoMainVC:self :self.storyboard :false :false];
     */
    NSString *storboardid = @"mainviewvc_ip6";
    if ([UIScreen mainScreen].bounds.size.height == 768){ //iPad
        storboardid = @"mainviewvc_ipad";
    }else if ([UIScreen mainScreen].bounds.size.height == 414){ //iP6p
        storboardid = @"mainviewvc_ip6p";
    }else if ([UIScreen mainScreen].bounds.size.height == 375){ //iP6
        storboardid = @"mainviewvc_ip6";
    }else if ([UIScreen mainScreen].bounds.size.height == 320){ //iP5
        storboardid = @"mainviewvc_ip5";
    }
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:storboardid];
    if(ispushviewcontroller == false) {
        [currentvc presentViewController:vc animated:isanimated completion:nil];
    } else {
        [currentvc.navigationController pushViewController:vc animated:isanimated];
    }
}

@end
