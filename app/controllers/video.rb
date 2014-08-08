Wafelijzer::App.controllers :video do
  
  get :index, :map => "/videos" do
    @videos = Video.order(:created_at, :id).all

    render 'video/index'
  end


  get :index, :map => '/videos/:id' do
  	@video = Video.where(:id => params['id']).first
    render 'video/show'
  end
  

end
