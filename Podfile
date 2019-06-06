# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def private_pods
    
    pod 'Fabric'
    pod 'Crashlytics'
    pod 'GirdersSwift'
    pod 'RxSwift'
    pod 'RxRetroSwift'
    pod 'Firebase/Core'
    pod 'Firebase/Auth'

end

target 'StandardApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  private_pods
  
  # Pods for StandardApp

  target 'StandardAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'StandardAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
