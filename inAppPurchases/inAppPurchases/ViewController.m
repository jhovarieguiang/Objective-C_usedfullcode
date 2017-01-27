//
//  ViewController.m
//  inAppPurchases
//
//  Created by Jhovarie on 1/19/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initInAppPurchased];
}

-(void) initInAppPurchased {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"product_ids"
                                         withExtension:@"plist"];
    NSArray *productIdentifiers = [NSArray arrayWithContentsOfURL:url];
    NSString *productid = [productIdentifiers objectAtIndex:0];
    NSLog(@"retrieved product id = %@",productid);
    if([SKPaymentQueue canMakePayments]) {
        SKProductsRequest *request = [[SKProductsRequest alloc]initWithProductIdentifiers:[NSSet setWithObjects:productid, nil]];
        request.delegate = self;
        [request start];
        NSLog(@"Device can used in-App Purchased");
    } else {
        NSLog(@"Please enable inApp Purchase in your Settings.");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Buy_Action:(id)sender {
    SKPayment *payment = [SKPayment paymentWithProduct:_product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];

    NSLog(@"Buy");
    /*
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"product_ids"
                                         withExtension:@"plist"];
    NSArray *productIdentifiers = [NSArray arrayWithContentsOfURL:url];
    NSString *productid = [productIdentifiers objectAtIndex:0];
    NSLog(@"retrieved product id = %@",productid);
    if([SKPaymentQueue canMakePayments]) {
        SKProductsRequest *request = [[SKProductsRequest alloc]initWithProductIdentifiers:[NSSet setWithObjects:productid, nil]];
        request.delegate = self;
        [request start];
        NSLog(@"Device can used in-App Purchased");
    } else {
        NSLog(@"Please enable inApp Purchase in your Settings.");
    }
    */
}

- (IBAction)Restore_Action:(id)sender {
    NSLog(@"Restore");
    [[SKPaymentQueue defaultQueue]addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

//in app purchase methods --------------------------------------------------------------------
- (void)validateProductIdentifiers:(NSArray *)productIdentifiers
{
    SKProductsRequest *productsRequest = [[SKProductsRequest alloc]
                                          initWithProductIdentifiers:[NSSet setWithArray:productIdentifiers]];
    
    // Keep a strong reference to the request.
    self.request = productsRequest;
    productsRequest.delegate = self;
    [productsRequest start];
}

- (void)productsRequest:(SKProductsRequest *)request
     didReceiveResponse:(SKProductsResponse *)response
{
    self.products = response.products;
   // NSArray *products2 = response.products;
    if(response.products.count != 0){
        NSLog(@"Product Found.");
        //_product = products2[0];
        _product = self.products[0];
    } else {
        NSLog(@"No Product Found.");
    }
    
    for (NSString *invalidIdentifier in response.invalidProductIdentifiers) {
        // Handle any invalid product identifiers.
        NSLog(@"Handle any invalid product identifiers");
    }
    NSLog(@"displayStoreUI");
    // [self displayStoreUI]; // Custom method
}

-(void) paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions{
    for(SKPaymentTransaction *transaction in transactions) {
        switch(transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                // [self UnlockPurchase]; //sucessfully buy
                NSLog(@"Successfuly Buy");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"Transaction Failed.");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
            default:
                break;
        }
    }
    NSLog(@"%s",__FUNCTION__);
}

-(void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue {
    //[self UnlockPurchase];
    NSLog(@"%s",__FUNCTION__);
}

@end
