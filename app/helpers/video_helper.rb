# # This is our helper for blogs.
#
# This file is for useful methods related to Blogs.
# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module VideoHelper

      # This method is for rendering a vimeo embed based on a video's vimeo_id.
      def vimeo_embed_from_id id
        '<div class="video"><iframe src="//player.vimeo.com/video/' + id.to_s + '?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff" width="100%" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div>'
      end

      # This method is for rendering a youtube embed based on a video's youtube_id.
      def youtube_embed_from_id id
        '<div class="video"><iframe width="100%" src="//www.youtube.com/embed/' + id.to_s + '" frameborder="0" allowfullscreen></iframe></div>'
      end

      # This method is for getting a video's URL
      def video_url video
        if video.service == "vimeo"
          return "http://vimeo.com/" + video.vimeo_id
        elsif video.service == "youtube"
          return "http://youtube.com/watch?" + video.youtube_id
        end
      end

    end

    helpers VideoHelper
  end
end
