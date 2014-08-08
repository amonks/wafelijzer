Wafelijzer::Admin.controllers :artists_videos do
  get :index do
    @title = "Artists_videos"
    @artists_videos = ArtistsVideos.all
    render 'artists_videos/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'artists_videos')
    @artists_videos = ArtistsVideos.new
    render 'artists_videos/new'
  end

  post :create do
    @artists_videos = ArtistsVideos.new(params[:artists_videos])
    if (@artists_videos.save rescue false)
      @title = pat(:create_title, :model => "artists_videos #{@artists_videos.id}")
      flash[:success] = pat(:create_success, :model => 'ArtistsVideos')
      params[:save_and_continue] ? redirect(url(:artists_videos, :index)) : redirect(url(:artists_videos, :edit, :id => @artists_videos.id))
    else
      @title = pat(:create_title, :model => 'artists_videos')
      flash.now[:error] = pat(:create_error, :model => 'artists_videos')
      render 'artists_videos/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "artists_videos #{params[:id]}")
    @artists_videos = ArtistsVideos[params[:id]]
    if @artists_videos
      render 'artists_videos/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'artists_videos', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "artists_videos #{params[:id]}")
    @artists_videos = ArtistsVideos[params[:id]]
    if @artists_videos
      if @artists_videos.modified! && @artists_videos.update(params[:artists_videos])
        flash[:success] = pat(:update_success, :model => 'Artists_videos', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:artists_videos, :index)) :
          redirect(url(:artists_videos, :edit, :id => @artists_videos.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'artists_videos')
        render 'artists_videos/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'artists_videos', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Artists_videos"
    artists_videos = ArtistsVideos[params[:id]]
    if artists_videos
      if artists_videos.destroy
        flash[:success] = pat(:delete_success, :model => 'Artists_videos', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'artists_videos')
      end
      redirect url(:artists_videos, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'artists_videos', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Artists_videos"
    unless params[:artists_videos_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'artists_videos')
      redirect(url(:artists_videos, :index))
    end
    ids = params[:artists_videos_ids].split(',').map(&:strip)
    artists_videos = ArtistsVideos.where(:id => ids)
    
    if artists_videos.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Artists_videos', :ids => "#{ids.to_sentence}")
    end
    redirect url(:artists_videos, :index)
  end
end
