# # This is our helper for albums.
#
# This file is for useful methods related to Albums.
# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module PjaxHelper

      def pjax?
        env['HTTP_X_PJAX']
      end

      def render_pjaxd view
        if pjax? && Padrino.env == :production
          cache_key request.path_info + "pjax"
        end

        render view, :layout => !request.pjax?
      end

    end
    helpers PjaxHelper
  end
end
