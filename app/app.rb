module Wafelijzer
  class App < Padrino::Application
    register SassInitializer
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions


    def cache_is_on
      if ENV["CACHE_ON"]  or  ( (Padrino.env == :production) && ENV["CACHE_ON"] != "false" )
        return true
      else
        return false
      end
    end

    if cache_is_on
      register Padrino::Cache
      enable :caching
      if ENV["MEMCACHEDCLOUD_SERVERS"]
        $cache = Dalli::Client.new(ENV["MEMCACHEDCLOUD_SERVERS"].split(','), :username => ENV["MEMCACHEDCLOUD_USERNAME"], :password => ENV["MEMCACHEDCLOUD_PASSWORD"])
      end
      set :cache, Padrino::Cache.new(:Memcached, :backend => $cache)
    end

    ##
    # Application configuration options.
    #
    # set :raise_errors, true     # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true    # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true  # Shows a stack trace in browser (default for development)
    # set :logging, true      # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, 'foo/bar' # Location for static assets (default root/public)
    # set :reload, false      # Reload application files (default in development)
    # set :default_builder, 'foo'   # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, 'bar'     # Set path for I18n translations (default your_apps_root_path/locale)
    # disable :sessions       # Disabled sessions by default (enable if needed)
    # disable :flash        # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    layout  :application      # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    class Sinatra::Request
      def pjax?
        env['HTTP_X_PJAX'] || self["_pjax"]
      end
    end

    ##
    # You can configure for a specified environment like:
    #
    #   configure :development do
    #   set :foo, :bar
    #   disable :asset_stamp # no asset timestamping for dev
    #   end
    #


    ##
    # You can manage errors like:
    #
    error 404 do
      render 'errors/404'
    end

    error 400 do
      render 'errors/404'
    end

    error 500 do
      render 'errors/404'
    end

    error 505 do
      render 'errors/404'
    end

    error Sequel::DatabaseError do
      render 'errors/404'
    end

  end
end
