#
#  RTMenuController.podspec
#  RTMenuController
#
#  Created by Ryuichi Tanimoto on 11/19/16
#  Copyright (c) 2016 Ryuichi Tanimoto. All rights reserved.
# 

Pod::Spec.new do |s|
  s.name = 'RTMenuController'
  s.version = '0.1.1'
  s.swift_versions = '4.2'
  s.summary = 'A UIKit menu controller in swift'
  s.homepage = "https://github.com/RyuichiTanimoto/#{s.name}"
  s.license = {:type => 'GPL', :file => 'LICENSE'}
  s.author = {'ryuichi' => 'loyd.ryut@gmail.com'}
  s.platform = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source = {:git => "#{s.homepage}.git", :tag => "#{s.version}"}
  s.source_files = "#{s.name}/**/*.swift"
  s.exclude_files = "#{s.name}/Exclude"
  s.requires_arc = true
  s.xcconfig = {
    'SWIFT_VERSION' => '4.2'
  }
  s.dependency 'swift-utilities', '~> 0.2.0'
end
