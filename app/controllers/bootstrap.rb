# # This is our blog controller
# 
# We'll use this file to handle initially populating the database when a user visits `/bootstrap` for the first time.


Wafelijzer::App.controllers :bootstrap do
	
	# This is the route at `/bootstrap`
	get :index, :map => '/bootstrap' do
		# First check and see if the database has already been bootstrapped.
		# If it has, don't bootstrap it again.
		if (settingValue 'bootstrapped')
			@alert = "already bootstrapped :("
			@alert_type = "danger"

		# If it hasn't, let's go!
		else
			# First create an admin account
			account = Account.create(:email => "admin@example.com", :password => 'password', :password_confirmation => 'password', :role => "admin")

			# If the account creation didn't work, it probably means we can't connect to the database. Let's halt now and throw an error.
			unless account && account.valid?
				@alert = "can't create account :("
				@alert_type = "danger"
			
			# If the admin account worked, and we can successfully write to the database, continue creating stuff.
			else
				# like an artist!
				leaftype = Artist.create(
					:name => "LEAFTYPE",
					:slug => "leaftype",
					:real_name => "Christopher Knollmeyer",
					:soundcloud => "leaftype",
					:bio => "Leaftype is Christopher Knollmeyer, an electronic musician from Lincoln, MA. He studies music technology at Calarts. He also plays keyboards and drums.",
					:image_url => "http://i.imgur.com/3XAhXnD.jpg"

				)

				# or an album!
				album = Album.create(
					:label => "Belgian Man Records",
					:type => "EP",
					:bandcamp_url => "http://leaftype.bandcamp.com/album/ltep0008"
				)
				# which we need to get info about
				album.populate_from_bandcamp
				# and assign to our artist
				AlbumsArtists.create(
					:artist_id => leaftype.id,
					:album_id => album.id,
					:role => "Producer"
				)

				# and a video!
				video = Video.create(
					:service => "vimeo",
					:vimeo_id => "34479631",
				)
				# which we need to get info about
				video.populate_from_vimeo
				# and assign to our artist
				ArtistsVideos.create(
					:artist_id => leaftype.id,
					:video_id => video.id,
					:role => "Performer"
				)

				# now let's make some press!
				press = Blog.create(
					:title => 'Example Blog Post about LEAFTYPE',
					:body => '# This is an example press article. Read it on P4K!',
					:type => 'press',
					:release_date => Date.today
				)
				# and assign it
				press.add_artist(leaftype)

				# Let's make an event, too!
				event = Blog.create(
					:title => 'Example Blog Post about LEAFTYPE',
					:body => '# This is an example event. Check out our facebook page or something!',
					:type => 'event',
					:release_date => Date.today
				)
				# and assign it
				event.add_artist(leaftype)

				# We need to populate the website footer
				Text.create(
					:title => 'footer',
					:body => 'All music is licensed under a [Creative Commons by-nc](http://creativecommons.org/licenses/by-nc/3.0/) license.'
				)

				# and the description on the front page
				Text.create(
					:title => 'description',
					:body => "Trappist Records was founded in Belgium in 1989. We specialize in music about waffle-making."
				)

				# And set the label name
				Setting.create(
					:title => 'label_name',
					:body => "Trappist Records"
				)

				# and label logo
				Setting.create(
					:title => 'logo',
					:body => "http://i.imgur.com/TUvQfGd.png",
				)

				# It worked! Let's make sure nobody bootstraps this again.
			    Setting.create(:title => "bootstrapped", :body => "true")

			    # Now we'll set the alert on the next page to display the newly-created username and password.
			    @alert = "bootstrap successful! username: 'admin@example.com' password => 'password'"
			    @alert_type = "success"
			end
		end

		# render the newly-populated index!
		render 'index'
	end
 
end
