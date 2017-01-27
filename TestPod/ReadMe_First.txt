Tutorials from https://www.youtube.com/watch?v=t_VhXHzsRVc

pod lib create TestPod
cd TestPod
open -a Xcode TestPod.podspec

//modify the fallowing
Pod::Spec.new do |s|
  s.name             = 'TestPod'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TestPod.'

search for s.description      = <<-DESC then add # to the fallowing.
#s.description      = <<-DESC
#TODO: Add long description of the pod here.
#                       DESC

git tag 0.1.0
git push -u origin master --tags

pod lib lint TestPod.podspec

pod trunk register myemail@gmail.com "Your Name"
or 
pod trunk register myemail@gmail.com "Your Name" --description='description here'

pod trunk push TestPod.podspec
or 
pod trunk push TestPod.podspec --verbose