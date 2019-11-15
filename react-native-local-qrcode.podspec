require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name           = 'react-native-local-qrcode'
  s.version        = package['version']
  s.summary        = package['description']
  s.description    = package['description']
  s.license        = package['license']
  s.author         = package['author']
  s.homepage       = 'https://github.com/tranhiepqna/react-native-local-barcode-recognizer'
  s.source         = { :git => "https://github.com/tranhiepqna/react-native-local-barcode-recognizer.git", :tag => "#{s.version}" }
  s.source_files   = "ios/**/*.{h,m}"

  s.ios.frameworks = 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'ImageIO', 'QuartzCore'
  s.osx.frameworks = 'AVFoundation', 'CoreMedia', 'QuartzCore'

  s.default_subspec = 'All'

  s.subspec 'All' do |ss|
    ss.source_files = '"ios/ZXingObjC-3.2.2/ZXingObjC/**/*.{h,m}'
  end

  s.subspec 'Core' do |ss|
    ss.source_files = '"ios/ZXingObjC-3.2.2/ZXingObjC/*.{h,m}', '"ios/ZXingObjC-3.2.2/ZXingObjC/client/*.{h,m}', '"ios/ZXingObjC-3.2.2/ZXingObjC/common/**/*.{h,m}', '"ios/ZXingObjC-3.2.2/ZXingObjC/core/**/*.{h,m}', '"ios/ZXingObjC-3.2.2/ZXingObjC/multi/**/*.{h,m}'
    ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "ZXINGOBJC_USE_SUBSPECS" }		 
  end

  s.subspec 'Aztec' do |ss|
    ss.dependency '"ios/ZXingObjC-3.2.2/ZXingObjC/Core'
    ss.source_files = '"ios/ZXingObjC-3.2.2/ZXingObjC/aztec/**/*.{h,m}'
    ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "ZXINGOBJC_USE_SUBSPECS ZXINGOBJC_AZTEC" }
  end

  s.subspec 'DataMatrix' do |ss|
    ss.dependency '"ios/ZXingObjC-3.2.2/ZXingObjC/Core'
    ss.source_files = '"ios/ZXingObjC-3.2.2/ZXingObjC/datamatrix/**/*.{h,m}'
    ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "ZXINGOBJC_USE_SUBSPECS ZXINGOBJC_DATAMATRIX" }
  end

  s.subspec 'MaxiCode' do |ss|
    ss.dependency '"ios/ZXingObjC-3.2.2/ZXingObjC/Core'
    ss.source_files = '"ios/ZXingObjC-3.2.2/ZXingObjC/maxicode/**/*.{h,m}'
    ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "ZXINGOBJC_USE_SUBSPECS ZXINGOBJC_MAXICODE" }
  end

  s.subspec 'OneD' do |ss|
    ss.dependency '"ios/ZXingObjC-3.2.2/ZXingObjC/Core'
    ss.source_files = '"ios/ZXingObjC-3.2.2/ZXingObjC/oned/**/*.{h,m}', '"ios/ZXingObjC-3.2.2/ZXingObjC/client/result/**/*.{h,m}'
    ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "ZXINGOBJC_USE_SUBSPECS ZXINGOBJC_ONED" }
  end

  s.subspec 'PDF417' do |ss|
    ss.dependency '"ios/ZXingObjC-3.2.2/ZXingObjC/Core'
    ss.source_files = '"ios/ZXingObjC-3.2.2/ZXingObjC/pdf417/**/*.{h,m}'
    ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "ZXINGOBJC_USE_SUBSPECS ZXINGOBJC_PDF417" }
  end

  s.subspec 'QRCode' do |ss|
    ss.dependency '"ios/ZXingObjC-3.2.2/ZXingObjC/Core'
    ss.source_files = '"ios/ZXingObjC-3.2.2/ZXingObjC/qrcode/**/*.{h,m}'
    ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "ZXINGOBJC_USE_SUBSPECS ZXINGOBJC_QRCODE" }
  end

  s.ios.deployment_target = "8.0"

  s.dependency "React"
end