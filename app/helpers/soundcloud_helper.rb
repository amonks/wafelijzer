# Helper methods defined here can be accessed in any controller or view in the application

module Wafelijzer
	class App
		module SoundcloudHelper
			def soundcloud_embed_track_from_id id 
				'<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F' + id + '"></iframe>';
			end
			def soundcloud_get_last_favorite_from_user_id id
				soundcloudClientID = settingValue("soundcloud_client_id")
				response = typhoeus_get("http://api.soundcloud.com/users/" + id + "/favorites.json?client_id=" + soundcloudClientID)
				::JSON.parse(response)[0]["id"].to_s
			end
			def soundcloud_embed_last_favorite_from_user_id id
				soundcloud_embed_track_from_id(soundcloud_get_last_favorite_from_user_id(id))
			end
			def soundcloud_embed_from_soundcloud_name name 
				soundcloudClientID = settingValue("soundcloud_client_id")
				response = typhoeus_get('http://api.soundcloud.com/resolve.json?url=http://soundcloud.com/' + name + '&client_id=' + soundcloudClientID)
				id = ::JSON.parse(response)["id"].to_s
                '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Fusers/' + id + '&amp;show_artwork=true"></iframe>'
			end
		end
		helpers SoundcloudHelper
	end
end
