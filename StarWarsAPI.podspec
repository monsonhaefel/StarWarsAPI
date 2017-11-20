#
#  Be sure to run `pod spec lint StarWarsAPI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "StarWarsAPI"
  s.version      = "0.0.1"
  s.summary      = "A Swift 4 REST API for StarWarsAPI.co."
  s.description  = "This is functional, but incomplete, Swift 4 implementation of the StarWarsAPI.co the purpose is to serve as an example of my code."                  
  s.homepage     = "http://uncommon-design.com"
  s.license      = "MIT"
  s.author       = { "Uncommon Design" => "richard@uncommon-design.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/monsonhaefel/StarWarsAPI.git", :tag => "#{s.version}" }
  s.source_files = "StarWarsAPI", "StarWarsAPI/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4' }
end
