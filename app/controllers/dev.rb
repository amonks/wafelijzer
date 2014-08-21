# # This is our dev controller
#
# We'll use this file to handle development tasks like flushing the task and displaying config variables.

Wafelijzer::App.controllers :dev do

  # We'll use this route to handle flushing the cache when /flush is visited.
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

  unless Padrino.env == :production

    # This is the route at `/env`. We'll use it to show our environment vars.
    get :index, :map => '/env' do
      ENV.to_json
    end

    # we'll use this route to open up a repl when /pry is visited
    get :pry, :map => '/pry' do
      binding.pry
    end
  end
end
