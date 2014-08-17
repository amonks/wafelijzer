---
layout: page
title: One-Click Install
---

## One-Click Install

To install Wafelijzer on a free [Heroku](https://www.heroku.com/) server, click the button below. You'll be prompted to create a Heroku account, and then you'll be up and running in seconds.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/belgianman/wafelijzer)


## 5-Minute Manual Install

There aren't really any advantages to this, but if you'd like to install Wafelijzer manually you can.

To set up Wafelijzer manually you'll need a Mac. Or any other computer, provided it has [git](http://git-scm.com/downloads) installed.

First off, you'll need a free [Heroku](https://www.heroku.com/) account and to install the [Heroku toolbelt](https://toolbelt.heroku.com/).

We're gonna have to use the Terminal real quick, but only just this once. And it's easy, I swear. On a Mac, you'll find it in the `Utilities` folder within your `Applications` folder.

Find the folder on your computer where you'd like to keep Wafelijzer, open the Terminal, and get your copy-and-paste fingers ready.

Type `cd ` (with a space after), drag the folder icon right onto the Terminal window, and press enter.

One by one, copy-and-paste the following lines into the Terminal, pressing enter after each.

	git clone https://github.com/belgianman/wafelijzer.git
	heroku create
	git push heroku master
	heroku addons:add heroku-postgresql
	heroku run rake sq:migrate:up
	heroku addons:add memcachedcloud
	heroku addons:add newrelic:stark
	heroku restart

It'll take a minute or so to start the server...

	heroku open

Boom! Safari (or Chrome, or some browser) just opened and you can see a really empty-lookin' website. Add `/bootstrap` to the URL in your browser's location bar to add some content and set up your account.

### You're done!

You should click the "Admin Page" link on the bottom right and log in. Your username is `admin@example.com` and your password is `password`. Change them.

### One more thing...

Heroku automatically puts apps to sleep that don't get any traffic for a few minutes.

Fortunately, they make it easy to set up a service to visit your website every minute to keep it awake.

Go to your Heroku dashboard, click on the app, and click New Relic. This takes you to the New Relic dashboard, where you can monitor your website's performance.

Now go to settings > availability monitoring, and enter your website's url (that opened up when you ran 'heroku open') and save.
