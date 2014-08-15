Wafelijzer::App.controllers do
  
  get :index, :cache => true do
    @blogs = Blog.order(Sequel.desc(:release_date), :id).all
    @albums = Album.order(Sequel.desc(:release_date), :id).all
    @videos = Video.order(Sequel.desc(:release_date), :id).all
    render 'index'
  end
  
end
