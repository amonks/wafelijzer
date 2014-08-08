Wafelijzer::App.controllers :artist do
  
  get :index, :map => '/artists' do
    @artists = Artist.all
    render 'artist/index'
  end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  get :index, :map => "/:slug", :priority => :low do
    @artist = Artist.where(:slug => params[:slug]).first
    render 'artist/show'
  end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
