class Album < Sequel::Model
	# set up associations
	many_to_many	:artists
	many_to_many	:videos
	many_to_many	:blogs

	def bandcamp_id_from_url url
    	# get albumid from bandcamp api
		::JSON.parse(open("http://api.bandcamp.com/api/url/1/info?key=vatnajokull&url=" + url).read)["album_id"]
	end

	def get_bandcamp_id
		self.this.update(:bandcamp_id => bandcamp_id_from_url( self.bandcamp_url ) )
	end
end
