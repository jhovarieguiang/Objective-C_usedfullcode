//
//  barikGPUCustomFilter.h
//  GPUImageTesting
//
//  Created by Jhovarie on 1/30/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

/*
 Usaged
 
 #import "barikGPUCustomFilter.h"
 
 ..
 UIImage *inputImage = [UIImage imageNamed:@"yourimage.png"];
 barikGPUCustomFilter *stillImagecustomFilter = [[barikGPUCustomFilter alloc]initWithFragmentShaderFromFile:@"CustomShader2"]; //extension is .fsh example CustomShader2.fsh
 //stillImagecustomFilter.exposure = 0.0f;
 GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
 [stillImageSource addTarget:stillImagecustomFilter];
 [stillImagecustomFilter useNextFrameForImageCapture];
 [stillImageSource processImage];
 UIImage *currentFilteredVideoFrame = [stillImagecustomFilter imageFromCurrentFramebuffer];
 ..
 
 */

#import <Foundation/Foundation.h>
#import "GPUImageFilter.h"

@interface barikGPUCustomFilter : GPUImageFilter
{
    GLint exposureUniform;
    
   
   //GLint redUniform;
   /*GLint greenUniform;
    GLint blueUniform;
    GLint alphaUniform;
    */
}

// Exposure ranges from -10.0 to 10.0, with 0.0 as the normal level
@property(readwrite, nonatomic) CGFloat exposure;
//@property(readwrite, nonatomic) CGFloat red;
//@property(readwrite, nonatomic) CGFloat green;
//@property(readwrite, nonatomic) CGFloat blue;
//@property(readwrite, nonatomic) CGFloat alpha;

@end
