# # This file is where we'll configure global settings across both the admin app and the main app.

Padrino.configure_apps do
  # enable :sessions
  set :session_secret, '03d0ee10209c5d996f373ef99737efd174258f551ee3405d283768ff3cf514de'
  set :protection, :except => :path_traversal
  set :protect_from_csrf, true
end
# Now we'll mount the admin interface to /admin
Padrino.mount("Wafelijzer::Admin", :app_file => Padrino.root('admin/app.rb')).to("/admin")


# First we'll mount the main app to /
Padrino.mount('Wafelijzer::App', :app_file => Padrino.root('app/app.rb')).to('/')
