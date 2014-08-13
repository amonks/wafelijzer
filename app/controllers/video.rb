Wafelijzer::App.controllers :video do
  
  get :index, :map => "/videos" do
    @title = @videos = Video.order(Sequel.desc(:release_date), :id).all
    @page_header = "Merch"

    render 'video/index'
  end


  get :index, :map => '/videos/:id' do
  	@video = Video.where(:id => params['id']).first
  	@title = @video.title
    render 'video/show'
  end
  

end
