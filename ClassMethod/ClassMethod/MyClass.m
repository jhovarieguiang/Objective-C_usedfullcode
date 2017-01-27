//
//  MyClass.m
//  ClassMethod
//
//  Created by Jhovarie on 1/26/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

static NSTimer *timer;

-(void) startTimer:(float) _interval: (bool) isrepeats: (TimerEvent) compblock {
    timer = [NSTimer scheduledTimerWithTimeInterval:_interval
     target:[NSBlockOperation blockOperationWithBlock:^{
        /* do this! */
        compblock();
    }]
    selector:@selector(main) userInfo:nil repeats:isrepeats ];
}

-(void) stopTimer {
    if([timer isValid] && timer != nil) {
        [timer invalidate];
    }
}

//http://stackoverflow.com/questions/16324095/custom-completion-block-for-my-own-method
-(void) myCompletionBlockMethod :(myCompletion) compblock {
    compblock(true);
}

-(void)SimpleMethod {
    
}

-(int)ADD:(int)num1:(int)num2 {
    return num1 + num2;
}

-(UIImage *) imageEdit :(UIImage*) input {
    //some code here..
    UIImage *input2 = input;
    return input2;
}

@end
