#
# Be sure to run `pod lib lint PowerplayToastKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PowerplayToastKit'
  s.version          = '0.2.1'
  s.summary          = 'A Simple Toast Library to show Toast and dialogs in iOS.'
  s.requires_arc     = true
  s.platform         = :ios
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
  s.description      = <<-DESC
  A Simple Toast Library to show Toast and dialogs in iOS. It supports showing of custom Views as an Overlay on top ViewController and can also be used to show default Toasts like success, warning, error and info.
  DESC
  
  s.homepage         = 'https://github.com/mithilesh-parmar/toast-kit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mithilesh Parmar' => 'mithileshparmar1@gmail.com' }
  s.source           = { :git => 'https://github.com/mithilesh-parmar/toast-kit.git', :tag => s.version.to_s }
  s.social_media_url = 'http://www.linkedin.com/in/mithilesh-parmar-97395712b'
  s.social_media_url = 'https://twitter.com/corleone_parmar'
  
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  
  s.source_files = 'PowerplayToastKit/Classes/**/*{.swift}'
  
  s.resource_bundles = {
    'Resources' => ['PowerplayToastKit/Assets/*.{png}']
  }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'SnapKit'
end
