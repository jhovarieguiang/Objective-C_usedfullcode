//
//  barikGPUImageWrap.h
//  GPUImageTesting
//
//  Created by Jhovarie on 1/31/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImagePicture.h"
#import <Foundation/Foundation.h>
#import "barikGPUCustomFilter.h"
#import "barikGPUCustomFilterTwoTexture.h"

@interface barikGPU : NSObject
  +(UIImage *) alphaMask :(UIImage *)inputimage : (UIImage *)maskimage;
@end
