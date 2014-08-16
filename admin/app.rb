module Wafelijzer
  class Admin < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Admin::AccessControl

    set :admin_model, 'Account'
    set :login_page,  '/sessions/new'

    enable  :sessions
    disable :store_location

    # enable caching
    # uncomment the end of this line to enable caching in development
    if Padrino.env == :production # || Padrino.env == :development
      register Padrino::Cache
      enable :caching
      if ENV["MEMCACHEDCLOUD_SERVERS"]
        $cache = Dalli::Client.new(ENV["MEMCACHEDCLOUD_SERVERS"].split(','), :username => ENV["MEMCACHEDCLOUD_USERNAME"], :password => ENV["MEMCACHEDCLOUD_PASSWORD"])
      end
    end


    case Padrino.env
      # uncomment this line to enable caching in development
      # when :development then set :cache, Padrino::Cache.new(:Memcached) # Uses default server at localhost
      when :production  then set :cache, Padrino::Cache.new(:Memcached, :backend => $cache)
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
