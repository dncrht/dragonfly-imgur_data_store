# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "dragonfly-imgur_data_store"
  spec.version       = '0.1.0'
  spec.authors       = ['Daniel Cruz Horts']

  spec.summary       = %q{Data store for storing Dragonfly images on Imgur}
  spec.homepage      = 'https://github.com/dncrht/dragonfly-imgur_data_store'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dragonfly"
  spec.add_dependency "imgurapi"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.6" # Must be the same version as dragonfly.gemspec
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
