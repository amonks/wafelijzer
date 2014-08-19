# # This is our cache controller
#
# We'll use this file to handle flushing the cache when /flush is visited.


Wafelijzer::App.controllers :cache do

  # This is the route at `/flush`
  get :index, :map => '/flush' do
    begin
      Wafelijzer::App.cache.flush
      @alert = "Cache flushed!"
      @alert_type = "info"
    rescue
      @alert = "Couldn't flush cache :/ Are you sure caching is turned on?"
      @alert_type = "danger"
    end
    render 'blank'
  end
end
