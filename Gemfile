source 'https://rubygems.org'
ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.9'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
gem 'puma'
gem 'jruby-memcached', :groups => [:development]
gem 'dalli', :groups => [:production]

# Project requirements
gem 'rake'
gem 'pry', :groups => [:development, :test]

# Component requirements
gem 'bcrypt'
gem 'sass'
gem 'haml'
gem 'kramdown'
gem 'newrelic_rpm', :groups => [:production]
gem 'chronic'
gem 'titleize'
gem 'stripe'
gem 'slim'
gem 'jdbc-postgresql'
gem 'sequel'
gem 'typhoeus'

gem 'foreman'



# Test requirements
gem 'minitest', :require => 'minitest/autorun', :group => 'test'
gem 'capybara_minitest_spec', :group => 'test'
gem 'rack-test', :require => 'rack/test', :group => 'test'

# Padrino Stable Gem
gem 'padrino', '0.12.2'