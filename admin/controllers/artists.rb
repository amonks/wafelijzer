Wafelijzer::Admin.controllers :artists do
  get :index do
    @title = "Artists"
    @artists = Artist.order(:name, :real_name, :slug).all
    render 'artists/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'artist')
    @artist = Artist.new
    render 'artists/new'
  end

  post :create do
    @artist = Artist.new(params[:artist])
    if (@artist.save rescue false)
      flush_cache
      if params[:members]
        params[:members].each do |member|
          @artist.add_member(member.first)
        end
      end
      @title = pat(:create_title, :model => "artist #{@artist.id}")
      flash[:success] = pat(:create_success, :model => 'Artist')
      params[:save_and_continue] ? redirect(url(:artists, :index)) : redirect(url(:artists, :edit, :id => @artist.id))
    else
      @title = pat(:create_title, :model => 'artist')
      flash.now[:error] = pat(:create_error, :model => 'artist')
      render 'artists/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "artist #{params[:id]}")
    @artist = Artist[params[:id]]
    if @artist
      render 'artists/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'artist', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "artist #{params[:id]}")
    @artist = Artist[params[:id]]
    if @artist
      if @artist.modified! && @artist.update(params[:artist])
        flush_cache
        if params[:members]
          @artist.remove_all_members
          params[:members].each do |member|
            @artist.add_member(member.first)
          end
        end
        flash[:success] = pat(:update_success, :model => 'Artist', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:artists, :index)) :
          redirect(url(:artists, :edit, :id => @artist.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'artist')
        render 'artists/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'artist', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do

    @title = "Artists"
    artist = Artist[params[:id]]
    AlbumsArtists.where(:artist_id => artist.id).destroy
    ArtistsVideos.where(:artist_id => artist.id).destroy
    if artist
      if artist.destroy
        flush_cache
        flash[:success] = pat(:delete_success, :model => 'Artist', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'artist')
      end
      redirect url(:artists, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'artist', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Artists"
    unless params[:artist_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'artist')
      redirect(url(:artists, :index))
    end
    ids = params[:artist_ids].split(',').map(&:strip)
    artists = Artist.where(:id => ids)

    artists.each do |artist|
      AlbumsArtists.where(:artist_id => artist.id).destroy
      ArtistsVideos.where(:artist_id => artist.id).destroy
    end

    if artists.destroy
      flosh_cache
      flash[:success] = pat(:destroy_many_success, :model => 'Artists', :ids => "#{ids.to_sentence}")
    end
    redirect url(:artists, :index)
  end
end
