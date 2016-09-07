#
#  Be sure to run `pod spec lint AKNSString+phoneFormatter.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name                  = "AKNSString+phoneFormatter"
  s.version               = "0.0.1"
  s.summary               = "This category is ease way to set phone number format."
  s.homepage              = "https://github.com/it-machine/AKNSString-phoneFormatter.objc.git"
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { "Artem Konarev" => "ak@it-machine.ru" }
  s.platform              = :ios, '7.0'
  s.source                = { :git => "https://github.com/it-machine/AKNSString-phoneFormatter.objc.git", :tag => s.version.to_s }
  s.source_files          = 'Classes/*.{h,m}'
  s.public_header_files   = 'Classes/*.h'
  s.framework             = 'Foundation'
  s.requires_arc          = true

end

