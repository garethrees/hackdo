require 'rubygems'
require 'bundler'
 
Bundler.require
 
require './app'
 
set :environment, :development
disable :run

configure :development do
  require 'sass/plugin/rack'
  use Sass::Plugin::Rack
end
 
run App