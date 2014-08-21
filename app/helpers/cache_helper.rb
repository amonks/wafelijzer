# # This is our helper for blogs.
#
# This file is for useful methods related to Blogs.
# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module CacheHelper

      # def cache_is_on
      #   if ENV["CACHE_ON"]  or  ( (Padrino.env == :production) && ENV["CACHE_ON"] != "false" )
      #     return true
      #   else
      #     return false
      #   end
      # end

    end

    helpers CacheHelper
  end
end
