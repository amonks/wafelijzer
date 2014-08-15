Wafelijzer::App.controllers :news do
  
  get :index, :cache => true, :map => '/news/:type' do
    @title = @page_header = params[:type].titleize
    @blogs = Blog.where(:type => params[:type]).order(Sequel.desc(:release_date), :id).all
    render 'blog/index'
  end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  get :index, :cache => true, :map => "/:slug", :priority => :low do
    if @artist = Artist.where(:slug => params[:slug]).first
      @title = @artist.name
      render 'artist/show'
    else
      halt 404
      render 'errors/404'
    end

  end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
