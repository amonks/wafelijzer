wafelijzer
==========

wafelijzer makes running a record label website (relatively) easy.

Brought to you by [Belgian Man Records](http://belgianman.com)

## run locally

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

### [go!](http://localhost:3000)

## back-end

Wafelijzer is a Padrino app designed to run effectively on Heroku.

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
