# # This is our Gemfile, where we'll specify Wafelijzer's ruby dependencies.

# set the source to rubygems.org
source 'https://rubygems.org'

# We're going to use `jruby` rather than the standard MRI implementation.
# `jruby` is faster and supports threading, but it takes a long time to boot up.
ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.9'



# ## Server requirements
#

# puma is a threading-enabled server that works well in a `jruby` environment.
gem 'puma'

# we'll use memcached for caching.
# In development we'll use the standard memcached gem.
# To turn caching on in development, uncomment the following lines and also
# the relevant lines in `app/app.rb` and `admin/app.rb`
#
# gem 'jruby-memcached', :groups => [:development]

# And on Heroku we'll use `dalli` to connect to their memcached-cloud server.
gem 'dalli', :groups => [:production]



# ## Project requirements
#

# Padrino Stable Gem
gem 'padrino', '0.12.2'

# jbdc-postgresql is the java database connector for postgres databases
gem 'jdbc-postgresql'

# We use sequel to map database rows to ruby objects
gem 'sequel'

# We use `rake` for automating things like database schema migrations and testing.
gem 'rake'

# To make development easier, we'll use [pry](http://pryrepl.org/) so we can easily open a repl anywhere in the code.
gem 'pry', :groups => [:development, :test]



# ## Component requirements
#

# We use bcrypt for hashing passwords in the admin app.
gem 'bcrypt'

# Sass for preprocessing stylesheets
gem 'sass'

# Kramdown for rendering Markdown
gem 'kramdown'

# Slim for html templating
gem 'slim'

# Newrelic for analytics and to keep the app from going to sleep on free Heroku plans
gem 'newrelic_rpm', :groups => [:production]

# Chronic for parsing dates.
gem 'chronic'

# Money for formatting money.
gem 'money'

# Titleize for automatically title-casing
gem 'titleize', :git => 'https://github.com/belgianman/titleize.git'

# Stripe for processing credit cards
gem 'stripe'

# typhoeus for reliably making http requests
gem 'typhoeus'



# # Test requirements
#

# We'll use minitest to run tests
gem 'minitest', :require => 'minitest/autorun', :group => 'test'

# capybara to handle automated website use in our tests
gem 'capybara_minitest_spec', :group => 'test'

# and rack-test
gem 'rack-test', :require => 'rack/test', :group => 'test'

