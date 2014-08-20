# # This is our helper for blogs.
#
# This file is for useful methods related to Blogs.
# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module CacheHelper

      def cache?
        if (ENV['CACHE_ON'] == true) && (Padrino.env == :production)
          return true
        else
          return false
        end
      end

    end

    helpers CacheHelper
  end
end
