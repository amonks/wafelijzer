module Wafelijzer
  class Admin < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Admin::AccessControl

    ##
    # Application configuration options
    #
    # set :raise_errors, true         # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true          # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true      # Shows a stack trace in browser (default for development)
    # set :logging, true              # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, "foo/bar"   # Location for static assets (default root/public)
    # set :reload, false              # Reload application files (default in development)
    # set :default_builder, "foo"     # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, "bar"         # Set path for I18n translations (default your_app/locales)
    # disable :sessions               # Disabled sessions by default (enable if needed)
    # disable :flash                  # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    # layout  :my_layout              # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    set :admin_model, 'Account'
    set :login_page,  '/sessions/new'

    enable  :sessions
    disable :store_location

    # enable caching
    unless Padrino.env == :test
      register Padrino::Cache
      enable :caching
    end

    case Padrino.env
      when :development then set :cache, Padrino::Cache.new(:Memcached) # Uses default server at localhost
      when :production  then set :cache, Padrino::Cache.new(:Memcached, ENV['MEMCACHEDCLOUD_SERVERS'], :exception_retry_limit => 1)
    end

    access_control.roles_for :any do |role|
      role.protect '/'
      role.allow   '/sessions'
    end

    access_control.roles_for :admin do |role|
      role.project_module :merches, '/merches'
      role.project_module :themes, '/themes'
      role.project_module :blogs, '/blogs'
      role.project_module :settings, '/settings'
      role.project_module :texts, '/texts'
      role.project_module :videos, '/videos'
      role.project_module :albums, '/albums'
      role.project_module :artists, '/artists'
      role.project_module :accounts, '/accounts'
    end

    # Custom error management 
    error(403) { @title = "Error 403"; render('errors/403', :layout => :error) }
    error(404) { @title = "Error 404"; render('errors/404', :layout => :error) }
    error(500) { @title = "Error 500"; render('errors/500', :layout => :error) }
  end
end
