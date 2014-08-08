# Seed add you the ability to populate your db.
# We provide you a basic shell for interaction with the end user.
# So try some code like below:
#
#   name = shell.ask("What's your name?")
#   shell.say name
#

require 'open-uri'

case Padrino.env
  when :development then Dotenv.load
end



account = Account.create(:email => ENV['ADMIN_EMAIL'], :name => ENV['ADMIN_FIRST_NAME'], :surname => ENV['ADMIN_LAST_NAME'], :password => ENV['ADMIN_PASSWORD'], :password_confirmation => ENV['ADMIN_PASSWORD'], :role => "admin")

if account.valid?
  shell.say "================================================================="
  shell.say "Account has been successfully created, now you can login with:"
  shell.say "================================================================="
  shell.say "   email: #{ENV['ADMIN_EMAIL']}"
  shell.say "   password: #{ENV['ADMIN_PASSWORD']}"
  shell.say "================================================================="
else
  shell.say "Sorry but some thing went wrong!"
  shell.say ""
  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

shell.say ""

leaftype = Artist.create(
	:name => "LEAFTYPE",
	:slug => "leaftype",
	:real_name => "Christopher Knollmeyer",
	:soundcloud => "leaftype",
	:bio => "Leaftype is Christopher Knollmeyer, an electronic musician from Lincoln, MA. He studies music technology at Calarts. He also plays keyboards and drums."
)
tokyomegaplex = Artist.create(
	:name => "Tokyo Megaplex",
	:image_url => "http://belgianman.com/assets/artists/djkpage.jpg",
	:slug => "tokyomegaplex",
	:real_name => "Chris Rutledge",
	:soundcloud => "tokyomegaplex",
	:bio => "Chris Rutledge has been making music since the day he was born. He's based in Providence, Rhode Island. He has released music as DJ Kristöffer and Tokyo Megaplex."
)

album = Album.create(
	:title => "LTEP008",
	:label => "Belgian Man Records",
	:type => "EP",
	:bandcamp_url => "http://leaftype.bandcamp.com/album/ltep0008"
)
album.populate_from_bandcamp
AlbumsArtists.create(
	:artist_id => leaftype.id,
	:album_id => album.id,
	:role => "Producer"
)

album = Album.create(
	:title => "FLPTY808",
	:type => "EP",
	:bandcamp_url => "http://leaftype.bandcamp.com/album/flpty808"
)
album.populate_from_bandcamp
AlbumsArtists.create(
	:artist_id => leaftype.id,
	:album_id => album.id,
	:role => "Producer"
)

album = Album.create(
	:title => "The Legend Of Beefwell",
	:label => "Belgian Man Records",
	:type => "LP",
	:bandcamp_url => "http://tokyomegaplex.bandcamp.com/album/the-legend-of-beefwell"
)
album.populate_from_bandcamp
AlbumsArtists.create(
	:artist_id => tokyomegaplex.id,
	:album_id => album.id,
	:role => "Producer"
)

album = Album.create(
	:title => "Words",
	:type => "Single",
	:bandcamp_url => "http://music.belgianman.com/album/words"
)
album.populate_from_bandcamp
AlbumsArtists.create(
	:artist_id => leaftype.id,
	:album_id => album.id,
	:role => "Remixer"
)
AlbumsArtists.create(
	:artist_id => tokyomegaplex.id,
	:album_id => album.id,
	:role => "Remixer"
)


video = Video.create(
	:title => "Bodymasters Live at Grids, Beats & Groups Showcase",
	:service => "youtube",
	:youtube_id => "NxGN_-mcBhQ"
)
ArtistsVideos.create(
	:artist_id => leaftype.id,
	:video_id => video.id,
	:role => "Performer"
)
video = Video.create(
	:title => "New Years Eve 2011",
	:service => "vimeo",
	:vimeo_id => "34479631"
)
ArtistsVideos.create(
	:artist_id => tokyomegaplex.id,
	:video_id => video.id,
	:role => "Performer"
)

Blog.create(
	:title => 'MAYBEWISE interview in Future Classics',
	:body => 'Future Classics posted an interview of MAYBEWISE’s EP, Welcome To The Fishbowl:

> **How long has MAYBEWISE been in effect? And where did the moniker come into play?**
> Welcome to the Fishbowl marks the first release of the MAYBEWISE venture, but Peter has been producing and djing for nearly a decade, going under a number of other monikers and concepts. Patrick is pretty new to the game, but he brings the X factor and the life of the party.'
)


Text.create(
	:title => 'footer',
	:body => 'Belgian Man Records &#124; 1644 W. 21st St. &#124; Number 3R &#124; Chicago, IL 60608

All music is licensed under a [Creative Commons by-nc](http://creativecommons.org/licenses/by-nc/3.0/) license.

Website &copy; 2013 Andrew Monks.'
)
Text.create(
	:title => 'description',
	:body => 'Belgian Man Records is a collective of [artists](/artists) that began in lovely, historic Concord, MA, but is currently based in Chicago, IL.

We record music, film videos, make art, and play shows.

All of our music is licensed under a Creative Commons by-nc license, which means you’re free to share, remix, and re-use it non-commercially, provided you give attribution to the artist. If you’d like to use Belgian Man music commercially, email [Andrew](mailto:andrew@belgianman.com).'
)

Setting.create(
	:title => 'soundcloud_user_id',
	:body => ENV['SOUNDCLOUD_USER_ID']
)

Setting.create(
	:title => 'soundcloud_client_id',
	:body => ENV['SOUNDCLOUD_CLIENT_ID']
)
