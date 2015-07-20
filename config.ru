require "rubygems"
require "bundler"
Bundler.require

# models
require "./models/blogpost"

#controllers
require "./app"

use Rack::MethodOverride
run BaughleonWebsite
