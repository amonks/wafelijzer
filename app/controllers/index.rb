# # This is our index controller
#
# We'll use this file to handle routing for the main `/` page.

Wafelijzer::App.controllers do

  # Here's the route.
  get :index, :cache => true do

  # Woo big query! Let's get EVERYTHING from the database!
  # This needs to be optimized. We're only rendering the most-recent 10 things anyway.
  @blogs = Blog.order(Sequel.desc(:release_date), :id).all
  @albums = Album.order(Sequel.desc(:release_date), :id).all
  @videos = Video.order(Sequel.desc(:release_date), :id).all

  # and send it to the renderer
  render 'index'
  end

end
