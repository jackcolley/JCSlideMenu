#
# Be sure to run `pod lib lint JCSlideMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCSlideMenu'
  s.version          = '0.1.0'
  s.summary          = 'A simple slide out menu inspired by AKSwiftSlideMenu'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple slide out menu inspired by AKSwiftSlideMenu. An easy way to add a slide out draw to your app.
                       DESC

  s.homepage         = 'https://github.com/jackcolley/JCSlideMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jackcolley' => 'jack@jackcolley.co.uk' }
  s.source           = { :git => 'https://github.com/jackcolley/JCSlideMenu.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jackcolley'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source_files = 'JCSlideMenu/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JCSlideMenu' => ['JCSlideMenu/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
