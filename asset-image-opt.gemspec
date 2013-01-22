# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asset-image-opt/version'

Gem::Specification.new do |gem|
  gem.name          = "asset-image-opt"
  gem.version       = Asset::Image::Opt::VERSION
  gem.authors       = ["Oleg Bovykin"]
  gem.email         = ["oleg.bovykin@gmail.com"]
  gem.description   = %q{Lossless optimization for rails assets images}
  gem.summary       = %q{Gem is a command line tool for optimization of rails assets images in app/assets.images}
  gem.homepage      = "https://github.com/arrowcircle/asset-image-opt"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'piet'
  gem.add_development_dependency 'rspec'
end
