//
//  barikGPUCustomFilterTwoTexture.h
//  GPUImageTesting
//
//  Created by Jhovarie on 1/31/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//


/*
 Usage ..
 #import "barikGPUCustomFilterTwoTexture.h"
 
 UIImage * image1 = [UIImage imageNamed:@"lover.png"];
 UIImage * image2 = [UIImage imageNamed:@"heartmask2.png"];
 barikGPUCustomFilterTwoTexture *twoinputFilter = [[barikGPUCustomFilterTwoTexture alloc]initWithFragmentShaderFromFile:@"CustomShader3"]; // create a file CustomShader3.fsh
 GPUImagePicture *sourcePicture1 = [[GPUImagePicture alloc] initWithImage:image1 ];
 GPUImagePicture *sourcePicture2 = [[GPUImagePicture alloc] initWithImage:image2 ];
 twoinputFilter.mix = .5;
 [sourcePicture1 addTarget:twoinputFilter];
 [sourcePicture1 processImage];
 [twoinputFilter useNextFrameForImageCapture];
 [sourcePicture2 addTarget:twoinputFilter];
 [sourcePicture2 processImage];
 UIImage * output = [twoinputFilter imageFromCurrentFramebuffer];
 */

#import <Foundation/Foundation.h>

#import "GPUImageTwoInputFilter.h"

@interface barikGPUCustomFilterTwoTexture : GPUImageTwoInputFilter
{
    GLint mixUniform;
}

// Mix ranges from 0.0 (only image 1) to 1.0 (only image 2), with 1.0 as the normal level
@property(readwrite, nonatomic) CGFloat mix;

@end
