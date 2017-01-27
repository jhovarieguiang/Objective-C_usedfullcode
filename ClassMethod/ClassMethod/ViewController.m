//
//  ViewController.m
//  ClassMethod
//
//  Created by Jhovarie on 1/26/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "ViewController.h"

#import "MyClass.h"

@interface ViewController () {
    int counter;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MyClass *myclass = [[MyClass alloc]init];
    
    [myclass startTimer:1.0 :true :^{
        NSLog(@"Looping..");
        counter++;
        if(counter == 10) {
            [myclass stopTimer];
            NSLog(@"Stoped.");
        }
    }];
    
    [myclass myCompletionBlockMethod:^(BOOL result) {
        if(result) {
            NSLog(@"TRUE..");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

