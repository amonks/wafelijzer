Wafelijzer::App.controllers :artist do
  
  get :index, :cache => true, :map => '/artists' do
    @title = @page_header = "Artists"
    @artists = Artist.order(:name, :real_name, :slug).all
    render 'artist/index'
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
