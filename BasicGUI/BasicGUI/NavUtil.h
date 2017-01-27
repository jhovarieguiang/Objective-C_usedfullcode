//
//  NavUtil.h
//  BasicGUI
//
//  Created by Jhovarie on 1/20/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface NavUtil : NSObject
+(void) gotoMainVC : (UIViewController*)currentvc: (UIStoryboard *)storyboard :(bool)isanimated :(bool)ispushviewcontroller;
@end
