Wafelijzer::App.controllers :video do
  
  get :index, :map => "/videos" do
    @videos = Video.order(:created_at, :id).all

    render 'video/index'
  end


  get :video, :with => :id do
    render 'video/show'
  end
  

end
