# # This is our video model.

class Video < Sequel::Model
  # First we want to set up our associations.
  # 
  # An artist can have multiple videos, and a video can be by multiple artists
  many_to_many  :artists

  # This function is for populating the database with a video's information based on its vimeo_id.
  def populate_from_vimeo
      
    # first we'll query the Vimeo API
    response = ::JSON.parse(open("http://vimeo.com/api/v2/video/" + self.vimeo_id + ".json").read)[0]

    # then we'll update the video in the database with information extracted from the API
    self.this.update(:title => response["title"])
    self.this.update(:about => response["description"])
    date = DateTime.strptime(response["upload_date"].to_s.split(" ")[0], '%Y-%m-%d')
    self.this.update(:release_date => date) if date
  end

  # This function is for populating the database with a video's information based on its youtube_id.
  def populate_from_youtube
    # first we'll query the youtube API
    response = ::JSON.parse(open("https://gdata.youtube.com/feeds/api/videos/" + self.youtube_id + "?v=2&alt=json").read)["entry"]
    if response
      # then we'll update the video in the database with information extracted from the API
      title = response["title"]['$t']
      self.this.update(:title => title) if title
      about = response['media$group']["media$description"]['$t']
      self.this.update(:about => about ) if about
      date = DateTime.strptime(response['published']['$t'].to_s.split("T")[0], '%Y-%m-%d')
      self.this.update(:release_date => date) if date
    end
  end
end
