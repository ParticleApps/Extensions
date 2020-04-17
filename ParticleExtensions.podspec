Pod::Spec.new do |spec|
  spec.name                  = 'ParticleExtensions'
  spec.version               = '1.0.2'
  spec.summary               = 'Particle\'s Swift extensions.'
  spec.description           = 'Adds convenience methods for common objects in UIKit & Foundation.'
  spec.homepage              = 'https://github.com/ParticleApps/Extensions'
  spec.license               = { :type => 'MIT' , :file => 'LICENSE'}
  spec.author                = { 'Rocco Del Priore' => 'rocco@particleapps.co' }
  spec.source                = { :git => 'https://github.com/ParticleApps/Extensions.git', :tag => "#{spec.version}" }
  spec.social_media_url      = 'https://twitter.com/ParticleAppsCo'
  spec.frameworks            = 'Foundation', 'UIKit'
  spec.ios.deployment_target = '9.0'
  spec.source_files          = "ParticleExtensions", "ParticleExtensions/**/*.{swift,h,m}"
  spec.swift_version         = '4.2'
end
