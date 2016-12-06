#
# Be sure to run `pod lib lint NRConnection.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'NRConnection'
s.version          = '1.0.1'
s.summary          = 'NRConnection lets use the network layer in the simplest way. Send parameters,images and videos to server in a simplest way.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
NRConnection: lets use the network layer in the simplest way. Send parameters,images and videos to server in a simplest way. Well there are various network classes available for open source, but most of them missing the simplicity . NRConnection allow developers to send parameters, images and videos to server in a simplest way. Just a single method for video and images which needs the array of images and videos and NRConnection sends it to the server in a most elegant way with the use of Alamofire. You can get the success/failure with the help of NRCompletionHandler.
DESC

s.homepage         = 'https://github.com/naveenrana1309/NRConnection'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'naveenrana1309' => 'naveenrana1309@gmail.com' }
s.source           = { :git => 'https://github.com/naveenrana1309/NRConnection.git', :tag => s.version.to_s }

# s.social_media_url = 'https://www.linkedin.com/in/naveen-rana-9a371a40'

s.ios.deployment_target = '8.0'

s.source_files = 'NRConnection/Classes/**/*'

# s.resource_bundles = {
#   'NRConnection' => ['NRConnection/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
s.dependency 'Alamofire', '~> 3.3'
s.dependency 'ReachabilitySwift', '~> 2.3'

end
