#
# Be sure to run `pod lib lint DRHome.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DRHome'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DRHome.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/qiaole/DRHome'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qiaole' => 'qiaole@hikvision.com.cn' }
  s.source           = { :svn => ''}
  s.ios.deployment_target = '10.0'
  s.requires_arc = true

  s.source_files = '**/*.{h,m,mm,c,cpp,hpp}'
  s.resources = '**/*.{bundle,lib,png,xib,jpg,mp3,mp4}'
end
