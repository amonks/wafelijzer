# # This is our blog controller
#
# We'll use this file to handle routing for blogs.
#
# blogs could be press, news, events, or anything else.
# Each distinct `blog.type` creates a link up in the navbar to an index of all blogs of that type, eg `press`.

Wafelijzer::App.controllers :news do

  # This route is for the pages for each `blog.type`.
  # We'll map it to `/news/:type` because `/blogs/events` or `blogs/press` sounds weird.
  get :index, :cache => cache_is_on, :map => '/news/:type' do

    # Set the title.
    @title = @page_header = params[:type].titleize

    # Query the database for all blogs of this type
    @blogs = Blog.where(:type => params[:type]).order(Sequel.desc(:release_date), :id).all

    # and render them
    render_pjaxd 'blog/index'
  end

end
