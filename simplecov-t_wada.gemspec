# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simplecov/t_wada/version"

Gem::Specification.new do |spec|
  spec.name          = "simplecov-t_wada"
  spec.version       = SimpleCov::Formatter::TWada::VERSION
  spec.authors       = ["Yosuke Kabuto"]
  spec.email         = ["bluewhale1982@gmail.com"]

  spec.summary       = "t_wada AA formatter for SimpleCov code coverage tool"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/ysksn/simplecov-t_wada"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
end
