


Pod::Spec.new do |s|
s.name             = 'MyCustomLoader'
s.version          = '0.1.0'
s.summary          = 'A short description of CustomLoader.'

s.homepage         = 'https://github.com/karthik-ios-dev/CustomLoader'
s.author           = { 'karthik samy' => 'mkkarthiik@gmail.com' }

s.source           = { :git => 'https://github.com/karthik-ios-dev/CustomLoader.git', :tag => s.version.to_s  }

s.summary          = 'A simple lightweight loader with activity indicator.'
s.license          = { :type => 'MIT', :file => 'LICENSE' }

s.ios.deployment_target = '10.0'

s.source_files = 'MyCustomLoader/Classes/**/*'

 s.resource_bundles = {
'MyCustomLoader' => ['MyCustomLoader/Classes/**/*.{xib}']
 }

s.dependency 'PodAsset'

end
