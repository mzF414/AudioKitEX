# Copyright (c) AudioKit, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

Pod::Spec.new do |spec|
  spec.name = 'AudioKitEX'
  spec.version = '5.4.0'
  spec.license =  { :type => 'MIT', :file => "LICENSE" }
  spec.homepage = 'https://audiokit.io/'
  spec.documentation_url = 'http://audiokit.io/docs/'

  spec.summary = 'Open-source audio synthesis, processing, & analysis platform.'
  spec.description = 'Open-source audio synthesis, processing, & analysis platform.'

  spec.authors = 'Aurelius Prochazka'
  spec.source = {
    :git => 'https://github.com/mzf414/AudioKitEX.git',
    :tag => spec.version.to_s,
  }
  spec.platforms = { :ios => "11.0", :osx => "10.13", :tvos => "11.0" }
  
  spec.default_subspec = 'Core'
  
  spec.subspec 'Core' do |subspec|
    subspec.requires_arc = false
    subspec.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES'
    }
    subspec.source_files = 'Sources/AudioKitEX/**/*.{swift}'
    subspec.swift_version = '5.0'
    subspec.dependency 'AudioKitEX/CAudioKitEX'
  end
  
  spec.subspec 'CAudioKitEX' do |subspec|
    subspec.requires_arc = false
    subspec.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES'
    }
    subspec.source_files = 'Sources/CAudioKitEX/**/*.{c,h,cpp,mm,m}'
    subspec.public_header_files = 'Sources/CAudioKitEX/**/*.{h}'
    subspec.compiler_flags = [
      '-fno-omit-frame-pointer',
      '-fexceptions',
      '-Wall',
      '-Werror',
      '-std=c++1y',
      '-fPIC'
    ]
  end
end
