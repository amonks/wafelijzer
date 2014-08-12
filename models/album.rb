class Album < Sequel::Model
	# set up associations
	many_to_many	:artists
	many_to_many	:videos
	many_to_many	:blogs

	def populate_from_bandcamp 
    	response = ::JSON.parse(open("http://api.bandcamp.com/api/url/1/info?key=vatnajokull&url=" + self.bandcamp_url).read)
        if id = response["album_id"]
        	response = ::JSON.parse(open("http://api.bandcamp.com/api/album/2/info?key=vatnajokull&album_id=" + id.to_s).read)
        elsif id = response["track_id"]
            response = ::JSON.parse(open("http://api.bandcamp.com/api/track/3/info?key=vatnajokull&track_id=" + id.to_s).read)
        end
        self.this.update(:bandcamp_id => id.to_s)
        self.this.update(:title => response["title"])
        self.this.update(:about => response["about"])
    	self.this.update(:credits => response["credits"])
    	self.this.update(:cover_url => response["large_art_url"])
        if response_date = response["release_date"]
            if date = DateTime.strptime(response_date.to_s, '%s')
            	self.this.update(:release_date => date.to_date)
            end
        end
	end
	def populate_id_from_bandcamp
    	response = ::JSON.parse(open("http://api.bandcamp.com/api/url/1/info?key=vatnajokull&url=" + self.bandcamp_url).read)
    	self.this.update(:bandcamp_id => response["album_id"])
	end
end
