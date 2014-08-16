# # This is our album model.

class Album < Sequel::Model
	# First we want to set up our associations.
    # 
    # An artist can have multiple albums, and an album can be by multiple artists
	many_to_many	:artists

    # This function is for populating the database with an album's information based on its `bandcamp_url`.
	def populate_from_bandcamp 
        # First we'll query the Bandcamp URL api to find the album's bandcamp_id
    	response = ::JSON.parse(open("http://api.bandcamp.com/api/url/1/info?key=vatnajokull&url=" + self.bandcamp_url).read)
        # Now, we'll send that ID to the bandcamp Album or Track API to get detailed info.
        if id = response["album_id"]
        	response = ::JSON.parse(open("http://api.bandcamp.com/api/album/2/info?key=vatnajokull&album_id=" + id.to_s).read)
        elsif id = response["track_id"]
            response = ::JSON.parse(open("http://api.bandcamp.com/api/track/3/info?key=vatnajokull&track_id=" + id.to_s).read)
        end
        # Finally, we update the album in our database with the info we've received.
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
end
