# # This is our Album controller
#
# We'll use this file to handle routing for albums.

Wafelijzer::App.controllers :album do

  # This route is for the albums index at `/albums`
  get :index, :cache => true, :map => '/albums' do

    # set the title
    @title = @page_header = "Albums"

    # query the database for a list of all albums
    @albums = Album.order(Sequel.desc(:release_date), :id).all

    # and render our album index
    render_pjaxd 'album/index'
  end

end
