# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
	class App
		module MerchHelper

			def check_for_stripe
				if settingValue('stripe_secret_key') && pub = settingValue('stripe_publishable_key')
					return pub
				else
					return false
				end
			end

			def render_price price
				return "$" + (price / 100.0).to_s
			end
		end

		helpers MerchHelper
	end
end
