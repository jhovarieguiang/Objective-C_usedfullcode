//
//  barikGPUImageWrap.m
//  GPUImageTesting
//
//  Created by Jhovarie on 1/31/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "barikGPU.h"

@implementation barikGPU
+(UIImage *) alphaMask :(UIImage *)inputimage : (UIImage *)maskimage {
    //UIImage * image1 = [UIImage imageNamed:@"elementary.jpg"];
    //UIImage * image2 = [UIImage imageNamed:@"printguide_canonselphycp1200_land.png"];
    //UIImage * image1 = [UIImage imageNamed:@"lover.png"];
    //UIImage * image2 = [UIImage imageNamed:@"heartmask2.png"];
    barikGPUCustomFilterTwoTexture *twoinputFilter = [[barikGPUCustomFilterTwoTexture alloc]initWithFragmentShaderFromFile:@"AlphaMask"];
    GPUImagePicture *sourcePicture1 = [[GPUImagePicture alloc] initWithImage:inputimage ];
    GPUImagePicture *sourcePicture2 = [[GPUImagePicture alloc] initWithImage:maskimage ];
    twoinputFilter.mix = .5;
    [sourcePicture1 addTarget:twoinputFilter];
    [sourcePicture1 processImage];
    [twoinputFilter useNextFrameForImageCapture];
    [sourcePicture2 addTarget:twoinputFilter];
    [sourcePicture2 processImage];
    UIImage * output = [twoinputFilter imageFromCurrentFramebuffer];
    return output;
}
@end
