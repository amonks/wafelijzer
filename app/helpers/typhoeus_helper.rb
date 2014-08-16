# # This is our helper for Typhoeus.
# 
# This file is for useful methods related to making http requests.
# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module TyphoeusHelper

      # This method is for making an http get request reliably using Typhoeus
      def typhoeus_get url
        Typhoeus.get(url, followlocation: true).body
      end
      
    end
    helpers TyphoeusHelper
  end
end
