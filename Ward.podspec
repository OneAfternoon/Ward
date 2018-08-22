Pod::Spec.new do |spec|
  spec.name         = 'Ward'
  spec.version      = '1.0.2'
  spec.summary      = 'A Swift micro-framework to clean up memory management syntax.'

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.homepage     = 'https://github.com/OneAfternoon/Ward'
  spec.authors      = { 'Swain Molster' => 'swain.molster@gmail.com' }

  spec.platform     = :ios, "9.0"
  spec.swift_version = "4.1"

  spec.source          = { :git => "https://github.com/OneAfternoon/Ward.git", :tag => "v#{spec.version}" }
  spec.source_files    = "Ward/"
end
