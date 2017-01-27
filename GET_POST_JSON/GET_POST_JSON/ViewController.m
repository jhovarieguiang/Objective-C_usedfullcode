//
//  ViewController.m
//  GET_POST_JSON
//
//  Created by Jhovarie on 1/12/17.
//  Copyright © 2017 Jhovarie. All rights reserved.
//

#import "ViewController.h"
//http://stackoverflow.com/questions/10080216/request-with-nsurlrequest
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)GetRequestJSON:(id)sender {
    NSLog(@"GET REQUEST -----------------------------------------------------");
    NSString *targeturl = @"http://192.168.1.62/test/test.php";
    
    NSMutableURLRequest *dataRqst = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:targeturl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    NSHTTPURLResponse *response =[[NSHTTPURLResponse alloc] init];
    NSError* error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:dataRqst returningResponse:&response error:&error];
    NSString *responseString = [[NSString alloc] initWithBytes:[responseData bytes] length:[responseData length] encoding:NSUTF8StringEncoding];
    
    BOOL gotURL = NO;
    if ([responseString isEqualToString:@"(null)"]
        || [responseString isEqualToString:@""]
        || responseString == nil
        || responseString == NULL){
        gotURL = NO;
    }else{
        gotURL = YES;
    }
    if (!gotURL){
        NSString *error = @"Cannot connect to Server.";
        NSString *errorMessage = [NSString stringWithFormat:@"%@",error];
        NSLog(@"ERROR: %@",errorMessage);
    } else {
        NSLog(@"Server Response = %@",responseString);
        NSData* data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves|| NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"JSON Parse Get value using key");
        NSString *str_a = [res valueForKey:@"a"];
        NSLog(@"a = %@",str_a);
        NSString *str_b = [res valueForKey:@"b"];
        NSLog(@"b = %@",str_b);
        NSString *str_c = [res valueForKey:@"c"];
        NSLog(@"c = %@",str_c);
    }
}

- (IBAction)POSTRequestJSON:(id)sender {
    NSLog(@"POST REQUEST -----------------------------------------------------");
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL:
     [NSURL URLWithString:@"http://192.168.1.62/test/test.php"]];
    [request setHTTPMethod:@"POST"];
    NSString *postString = [NSString stringWithFormat:@"myVariable=Hello world !"];
    [request setValue:[NSString stringWithFormat:@"%d", [postString length]]
   forHTTPHeaderField:@"Content-length"];
    [request setHTTPBody:[postString
                          dataUsingEncoding:NSUTF8StringEncoding]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
        if (!error) {
            if ([data length] > 0) {
                NSString* getserverresponse = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"Server Response Result = %@",getserverresponse);
                
                NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves|| NSJSONReadingMutableContainers error:nil];
                
                NSLog(@"JSON Parse Get value using key");
                NSString *str_a = [res valueForKey:@"a"];
                NSLog(@"a = %@",str_a);
                NSString *str_b = [res valueForKey:@"b"];
                NSLog(@"b = %@",str_b);
                NSString *str_c = [res valueForKey:@"c"];
                NSLog(@"c = %@",str_c);
                
            }
        } else {
            NSString *errorMessage = [NSString stringWithFormat:@"%@",error];
            NSLog(@"ERROR: %@",errorMessage);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
