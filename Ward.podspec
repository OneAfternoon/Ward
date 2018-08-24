Pod::Spec.new do |s|
  s.name         = "Ward"
  s.version      = "1.0.3"
  s.summary      = "A Swift micro-framework to clean up memory management syntax."
  s.homepage     = "https://github.com/OneAfternoon/Ward"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Swain Molster" => "swain.molster@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source        = { :git => "https://github.com/OneAfternoon/Ward.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.swift_version = "4.1"
end
