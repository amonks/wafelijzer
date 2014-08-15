Wafelijzer::App.controllers :album do
  
  get :index, :cache => true, :map => '/albums' do
  	@title = @page_header = "Albums"
    @albums = Album.order(Sequel.desc(:release_date), :id).all
    render 'album/index'
  end
 
end
