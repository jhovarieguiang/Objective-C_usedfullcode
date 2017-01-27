//
//  WebViewController.m
//  BasicGUI
//
//  Created by Jhovarie on 1/20/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "NavUtil.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *address = @"http://www.google.com/";
    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:address]]];
    _webview.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    //CAPTURE USER LINK-CLICK.
    //This will display all link clicked in UIWebView
    NSURL *url = [request URL];
    NSString *addr = [url absoluteString];
    NSLog(@"address = %@",addr);
    return YES;
}
- (IBAction)back:(id)sender {
    [NavUtil gotoMainVC:self :self.storyboard :false :false];
}



@end
