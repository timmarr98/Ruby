Gem::Specification.new do |spec|
    spec.name        = "studio_game-0419-timothy"
    spec.version     = "1.0.0"
    spec.author      = "Timothy"
    spec.email       = "timothywmarr98@gmail.com"
    spec.summary     = "A wonderful game!"
    spec.homepage    = "https://github.com/timmarr98"
    spec.license     = "MIT"
  
    spec.files       = Dir["{bin,lib}/**/*"] + %w[LICENSE.txt README.md]
    spec.executables = ["studio_game"]
  
    spec.required_ruby_version = ">= 3.2.0"
  end