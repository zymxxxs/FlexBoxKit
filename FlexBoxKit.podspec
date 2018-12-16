#
# Be sure to run `pod lib lint FlexBoxKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlexBoxKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FlexBoxKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zym/FlexBoxKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zym' => 'zymxxxs@gmail.com' }
  s.source           = { :git => 'https://github.com/zym/FlexBoxKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'FlexBoxKit/Classes/**/*'
  
  s.dependency 'Ono', '~> 2.1.0'
  s.dependency 'YogaKit', '~> 1.7'
end
