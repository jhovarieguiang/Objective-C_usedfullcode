//
//  TableViewController.m
//  BasicGUI
//
//  Created by Jhovarie on 1/20/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "NavUtil.h"
#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

static UITableView *tableView2;
NSArray *tableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    NSLog(@"Restoration Identifier = %@",self.restorationIdentifier);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    tableView2 = tableView;
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"heart8.png"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Your Code here
    //int index =  [NSIndexPath getIndexes:indexPath];
    NSLog(@"Table cell clicked = %ld ",(long)indexPath.row);
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSInteger i2 = [indexPath row];
        NSLog(@"Delete object at index = %li",(long)i2);
        //convert NSArray to NSMutable array
        NSMutableArray *temp_nsmutablearray = [NSMutableArray arrayWithArray:tableData];
        [temp_nsmutablearray removeObjectAtIndex:i2]; //remove item
        tableData = [temp_nsmutablearray copy]; // reinit tableData
        
    }
  [tableView2 reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [NavUtil gotoMainVC:self :self.storyboard :false :false];
}

@end
