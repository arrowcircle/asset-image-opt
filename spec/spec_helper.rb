require 'bundler/setup'
require 'rspec'
require "rspec/core"
require "rspec/expectations"
require "asset-image-opt"
Dir[Pathname.new(File.expand_path('../', __FILE__)).join('support/**/*.rb')].each {|f| require f}

