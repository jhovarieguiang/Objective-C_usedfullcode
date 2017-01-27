//
//  MyClass.h
//  ClassMethod
//
//  Created by Jhovarie on 1/26/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

typedef void(^TimerEvent)();
typedef void(^myCompletion)(BOOL);

@interface MyClass : NSObject

//Completion block example
-(void) startTimer:(float) _interval: (bool) isrepeats: (TimerEvent) compblock;
-(void) stopTimer;

-(void) myCompletionBlockMethod :(myCompletion) compblock;

//Simple method example
-(void)SimpleMethod;
-(int)ADD:(int)num1:(int)num2;
-(UIImage*)imageEdit:(UIImage*)input;

@end
