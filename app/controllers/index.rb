# # This is our index controller
#
# We'll use this file to handle routing for the main `/` page.

Wafelijzer::App.controllers do

  # Here's the route.
  get :index, :cache => true do

  # Woo big query! Let's get EVERYTHING from the database!
  # This needs to be optimized. We're only rendering the most-recent 10 things anyway.
  @stuff = (Blog.all + Merch.all + Album.all + Video.all).sort_by(&:release_date).reverse

  # and send it to the renderer
  render 'index', :layout => !pjax?
  end

end
