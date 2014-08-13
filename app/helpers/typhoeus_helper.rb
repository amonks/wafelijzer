# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
	class App
		module TyphoeusHelper

			def typhoeus_get url
				Typhoeus.get(url, followlocation: true).body
			end
			
		end
		helpers TyphoeusHelper
	end
end
