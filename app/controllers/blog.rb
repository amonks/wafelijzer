Wafelijzer::App.controllers do
  
  get :index do
    @blogs = Blog.order(Sequel.desc(:release_date), :id).all
    @albums = Album.order(Sequel.desc(:release_date), :id).all
    @videos = Video.order(Sequel.desc(:release_date), :id).all
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
