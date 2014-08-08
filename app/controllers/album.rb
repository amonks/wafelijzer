Wafelijzer::App.controllers :album do
  
  get :index, :map => '/albums' do
    @albums = Album.order(Sequel.desc(:release_date), :id).all
    render 'album/index'
  end


  get :index, :map => '/albums/:id' do
  	@album = Album.where(:id => params['id']).first
    render 'album/show'
  end

  

end
