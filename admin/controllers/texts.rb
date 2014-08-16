Wafelijzer::Admin.controllers :texts do
  get :index do
    @title = "Texts"
    @texts = Text.all
    render 'texts/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'text')
    @text = Text.new
    render 'texts/new'
  end

  post :create do
    @text = Text.new(params[:text])
    if (@text.save rescue false)
      Wafelijzer::Admin.cache.flush
      @title = pat(:create_title, :model => "text #{@text.id}")
      flash[:success] = pat(:create_success, :model => 'Text')
      params[:save_and_continue] ? redirect(url(:texts, :index)) : redirect(url(:texts, :edit, :id => @text.id))
    else
      @title = pat(:create_title, :model => 'text')
      flash.now[:error] = pat(:create_error, :model => 'text')
      render 'texts/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "text #{params[:id]}")
    @text = Text[params[:id]]
    if @text
      render 'texts/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'text', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "text #{params[:id]}")
    @text = Text[params[:id]]
    if @text
      if @text.modified! && @text.update(params[:text])
        Wafelijzer::Admin.cache.flush
        flash[:success] = pat(:update_success, :model => 'Text', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:texts, :index)) :
          redirect(url(:texts, :edit, :id => @text.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'text')
        render 'texts/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'text', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Texts"
    text = Text[params[:id]]
    if text
      if text.destroy
        flash[:success] = pat(:delete_success, :model => 'Text', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'text')
      end
      redirect url(:texts, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'text', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Texts"
    unless params[:text_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'text')
      redirect(url(:texts, :index))
    end
    ids = params[:text_ids].split(',').map(&:strip)
    texts = Text.where(:id => ids)
    
    if texts.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Texts', :ids => "#{ids.to_sentence}")
    end
    redirect url(:texts, :index)
  end
end
