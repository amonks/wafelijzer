Wafelijzer::App.controllers :bootstrap do
	
	get :index, :map => '/bootstrap' do
		if (settingValue 'bootstrapped')
			@alert = "already bootstrapped :("
			@alert_type = "danger"
		else
			account = Account.create(:email => "admin@example.com", :password => 'password', :password_confirmation => 'password', :role => "admin")
			if account && account.valid?

				leaftype = Artist.create(
					:name => "LEAFTYPE",
					:slug => "leaftype",
					:real_name => "Christopher Knollmeyer",
					:soundcloud => "leaftype",
					:bio => "Leaftype is Christopher Knollmeyer, an electronic musician from Lincoln, MA. He studies music technology at Calarts. He also plays keyboards and drums.",
					:image_url => "http://i.imgur.com/3XAhXnD.jpg"

				)
				album = Album.create(
					:title => "LTEP008",
					:label => "Belgian Man Records",
					:type => "EP",
					:bandcamp_url => "http://leaftype.bandcamp.com/album/ltep0008"
				)
				video = Video.create(
					:service => "vimeo",
					:vimeo_id => "34479631",
				)
				video.populate_from_vimeo
				ArtistsVideos.create(
					:artist_id => leaftype.id,
					:video_id => video.id,
					:role => "Performer"
				)
				album.populate_from_bandcamp
				AlbumsArtists.create(
					:artist_id => leaftype.id,
					:album_id => album.id,
					:role => "Producer"
				)
				blog = Blog.create(
					:title => 'Example Blog Post about LEAFTYPE',
					:body => '# This is an example blog post.',
					:release_date => Date.today
				)
				blog.add_artist(leaftype)
				Text.create(
					:title => 'footer',
					:body => 'All music is licensed under a [Creative Commons by-nc](http://creativecommons.org/licenses/by-nc/3.0/) license.'
				)
				Text.create(
					:title => 'description',
					:body => "Trappist Records was founded in Belgium in 1989. We specialize in music about waffle-making."
				)
				Setting.create(
					:title => 'label_name',
					:body => "Trappist Records"
				)
				Setting.create(
					:title => 'logo',
					:body => "http://i.imgur.com/TUvQfGd.png",
				)

			    Setting.create(:title => "bootstrapped", :body => "true")
			    @alert = "bootstrap successful! username: 'admin@example.com' password => 'password'"
			    @alert_type = "success"
			else
				@alert = "can't create account :("
				@alert_type = "danger"
			end
		end
		render 'index'
	end
 
end
