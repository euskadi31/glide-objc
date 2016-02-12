Pod::Spec.new do |s|
    s.name         = 'Glide'
    s.version      = '1.0.3'
    s.summary      = 'Glide client for iOS & Mac OS X'
    s.author = {
        'Axel Etcheverry' => 'axel@etcheverry.biz'
    }
    s.source = {
        :git => 'https://github.com/euskadi31/glide-objc.git',
        :tag => "v#{s.version}"
    }
    s.source_files = 'Glide/**/*.{h}'
    s.homepage    = 'https://github.com/euskadi31/glide-objc'
    s.license     = {
        :type => 'MIT',
        :file => 'LICENSE.md'
    }
    s.social_media_url = 'http://twitter.com/euskadi31'
    s.ios.deployment_target = '9.0'
    s.osx.deployment_target = '10.11'
    s.tvos.deployment_target = '9.0'
end
