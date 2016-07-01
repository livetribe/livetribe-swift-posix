Pod::Spec.new do |s|
  s.name             = 'LTSwiftPosix'
  s.version          = '0.1.0'
  s.summary          = 'Mockable Swift cross system, Darwin/Glibc, POSIX wrappers.'
  s.homepage         = 'https://github.com/livetribe/livetribe-swift-posix'
  s.license          = { :type => 'apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Alan D. Cabrera' => 'adc@toolazydogs.com' }
  s.source           = { :git => 'https://github.com/livetribe/livetribe-swift-posix.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/maguro'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'LTSwiftPosix/Classes/Posix*.swift'

  s.subspec 'Mock' do |ss|
    ss.source_files = 'LTSwiftPosix/Classes/*.swift'
  end
end
