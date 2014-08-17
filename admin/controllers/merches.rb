Wafelijzer::Admin.controllers :merches do
  get :index do
    @title = "Merches"
    @merches = Merch.order(:release_date).all
    render 'merches/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'merch')
    @merch = Merch.new
    render 'merches/new'
  end

  post :create do
    @merch = Merch.new(params[:merch])
    if (@merch.save rescue false)
      flush_cache
      @merch.update(:release_date => Chronic.parse(params[:release_date]))
      if params[:artists]
        params[:artists].each do |artist|
          @merch.add_artist(artist.first)
        end
      end
      @title = pat(:create_title, :model => "merch #{@merch.id}")
      flash[:success] = pat(:create_success, :model => 'Merch')
      params[:save_and_continue] ? redirect(url(:merches, :index)) : redirect(url(:merches, :edit, :id => @merch.id))
    else
      @title = pat(:create_title, :model => 'merch')
      flash.now[:error] = pat(:create_error, :model => 'merch')
      render 'merches/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "merch #{params[:id]}")
    @merch = Merch[params[:id]]
    if @merch
      render 'merches/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'merch', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "merch #{params[:id]}")
    @merch = Merch[params[:id]]
    if @merch
      if @merch.modified! && @merch.update(params[:merch])
        flush_cache
        @merch.update(:release_date => Chronic.parse(params[:release_date]))
        if params[:artists]
          @merch.remove_all_artists
          params[:artists].each do |artist|
            @merch.add_artist(artist.first)
          end
        end
        flash[:success] = pat(:update_success, :model => 'Merch', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:merches, :index)) :
          redirect(url(:merches, :edit, :id => @merch.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'merch')
        render 'merches/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'merch', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Merches"
    merch = Merch[params[:id]]
    if merch
      if merch.destroy
        flush_cache
        flash[:success] = pat(:delete_success, :model => 'Merch', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'merch')
      end
      redirect url(:merches, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'merch', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Merches"
    unless params[:merch_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'merch')
      redirect(url(:merches, :index))
    end
    ids = params[:merch_ids].split(',').map(&:strip)
    merches = Merch.where(:id => ids)

    if merches.destroy
      flush_cache
      flash[:success] = pat(:destroy_many_success, :model => 'Merches', :ids => "#{ids.to_sentence}")
    end
    redirect url(:merches, :index)
  end
end
