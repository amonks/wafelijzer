class Album < Sequel::Model
	# set up associations
	many_to_many	:artists
	many_to_many	:videos
	many_to_many	:blogs

	def populate_from_bandcamp 
    	response = ::JSON.parse(open("http://api.bandcamp.com/api/url/1/info?key=vatnajokull&url=" + self.bandcamp_url).read)
    	self.this.update(:bandcamp_id => response["album_id"].to_s)
    	response = ::JSON.parse(open("http://api.bandcamp.com/api/album/2/info?key=vatnajokull&album_id=" + response["album_id"].to_s).read)
    	self.this.update(:about => response["about"])
    	self.this.update(:credits => response["credits"])
    	self.this.update(:cover_url => response["large_art_url"])
    	self.this.update(:release_date => DateTime.strptime(response["release_date"].to_s,'%s'))
	end
	def populate_id_from_bandcamp
    	response = ::JSON.parse(open("http://api.bandcamp.com/api/url/1/info?key=vatnajokull&url=" + self.bandcamp_url).read)
    	self.this.update(:bandcamp_id => response["album_id"])
	end
end
