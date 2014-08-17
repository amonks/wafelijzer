# # This is our helper for merch.
#
# This file is for useful methods related to Merch.
# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module MerchHelper

      # This method is to check and see if stripe keys are configured.
      def check_for_stripe

        # If the settings exist, return the public key
        if setting_value('stripe_secret_key') && pub = setting_value('stripe_publishable_key')
          return pub

        # If the settings don't exist, return false.
        else
          return false
        end
      end

      # This method is to render a price from the database. (They're stored as an integer number of cents, but displayed as $x.xx)
      def render_price price
        return Money.new(price, "USD").format #=> "$1.00"
      end
    end

    helpers MerchHelper
  end
end
