# # This is our helper for albums.
#
# This file is for useful methods related to Albums.
# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module PjaxHelper

      def pjax?
        env['HTTP_X_PJAX'] && !params[:layout]
      end

    end
    helpers PjaxHelper
  end
end
