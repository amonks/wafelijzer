# # This file sets up our database connection.

# First we'll load our Sequel plugins

Sequel::Model.plugin(:schema)
Sequel::Model.plugin(:timestamps)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure

# Heroku sets a DATABASE_URL variable in ENV, but it's not in the format required by Java.
# Here we'll check to see if there's a DATABASE_URL, parse it, and reformat it into the `jdbc` syntax.
if dburl = ENV['DATABASE_URL']
	uri = URI.parse(dburl)
	parsed = "jdbc:postgresql://" + uri.host + ":" + uri.port.to_s + uri.path + "?user=" + uri.user + "&password=" + uri.password
end

# No we select the correct database for our environment and connect to it.
Sequel::Model.db = case Padrino.env
	# In development we should connect to `wafelijzer_development` on localhost.
	when :development then Sequel.connect("jdbc:postgresql://localhost/wafelijzer_development", :max_connections => Integer(ENV['MAX_THREADS'] || 16), :loggers => [logger])
	# In production we should connect to the database url we parsed from Heroku's ENV.
	when :production  then Sequel.connect(parsed, :max_connections => Integer(ENV['MAX_THREADS'] || 16),  :loggers => [logger])
	# In testing we should connect to `wafelijzer_test` on localhost.
	when :test        then Sequel.connect("jdbc:postgresql://localhost/wafelijzer_test", :max_connections => Integer(ENV['MAX_THREADS'] || 16), :loggers => [logger])
end
