Pod::Spec.new do |s|
  s.name            = "AXPhotoViewer"
  s.version         = "1.9.1"
  s.license         = { :type  => 'MIT', :file => 'LICENSE.md' }
  s.summary         = "An iOS/tvOS photo gallery viewer, useful for viewing a large number of photos."
  s.homepage        = "https://github.com/alexhillc/AXPhotoViewer"
  s.author          = { "Alex Hill" => "alexhill.c@gmail.com" }
  s.source          = { :git => "https://github.com/bonebox/AXPhotoViewer.git", :tag => "#{s.version}" }

  s.requires_arc    = true

  s.ios.deployment_target = '15.0'
  s.swift_versions = '5.7'

  s.dependency  'AXStateButton', '>= 1.2.1'
  s.dependency  'FLAnimatedImage', '>= 1.0.0'
  s.resource_bundle = { 'AXPhotoViewerResources' => ['Sources/AXPhotoViewer/Resources/*.{xcassets}'] }
  s.source_files  = 'Sources/AXPhotoViewer/*.{swift,h,m}',
                       'Sources/AXPhotoViewer/Classes/**/*.{swift,h,m}',
                       'Sources/AXPhotoViewer/Protocols/*.{swift,h,m}',
                       'Sources/AXPhotoViewer/Extensions/*.{swift,h,m}',
                       'Sources/AXPhotoViewer/Utilities/*.{swift,h,m}',
                       'Sources/AXPhotoViewer/Integrations/SimpleNetworkIntegration.swift'
  s.frameworks    = 'ImageIO', 'UIKit', 'QuartzCore'
end
