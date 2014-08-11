# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
  class App
    module VideoHelper
      # def simple_helper_method
      # ...
      # end
			def vimeo_embed_from_id id
				'<div class="video"><iframe src="//player.vimeo.com/video/' + id.to_s + '?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff" width="100%" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div>'
			end

			def youtube_embed_from_id id
				'<div class="video"><iframe width="100%" src="//www.youtube.com/embed/' + id.to_s + '" frameborder="0" allowfullscreen></iframe></div>'
			end
    end

    helpers VideoHelper
  end
end
