---
layout: page
title: Developers
---

If you're into this kind of thing, and you'd like to hack on Wafelijzer, please do!

[Fork](https://github.com/belgianman/wafelijzer/fork) the project repository, make and commit your changes, and submit a pull request if you make anything cool.

Wafelijzer is built with Ruby, using the [http://www.padrinorb.com/](Padrino) framework. It uses [http://slim-lang.com/](Slim) and [http://sass-lang.com/](Sass) for templating. It uses [Sequel](http://sequel.jeremyevans.net/) to connect to a PostgreSQL database. 

## Dependencies

### memcached

Wafelijzer uses memcached for caching.

Install it using [https://github.com/Homebrew/homebrew](homebrew)

### ruby

Wafelijzer uses ruby version 1.9.3, hosted by version 1.7.9 of the jruby engine.

You'll probably want to use [rbenv](https://github.com/sstephenson/rbenv) to handle installng jruby. You can install it using homebrew.

Run `bundle install` from the wafelijzer root folder to install all the dependencies, which are listed in the `Gemfile`

### postgres

First, you'll need postgres running. If you're on a mac, install [postgres.app](http://postgresapp.com/)

#### Start from scratch with a local postgres database

from the wafelijzer root folder:

	bundle exec padrino rake sq:migrate:auto

#### Reference a remote postgres database

##### Pull remote database to local PostgreSQL

From the wafelijzer root folder:

	heroku pg:pull DATABASE_URL wafelijzer_development

##### Push local database to remote PostgreSQL

from the wafelijzer root folder:

	heroku pg:reset
	heroku pg:push wafelijzer_development DATABASE_URL

## Front-End Assets

The front-end assets are compiled and minified from the `app/assets` folder.

### Compiling Assets

compiling the assets requires Grunt, a javascript task runner.

First, install [node.js](http://nodejs.org/). You can also install it using Homebrew.

Then run `npm install -g grunt-cli` to install grunt.

Then, run `npm install` from `wafelijzer/grunt` to install the build dependencies.

Finally, run `grunt` as needed to compile, or `grunt watch` to automatically build when the assets are changed.
