//
//  PickerViewController.m
//  BasicGUI
//
//  Created by Jhovarie on 1/20/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "NavUtil.h"
#import "PickerViewController.h"

@interface PickerViewController () {
    NSArray *_pickerData;
     int currentselected;
    __weak IBOutlet UIPickerView *picker;
}

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pickerData = @[@"One", @"Two", @"Three"];
    
    picker.dataSource = self;
    picker.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    currentselected = row;
    return _pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"selected index = %li value = %@",(long)row,[_pickerData objectAtIndex:row]);
    currentselected = row;
}


- (IBAction)back:(id)sender {
    [NavUtil gotoMainVC:self :self.storyboard :false :false];
}

@end
