class Video < Sequel::Model
	# set up associations
	many_to_many	:artists
	many_to_many	:albums

	def populate_from_vimeo
    	response = ::JSON.parse(open("http://vimeo.com/api/v2/video/" + self.vimeo_id + ".json").read)[0]
    	self.this.update(:title => response["title"])
    	self.this.update(:about => response["description"])
        date = DateTime.strptime(response["upload_date"].to_s.split(" ")[0], '%Y-%m-%d')
    	self.this.update(:release_date => date) if date
	end
	def populate_from_youtube
    	response = ::JSON.parse(open("https://gdata.youtube.com/feeds/api/videos/" + self.youtube_id + "?v=2&alt=json").read)["entry"]
        if response
        	title = response["title"]['$t']
        	self.this.update(:title => title) if title
        	about = response['media$group']["media$description"]['$t']
        	self.this.update(:about => about ) if about
            date = DateTime.strptime(response['published']['$t'].to_s.split("T")[0], '%Y-%m-%d')
        	self.this.update(:release_date => date) if date
        end
	end
end
