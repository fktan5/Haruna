# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git' 
target 'Haruna' do
  platform :ios, '12.0' 
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Haruna

  pod 'RealmSwift'
  pod 'Eureka', '~> 4.3.1'
  target 'HarunaTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RealmSwift'
  end

  target 'HarunaUITests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RealmSwift'
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end
end
