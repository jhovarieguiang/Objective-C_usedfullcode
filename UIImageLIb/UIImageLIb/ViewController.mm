//
//  ViewController.m
//  UIImageLIb
//
//  Created by Jhovarie on 1/25/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import "ImageLib.h"
#import "ImageCVLib.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *display;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    UIImage *test = [UIImage imageNamed:@"test.jpeg"];
   
    //convert uiimage to Mat
    cv::Mat matfromuiimage =  [ImageCVLib CVMattoUIImagewithAlpha: test];
    
    //modify mat in opencv
    for(int x = 0; x < matfromuiimage.cols; x++) {
        for(int y = 0; y < matfromuiimage.rows; y++) {
            matfromuiimage.at<cv::Vec4b>(y,x)[0] = matfromuiimage.at<cv::Vec4b>(y,x)[0];
           // matfromuiimage.at<cv::Vec4b>(y,x)[1] = matfromuiimage.at<cv::Vec4b>(y,x)[1];
             matfromuiimage.at<cv::Vec4b>(y,x)[1] = 100;
            matfromuiimage.at<cv::Vec4b>(y,x)[2] = matfromuiimage.at<cv::Vec4b>(y,x)[2];
            matfromuiimage.at<cv::Vec4b>(y,x)[3] = matfromuiimage.at<cv::Vec4b>(y,x)[3];
        }
    }
    
    //convert Mat to UIImage
    UIImage *convertimage = [ImageCVLib imageToCVMatWithAlpha: matfromuiimage];
    
    //scale image
    UIImage *scaled = [ImageLib  scaleToSize: convertimage: 100: 100];

    [_display setImage:scaled];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
