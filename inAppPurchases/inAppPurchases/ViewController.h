//
//  ViewController.h
//  inAppPurchases
//
//  Created by Jhovarie on 1/19/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface ViewController : UIViewController <SKPaymentTransactionObserver, SKProductsRequestDelegate>

//in app purchased
@property (strong, nonatomic) SKProductsRequest *request;
@property (strong, nonatomic) NSArray *products;

@property (strong, nonatomic) SKProduct * product;

@end

