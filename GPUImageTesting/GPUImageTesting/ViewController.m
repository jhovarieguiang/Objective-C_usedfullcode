//
//  ViewController.m
//  GPUImageTesting
//
//  Created by Jhovarie on 1/23/17.
//  Copyright © 2017 3DMe Player. All rights reserved.
//

#import "GPUImage.h"
#import "ViewController.h"

/*
 build settings header search path = $SOURCE_ROOT/Release-iphone/include
 build settings library search path = $SOURCE_ROOT/lib/
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //example #1 using built in filter ---------------------------------------------
    /*
     UIImage *inputImage = [UIImage imageNamed:@"palasyo.jpeg"];
     GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
     GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
     [stillImageSource addTarget:stillImageFilter];
     [stillImageFilter useNextFrameForImageCapture];
     [stillImageSource processImage];
     UIImage *currentFilteredVideoFrame = [stillImageFilter imageFromCurrentFramebuffer];
     [self saveImageToDocument: currentFilteredVideoFrame:@"test.jpeg"];
     */
    
    //example #2 using custom filter ---------------------------------------------
    /*
    UIImage *inputImage = [UIImage imageNamed:@"palasyo.jpeg"];
    GPUImageFilter *stillImagecustomFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromFile:@"CustomShader"];
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
    [stillImageSource addTarget:stillImagecustomFilter];
    [stillImagecustomFilter useNextFrameForImageCapture];
    [stillImageSource processImage];
    UIImage *currentFilteredVideoFrame = [stillImagecustomFilter imageFromCurrentFramebuffer];
    [self saveImageToDocument: currentFilteredVideoFrame:@"test2.jpeg"];
    */
    
    //example #3 using single filter ---------------------------------------------
    /*
     UIImage *inputImage = [UIImage imageNamed:@"palasyo.jpeg"];
     //GPUImageSepiaFilter *stillImageFilter2 = [[GPUImageSepiaFilter alloc] init];
     GPUImageBrightnessFilter *stillImageFilter2 = [[GPUImageBrightnessFilter alloc]init];
     stillImageFilter2.brightness = 0.5;
     UIImage *quickFilteredImage = [stillImageFilter2 imageByFilteringImage:inputImage];
     [self saveImageToDocument: quickFilteredImage:@"test.jpeg"];
     */
    
    //example #4 using other built in filter number  --------------------------------------------------------
    /*
     UIImage *inputImage = [UIImage imageNamed:@"iap.jpg"];
     // GPUImageSepiaFilter *stillImageFilter2 = [[GPUImageSepiaFilter alloc] init];
     // GPUImageBrightnessFilter *stillImageFilter2 = [[GPUImageBrightnessFilter alloc]init];
     // stillImageFilter2.brightness = 0.5;
     
     //GPUImageLanczosResamplingFilter *stillImageFilter2 = [[GPUImageLanczosResamplingFilter alloc]init];
     //stillImageFilter2.verticalTexelSpacing = .5;
     */
    
    /*
     GPUImageRGBFilter *stillImageFilter2 = [[GPUImageRGBFilter alloc]init];
     stillImageFilter2.red = .7;
     stillImageFilter2.blue = .1;
     stillImageFilter2.green = .1;
     */
    //[stillImageFilter2 forceProcessingAtSizeRespectingAspectRatio:CGSizeMake(300, 300)];
    
    //this code resize skew image..
    /*
     GPUImageLanczosResamplingFilter *stillImageFilter2 = [[GPUImageLanczosResamplingFilter alloc]init];
     int newwidth = 700;
     int newheight = 300;
     //with skew
     [stillImageFilter2 forceProcessingAtSize:CGSizeMake(newwidth, newheight)];//forceProcessingAtSize
     //no skew
     // [stillImageFilter2 forceProcessingAtSizeRespectingAspectRatio:CGSizeMake(300, 300)];
     
     UIImage *quickFilteredImage = [stillImageFilter2 imageByFilteringImage:inputImage];
     [self saveImageToDocument: quickFilteredImage:@"test.jpg"];
     */
    
    //example #5 blending image --------------------------------------------------------
    UIImage * image1 = [UIImage imageNamed:@"lover.png"];
    UIImage * image2 = [UIImage imageNamed:@"heartmask2.png"];
    GPUImageAlphaBlendFilter *twoinputFilter = [[GPUImageAlphaBlendFilter alloc] init];
    //GPUImageSubtractBlendFilter *twoinputFilter = [[GPUImageSubtractBlendFilter alloc] init];
    
    GPUImagePicture *sourcePicture1 = [[GPUImagePicture alloc] initWithImage:image1 ];
    GPUImagePicture *sourcePicture2 = [[GPUImagePicture alloc] initWithImage:image2 ];
    [sourcePicture1 addTarget:twoinputFilter];
    [sourcePicture1 processImage];
    [twoinputFilter useNextFrameForImageCapture];
    [sourcePicture2 addTarget:twoinputFilter];
    [sourcePicture2 processImage];
    UIImage * image = [twoinputFilter imageFromCurrentFramebuffer];
    [self saveImageToDocument: image :@"test.png"];
}

-(void) saveImageToDocument :(UIImage *)image : (NSString *)filename{
    // UIImage *image = ...;
    //NSString  *path = @"";
    //[UIImageJPEGRepresentation(image, 1.0) writeToFile:path atomically:YES];
    
    NSString *path = [NSString stringWithFormat:@"Documents/%@",filename];
    NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    //NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.png"];
    //[UIImagePNGRepresentation(image) writeToFile:pngPath atomically:YES];
    [UIImageJPEGRepresentation(image, 1.0) writeToFile:pngPath atomically:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
