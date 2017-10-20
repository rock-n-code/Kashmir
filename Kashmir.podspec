Pod::Spec.new do |spec|
    # Specification
    spec.name       = "Kashmir"
    spec.version    = "0.2.1"
    spec.summary    = "Utility framework to help building macOS, iOS, tvOS and watchOS apps, the Rock & Code way."
    spec.homepage   = "http://git.rock-n-co.de/RockAndCode/Kashmir"
    spec.license    = {
                        :type => "MIT", 
                        :file => "LICENSE"
                    }
    spec.source     = {
                        git: "https://github.com/rock-n-code/Kashmir.git", 
                        tag: "#{spec.version}"
                    }
    spec.authors    = {
                        "Javier Cicchelli" => "javier@rock-n-code.com"
                    } 

    # Platform
    spec.osx.deployment_target      = "10.12"
    spec.ios.deployment_target      = "10.0"
    spec.tvos.deployment_target     = "10.0"
    # spec.watchos.deployment_target  = "3.0"

    # Build settings
    spec.requires_arc   = true

    # Source files
    spec.source_files           = "Kashmir/Shared/**/*.{h,swift}"
    spec.osx.source_files       = "Kashmir/macOS/**/*.{h,swift}"
    spec.ios.source_files       = "Kashmir/iOS/**/*.{h,swift}"
    spec.tvos.source_files      = "Kashmir/tvOS/**/*.{h,swift}"
    spec.watchos.source_files   = "Kashmir/watchOS/**/*.{h,swift}"
    # spec.watchos.exclude_files  = "Kashmir/Shared/**/Network*.swift", 
    #                               "Kashmir/Shared/**/Reachability*.swift", 
    #                               "Kashmir/Shared/**/SC*.swift"
end
