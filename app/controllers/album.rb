Wafelijzer::App.controllers :album do
  
  get :index, :map => '/albums' do
    @albums = Album.order(:created_at, :id).all

    render 'album/index'
  end


  get :album, :with => :id do
    render 'album/show'
  end

  

end
