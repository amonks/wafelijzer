# # This is our Merch controller
#
# We'll use this file to handle routing for Merches.

Wafelijzer::App.controllers :merch do

  # This route is for the merch index at `/merch`
  get :index, :cache => true, :map => '/merch' do

    # set the title
    @title = "Merch"

    # Query the database for all the merches
    @merches = Merch.order(Sequel.desc(:release_date), :id).all

    # and send them to the renderer.
    render 'merch/index'
  end

  # This route is for charging people's credit cards.
  post :charge, :map => '/merch' do

    # Set the Stripe secret key from the database
    Stripe.api_key = setting_value('stripe_secret_key')

    # Query the database for the merch being purchased
    @merch = Merch.where(:id => params['merch-id']).first

    # create a new charge
    charge = Stripe::Charge.create(
      :card  => params[:stripeToken],
      :amount    => @merch.price_in_cents,
      :description => @merch.about,
      :currency  => 'usd',
      :metadata => {
        :shipping_name => params['stripeShippingName'],
        :shipping_address_line_1 => params['stripeShippingAddressLine1'],
        :shipping_address_zip => params['stripeShippingAddressZip'],
        :shipping_address_city => params['stripeShippingAddressCity'],
        :shipping_address_state => params['stripeShippingAddressState'],
        :shipping_address_country => params['stripeShippingAddressCountry'],
        :shipping_address_country_code => params['stripeShippingAddressCountryCode'],
      }
    )

    # set the alert to tell the customer it worked
    @alert = @merch.title + " successfully purchased!"
    @alert_type = 'success'

    # set the title again
    @title = @page_header = "Merch"

    # query the database
    @merches = Merch.order(Sequel.desc(:release_date), :id).all

    # and rerender the merch page...
    render 'merch/index'
  end

end
