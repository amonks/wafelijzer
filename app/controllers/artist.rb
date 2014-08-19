# # This is our Artist controller
#
# We'll use this file to handle routing for Artists.

Wafelijzer::App.controllers :artist do

  # This route is for the artists index at `/artists`
  get :index, :cache => true, :map => '/artists' do

    # set the title
    @title = "Artists"

    # query the database for a list of all artists
    @artists = Artist.order(:name, :real_name, :slug).all

    # and render our artists index
    render 'artist/index'
  end

  # This route is for individual artist pages at `/artist.slug`
  # We need to set the priority low so it doesn't try to catch every request `/something`
  get :show, :cache => true, :map => "/:slug", :priority => :low do

    # If there's an artist with that slug, get it from the database
    if @artist = Artist.where(:slug => params[:slug]).first

      # set the title
      @title = @artist.name

      # and render the page
      render 'artist/show'

    # if there is no artist with that slug, throw an error
    else
      halt 404
      render 'errors/404'
    end
  end

end
