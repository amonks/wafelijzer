Wafelijzer::Admin.controllers :videos do
  get :index do
    @title = "Videos"
    @videos = Video.order(:release_date).all
    render 'videos/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'video')
    @video = Video.new
    render 'videos/new'
  end

  post :create do
    @video = Video.new(params[:video])
    if (@video.save rescue false)
      flush_cache
      params['artists'].each do |artist_id, role|
        if params['artistsEnabled'] && params['artistsEnabled'][artist_id]
          if role.length > 0
            ArtistsVideos.where(:artist_id => artist_id, :video_id => @video.id).destroy
            ArtistsVideos.create(:artist_id => artist_id, :video_id => @video.id, :role => role)
          elsif role.length == 0
            ArtistsVideos.where(:artist_id => artist_id, :video_id => @video.id).destroy
          end
        end
      end
      @video.populate_from_vimeo if (@video.service == "vimeo")
      @video.populate_from_youtube if (@video.service == "youtube")
      @title = pat(:create_title, :model => "video #{@video.id}")
      flash[:success] = pat(:create_success, :model => 'Video')
      params[:save_and_continue] ? redirect(url(:videos, :index)) : redirect(url(:videos, :edit, :id => @video.id))
    else
      @title = pat(:create_title, :model => 'video')
      flash.now[:error] = pat(:create_error, :model => 'video')
      render 'videos/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "video #{params[:id]}")
    @video = Video[params[:id]]
    if @video
      render 'videos/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'video', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "video #{params[:id]}")
    @video = Video[params[:id]]
    if @video
      if @video.modified! && @video.update(params[:video])
        flush_cache
        params['artists'].each do |artist_id, role|
          if params['artistsEnabled'] && params['artistsEnabled'][artist_id]
            if role.length > 0
              ArtistsVideos.where(:artist_id => artist_id, :video_id => @video.id).destroy
              ArtistsVideos.create(:artist_id => artist_id, :video_id => @video.id, :role => role)
            elsif role.length == 0
              ArtistsVideos.where(:artist_id => artist_id, :video_id => @video.id).destroy
            end
          end
        end
        @video.populate_from_vimeo if (@video.service == "vimeo")
        @video.populate_from_youtube if (@video.service == "youtube")

        flash[:success] = pat(:update_success, :model => 'Video', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:videos, :index)) :
          redirect(url(:videos, :edit, :id => @video.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'video')
        render 'videos/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'video', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Videos"
    video = Video[params[:id]]
    ArtistsVideos.where(:video_id => video.id).destroy
    if video
      if video.destroy
        flash[:success] = pat(:delete_success, :model => 'Video', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'video')
      end
      redirect url(:videos, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'video', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Videos"
    unless params[:video_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'video')
      redirect(url(:videos, :index))
    end
    ids = params[:video_ids].split(',').map(&:strip)
    videos = Video.where(:id => ids)

    videos.each do |video|
      ArtistsVideos.where(:video_id => video.id).destroy
    end

    if videos.destroy

      flash[:success] = pat(:destroy_many_success, :model => 'Videos', :ids => "#{ids.to_sentence}")
    end
    redirect url(:videos, :index)
  end
end
