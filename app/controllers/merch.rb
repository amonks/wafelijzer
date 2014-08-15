Wafelijzer::App.controllers :merch do
	
	get :index, :cache => true, :map => '/merch' do
		@title = @page_header = "Merch"
		@merches = Merch.order(Sequel.desc(:release_date), :id).all
		render 'merch/index'
	end

	post :charge, :map => '/merch' do

		Stripe.api_key = settingValue('stripe_secret_key')
		@merch = Merch.where(:id => params['merch-id']).first

		customer = Stripe::Customer.create(
			:email => 'customer@example.com',
		)



		charge = Stripe::Charge.create(
			:card  => params[:stripeToken],
			:amount      => @merch.price_in_cents,
			:description => @merch.about,
			:currency    => 'usd',
		)
	 
		@alert = @merch.title + " successfully purchased!"
		@alert_type = 'success'
		@title = @page_header = "Merch"

		@merches = Merch.order(Sequel.desc(:release_date), :id).all
		render 'merch/index'
	end

	# get :index, :map => '/foo/bar' do
	#   session[:foo] = 'bar'
	#   render 'index'
	# end

	# get :sample, :map => '/sample/url', :provides => [:any, :js] do
	#   case content_type
	#     when :js then ...
	#     else ...
	# end

	# get :foo, :with => :id do
	#   'Maps to url '/foo/#{params[:id]}''
	# end

	# get '/example' do
	#   'Hello world!'
	# end
	

end
