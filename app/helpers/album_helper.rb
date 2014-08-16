# # This is our helper for albums.
# 
# This file is for useful methods related to Albums.
# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module AlbumHelper

      # This method creates a bandcamp embed given an album ID
      def bandcamp_embed_from_id id
        '<div class="bandcamp"><iframe style="border: 0; width:100%;" src="//bandcamp.com/EmbeddedPlayer/album=' + id.to_s + '/size=large/bgcol=ffffff/linkcol=000000/transparent=true/" seamless></iframe></div>'
      end
      
    end
    helpers AlbumHelper
  end
end
