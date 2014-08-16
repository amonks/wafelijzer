# # This file is configures our app's boot.

# First we want to set our environment.
# It should default to to 'development', unless it's set in ENV, like it would be on Heroku.
RACK_ENV = ENV['RACK_ENV'] ||= 'development'  unless defined?(RACK_ENV)

# Now we set our app's root directory.
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies, first from Bundler
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)
# and now from the Ruby core library.
require 'date'
require 'open-uri'
require 'uri'

##
# We don't have any before (RE)load hooks here
#
Padrino.before_load do
end

##
# We don't have any after (RE)load hooks here
#
Padrino.after_load do
end


# Load the app!
Padrino.load!
