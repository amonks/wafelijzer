Wafelijzer::Admin.controllers :albums_artists do
  get :index do
    @title = "Albums_artists"
    @albums_artists = AlbumsArtists.all
    render 'albums_artists/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'albums_artists')
    @albums_artists = AlbumsArtists.new
    render 'albums_artists/new'
  end

  post :create do
    @albums_artists = AlbumsArtists.new(params[:albums_artists])
    if (@albums_artists.save rescue false)
      @title = pat(:create_title, :model => "albums_artists #{@albums_artists.id}")
      flash[:success] = pat(:create_success, :model => 'AlbumsArtists')
      params[:save_and_continue] ? redirect(url(:albums_artists, :index)) : redirect(url(:albums_artists, :edit, :id => @albums_artists.id))
    else
      @title = pat(:create_title, :model => 'albums_artists')
      flash.now[:error] = pat(:create_error, :model => 'albums_artists')
      render 'albums_artists/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "albums_artists #{params[:id]}")
    @albums_artists = AlbumsArtists[params[:id]]
    if @albums_artists
      render 'albums_artists/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'albums_artists', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "albums_artists #{params[:id]}")
    @albums_artists = AlbumsArtists[params[:id]]
    if @albums_artists
      if @albums_artists.modified! && @albums_artists.update(params[:albums_artists])
        flash[:success] = pat(:update_success, :model => 'Albums_artists', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:albums_artists, :index)) :
          redirect(url(:albums_artists, :edit, :id => @albums_artists.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'albums_artists')
        render 'albums_artists/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'albums_artists', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Albums_artists"
    albums_artists = AlbumsArtists[params[:id]]
    if albums_artists
      if albums_artists.destroy
        flash[:success] = pat(:delete_success, :model => 'Albums_artists', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'albums_artists')
      end
      redirect url(:albums_artists, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'albums_artists', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Albums_artists"
    unless params[:albums_artists_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'albums_artists')
      redirect(url(:albums_artists, :index))
    end
    ids = params[:albums_artists_ids].split(',').map(&:strip)
    albums_artists = AlbumsArtists.where(:id => ids)
    
    if albums_artists.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Albums_artists', :ids => "#{ids.to_sentence}")
    end
    redirect url(:albums_artists, :index)
  end
end
