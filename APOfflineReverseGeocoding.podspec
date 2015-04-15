Pod::Spec.new do |s|
  s.name         = "APOfflineReverseGeocoding"
  s.version      = "0.0.1"
  s.summary      = "Offline reverse geocoding library written in Objective-C"
  s.homepage     = "https://github.com/Alterplay/APOfflineReverseGeocoding"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Serg Krivoblotsky" => "krivoblotsky@me.com" }
  s.source       = { :git => "https://github.com/Alterplay/APOfflineReverseGeocoding.git",
		                 :tag => s.version.to_s }
  s.source_files = 'APOfflineReverseGeocoding/**/*.{h,m}'
  s.resources = 'APOfflineReverseGeocoding/GeoJSON/countries.geo.json'
  s.ios.deployment_target = "7.0"
  s.requires_arc = true
  s.frameworks   = 'CoreLocation'
end