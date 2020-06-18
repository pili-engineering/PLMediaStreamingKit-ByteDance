#
#  Be sure to run `pod spec lint PLShortVideoKit-ByteDance.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "PLMediaStreamingKit-ByteDance"
  s.version      = "2.0.0"
  s.summary      = "PILI iOS media streaming framework via RTMP."
  s.homepage     = "https://github.com/pili-engineering/PLMediaStreamingKit-ByteDance"
  s.license      = "Apache License 2.0"
  s.author       = { "pili" => "pili@qiniu.com" }
  s.source       = { :http => "https://sdk-release.qnsdk.com/PLMediaStreamingKit-ByteDance-v2.0.0.zip"}
  s.platform     = :ios
  s.requires_arc = true

  s.ios.deployment_target	= "8.0"

  s.subspec "iphoneos" do |ss1|
    ss1.vendored_frameworks		= 'Pod/Library/*.framework'
  end

  s.frameworks = ['UIKit', 'AVFoundation', 'CoreGraphics', 'CFNetwork', 'AudioToolbox', 'CoreMedia', 'VideoToolbox']
  s.libraries = 'z', 'c++', 'icucore', 'sqlite3'

end
