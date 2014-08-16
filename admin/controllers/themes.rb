Wafelijzer::Admin.controllers :themes do
  get :index do
    @title = "Themes"
    @themes = Theme.all
    render 'themes/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'theme')
    @theme = Theme.new
    render 'themes/new'
  end

  post :create do
    @theme = Theme.new(params[:theme])
    if (@theme.save rescue false)
      flush_cache
      @title = pat(:create_title, :model => "theme #{@theme.id}")
      flash[:success] = pat(:create_success, :model => 'Theme')
      params[:save_and_continue] ? redirect(url(:themes, :index)) : redirect(url(:themes, :edit, :id => @theme.id))
    else
      @title = pat(:create_title, :model => 'theme')
      flash.now[:error] = pat(:create_error, :model => 'theme')
      render 'themes/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "theme #{params[:id]}")
    @theme = Theme[params[:id]]
    if @theme
      render 'themes/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'theme', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "theme #{params[:id]}")
    @theme = Theme[params[:id]]
    if @theme
      if @theme.modified! && @theme.update(params[:theme])
        flush_cache
        flash[:success] = pat(:update_success, :model => 'Theme', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:themes, :index)) :
          redirect(url(:themes, :edit, :id => @theme.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'theme')
        render 'themes/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'theme', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Themes"
    theme = Theme[params[:id]]
    if theme
      if theme.destroy
        flush_cache
        flash[:success] = pat(:delete_success, :model => 'Theme', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'theme')
      end
      redirect url(:themes, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'theme', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Themes"
    unless params[:theme_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'theme')
      redirect(url(:themes, :index))
    end
    ids = params[:theme_ids].split(',').map(&:strip)
    themes = Theme.where(:id => ids)

    if themes.destroy
      flush_cache
      flash[:success] = pat(:destroy_many_success, :model => 'Themes', :ids => "#{ids.to_sentence}")
    end
    redirect url(:themes, :index)
  end
end
