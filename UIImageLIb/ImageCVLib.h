//
//  ImageCVLib.h
//  UIImageLIb
//
//  Created by Jhovarie on 1/25/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <opencv2/opencv.hpp>

@interface ImageCVLib : NSObject
+(void)blurMat:(cv::Mat&)inputmat :(int)size;
+(cv::Mat) CVMattoUIImagewithAlpha: (UIImage *)inputimage;
+(UIImage *)imageToCVMatWithAlpha:(const cv::Mat&)cvMat;
+(UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;
+(cv::Mat)cvMatFromUIImage:(UIImage *)image;
@end
