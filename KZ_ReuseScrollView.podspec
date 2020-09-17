
Pod::Spec.new do |s|

    s.name = 'KZ_ReuseScrollView'
    s.version = '0.1.3'
    s.summary = 'iOS ReuseScrollView.'
    s.homepage = 'https://github.com/KieronZhang/KZ_ReuseScrollView'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang' => 'https://github.com/KieronZhang'}

    s.source = {:git => 'https://github.com/KieronZhang/KZ_ReuseScrollView.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.requires_arc = true

    s.ios.frameworks = 'Foundation', 'UIKit'

    s.ios.deployment_target = '8.0'

    s.ios.vendored_frameworks = 'KZ_ReuseScrollView/KZ_ReuseScrollView_iOS.framework'

end
