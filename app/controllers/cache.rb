# # This is our cache controller
#
# We'll use this file to handle flushing the cache when /flush is visited.


Wafelijzer::App.controllers :cache do

  # This is the route at `/flush`
  get :index, :map => '/flush' do
    Wafelijzer::App.cache.flush
    redirect '/'
  end

end
