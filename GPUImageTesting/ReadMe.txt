Project Structure must be..

GPUImageTesting (root project)
	- GPUImageTesting
	- GPUImageTesting
	- GPUImageTestingTests
	- GPUImageTestingUITests
	- Release-iphone //you can get this by downloading https://github.com/BradLarson/GPUImage
	 and build the project copy the Release-iphone folder paste it to your root project directory.

Build setttings
header search path = $SOURCE_ROOT/Release-iphone/include
header search path = $SOURCE_ROOT/lib/	 


Build Phases Framework needed.
- QuartzCore.framework
- AVFoundation.framework
- OpenGLES.framework
- CoreVideo.framework
- CoreMedia.framework
- GPUImage.framework




	 
	 