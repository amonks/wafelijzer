Wafelijzer::App.controllers :video do
  
  get :index, :map => "/videos" do
    @title = "Videos"
    @videos = Video.order(Sequel.desc(:release_date), :id).all

    render 'video/index'
  end


  get :index, :map => '/videos/:id' do
  	@video = Video.where(:id => params['id']).first
  	@title = @video.title
    render 'video/show'
  end
  

end
