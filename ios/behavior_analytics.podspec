#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint behavior_analytics.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'behavior_analytics'
  s.version          = '0.0.1'
  s.summary          = 'Clearsale behavior analytics'
  s.description      = <<-DESC
Clearsale behavior analytics
                       DESC
  s.homepage         = 'http://example.com'
  # s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.source = { :http => 'https://dev.azure.com/PublicPackagesCS/Behavior/_git/BehaviorAnalytics.SDK.IOS.Specs' }
  s.dependency 'CSBehavior', '3.0.1'
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
