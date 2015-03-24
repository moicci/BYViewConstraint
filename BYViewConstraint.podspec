#
# Be sure to run `pod lib lint BYViewConstraint.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BYViewConstraint"
  s.version          = "0.3.0"
  s.summary          = "convinient class for Constraint of View (Auto Layout)."
  s.description      = <<-DESC
                       BYViewConstraint is covenient class to implement the "Auto Layout".
                       DESC
  s.homepage         = "https://github.com/moicci/BYViewConstraint"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "moicci" => "fukuda@bylo.jp" }
  s.source           = { :git => "https://github.com/moicci/BYViewConstraint.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.[mh]'
  s.resource_bundles = {
    'BYViewConstraint' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
