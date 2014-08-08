Wafelijzer::App.controllers do
  
  get :index do
    @blog = Blog.order(:created_at, :id).all.last
    @albums = Album.order(:release_date, :id).all
    @video = Video.order(:created_at, :id).all.last
    render 'index'
  end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
