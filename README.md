wafelijzer
==========

## setup

### install gems (ruby)

	cd /wafelijzer
	bundle install

### create database

	psql
	> CREATE DATABASE wafelijzer_development;

### create `.env`

	cd /wafelijzer
	touch .env

edit `.env`

	# .env
	SOUNDCLOUD_USER_ID=whatever
	SOUNDCLOUD_CLIENT_ID=whatever
	ADMIN_EMAIL=whatever
	ADMIN_PASSWORD=whatever
	ADMIN_FIRST_NAME=whatever
	ADMIN_LAST_NAME=whatever

### run

	cd /wafelijzer
	padrino start

[go!](http://localhost:3000)

## schema

###	**`account`**: user accounts

	primary_key :id
	String :name
	String :surname
	String :email
	String :crypted_password
	String :role

###	**`album`**: albums

	primary_key :id

	# utility
	DateTime	:created_at
	DateTime	:updated_at

	# basic info
	String	:title
	Date 	:release_date
	String :cover_url
	String :label	# eg 'Belgian Man Records'
	String :type	# eg 'compilation'

	# bandcamp
	String :bandcamp_url	# eg 'http://music.belgianman.com/album/bedroom-classics-vol-1'
	String :bandcamp_id

###	**`albums_artists`**: credit on albums

	foreign_key :album_id
	foreign_key :artist_id

	String :role # eg "Composer", "Producer", "Remixer", "Cover Artist"

###	**`artist`**: person

	primary_key :id		
	# utility
	DateTime	:created_at
	DateTime	:updated_at

	# basic info
	String	:name
	String	:slug		# urlsafe
	String	:real_name	# optional
	String	:soundcloud	# soundcloud url		
	String	:bio, :text => true		# stored as markdown		
	File	:page_image	# main artist image
	File	:list_image	# small artist thumbnail

###	**`artists_videos`**: credit on videos

	foreign_key :artist_id
	foreign_key :video_id

	String :role # eg "Musician", "Director", "Cinematographer", "Remixer"

###	**`blog`**: news articles for front page

	primary_key	:id

	# utility
	DateTime  :created_at
	DateTime  :updated_at

	# content
	String	:title
	String	:body, 	:text => true

###	**`setting`**: basically environment variables except in the db and settable through the web admin

	primary_key :id

	# utility
	DateTime	:created_at
	DateTime	:updated_at

	# content
	String :title
	String :body, :text => true

###	**`text`**: editable text blurbs (info blurb on front page, footer, ...)

	primary_key :id

	# utility
	DateTime	:created_at
	DateTime	:updated_at

	# content
	String :title
	String :body, :text => true # markdown formatted

###	**`video`**: videos

	primary_key :id

	# utility
	DateTime	:created_at
	DateTime	:updated_at

	# basic info
	String	:title
	Date 	:release_date
	String	:service	# eg "youtube", "vimeo"

	# vimeo
	String :vimeo_id

	# youtube
	String :youtube_id

## front-end

The front-end assets (javascript, css) are managed by grunt tasks.

They're stored in `/wafelijzer/app/assets`

### files

*	**`/wafelijzer/app/assets/css`**: everything in this folder is concatenated into `../css.css`

*	**`/wafelijzer/app/assets/js`**: everything in this folder is concatenated into `../js.js`

*	**`/wafelijzer/app/assets/stylus`**: everything in this folder is compiled into `../css/stylus.css`

*	**`/wafelijzer/app/assets/css.css`**: unminified app css. This file is copied into `/wafelijzer/public/` and minified.

*	**`/wafelijzer/app/assets/css.css`**: minified app css. This file is copied into `/wafelijzer/public/`

*	**`/wafelijzer/app/assets/css.css`**: unminified app js. This file is copied into `/wafelijzer/public/` and minified.

*	**`/wafelijzer/app/assets/css.css`**: minified app js. This file is copied into `/wafelijzer/public/`


### setup

this is only necessary for asset compilation (development) not to simply run the app

The `Gruntfile` and npm packages live in `/wafelijzer/grunt`. Run `npm install` once to install the build dependencies(css/js uglifiers, etc):

	cd /wafelijzer/grunt
	npm install

### build

then, build with `grunt`:

	cd /wafelijzer/grunt
	grunt
