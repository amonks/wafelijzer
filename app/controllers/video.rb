# # This is our Video controller
#
# We'll use this file to handle routing for Videos.

Wafelijzer::App.controllers :video do

  # This route is for the videos index at `/videos`.
  get :index, :cache => cache?, :map => "/videos" do

    # set the title
    @title = "Videos"

    # query the database for a list of all the videos
    @videos = Video.order(Sequel.desc(:release_date), :id).all

    # and send it to the renderer
    render_pjaxd 'video/index'
  end

  # # This route is for the individual video pages at `/videos/video.id`
  # # It's currently turned off.
  # get :index, :cache => true, :map => '/videos/:id' do

  #   # set the title
  #   @title = @video.title

  #   # query the database to get the video
  #   @video = Video.where(:id => params['id']).first

  #   # and send it to the renderer
  #   render 'video/show'
  # end

end
