---
layout: page
title: 5-Minute Install
---

To set up Wafelijzer you'll need a Mac. Or any other computer, provided it has [git](http://git-scm.com/downloads) installed, and a working `ruby` environment. 

First off, you'll need a free [Heroku](https://www.heroku.com/) account and to install the [Heroku toolbelt](https://toolbelt.heroku.com/).

We're gonna have to use the Terminal real quick, but only just this once. And it's easy, I swear. On a Mac, you'll find it in the `Utilities` folder within your `Applications` folder. 

Find the folder on your computer where you'd like to keep Wafelijzer, open the Terminal, and get your copy-and-paste fingers ready.

Type `cd ` (with a space after), drag the folder icon right onto the Terminal window, and press enter.

One by one, copy-and-paste the following lines into the Terminal, pressing enter after each.

	git clone https://github.com/belgianman/wafelijzer.git
	heroku create
	git push heroku master
	heroku run rake sq:migrate:up
	heroku addons:add memcachedcloud
	heroku addons:add newrelic:stark
	heroku restart

It'll take a minute or so to start the server...

	heroku open

Boom! Safari (or Chrome, or some browser) just opened and you can see a really empty-lookin' website. Add `/bootstrap` to the URL in your browser's location bar to add some content and set up your account.

### You're done!

You should click the "Admin Page" link on the bottom right and log in. Your username is `admin@example.com` and your password is `password`. Change them.
