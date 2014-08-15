Sequel::Model.plugin(:schema)
Sequel::Model.plugin(:timestamps)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure

if uri = URI.parse(ENV['DATABASE_URL'])
	parsed = "jdbc:postgresql://" + uri.host + ":" + uri.port.to_s + uri.path + "?user=" + uri.user + "&password=" + uri.password
end

Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("jdbc:postgresql://localhost/wafelijzer_development", :max_connections => Integer(ENV['MAX_THREADS'] || 16), :loggers => [logger])
  when :production  then Sequel.connect(parsed,  :loggers => [logger])
  when :test        then Sequel.connect("jdbc:postgresql://localhost/wafelijzer_test",        :loggers => [logger])
end
