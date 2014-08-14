Wafelijzer
==========

> Brought to you by [Belgian Man Records](http://belgianman.com)

Wafelijzer is web software you can use to make a beautiful and easy-to-run website for your record label or collective.

You can get it up and running in 5 minutes or less, and add artists, albums, news, videos, or even sell merch using the simple online interface.

Wafelijzer looks fantastic out-of-the-box, but it's also totally customizable. Theme it up to your heart's content. 

## Goals

Wafelijzer's development is guided by 3 principles:

1.	**Keep it easy:** You don't need any technical, web development, or coding experience to use Wafelijzer. A label shouldn't need a 'Web Dude,' artists can add easily add their own content.

2.	**Make it free:** Wafelijzer is designed to run on a free [Heroku](http://heroku.com) server.

3.	**Stay lazy:** You already use services like bandcamp, soundcloud, vimeo, and youtube. Wafelijzer automatically pulls your content from these services so you don't have to type the same shit over and over.

## Demo

There's a demo running at [http://wafelijzer-demo.herokuapp.com/](http://wafelijzer-demo.herokuapp.com/)

You can log into the [admin page](http://wafelijzer-demo.herokuapp.com/admin) with the username `admin@example.com` and the password `password`.

## 5-Minute Install

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
	heroku restart
	heroku open

Boom! Safari (or Chrome, or some browser) just opened and you can see a really empty-lookin' website. Add `/bootstrap` to the URL in your browser's location bar to add some content and set up your account.

### You're done!

You should click the "Admin Page" link on the bottom right and log in. Your username is `admin@example.com` and your password is `password`. Change them.

## Customizing Wafelijzer

### Settings

You can change your settings by visiting the `/admin` page and clicking the `Settings` tab. Click `new` to add a setting, or click the little pencil icon on the right of each entry to change its value.

Title 					| Value
------------------------|-----------------------------------
label_name				| eg "Belgian Man Records"
logo					| A url for your label's logo. It'll show up at the top right side of every page.
theme 					| If you've added a theme, you can enter its title here.
google_analytics_code	| If you use google analytics, you can enter your code here. It looks something like `UA-22952798-15`.
store_url				| If you already have a store, you can enter the url here and a link will be added in the navigation bar.
facebook				| If you have a facebook page, enter the shortname here (whatever comes after `http://www.facebook.com/`) and a link will be added in the navigation bar.
frontpage_item_count	| This is the number of recent things that show up on your front page. Default is 10. 
soundcloud_client_id	| To pull information off of soundcloud, you'll need a [soundcloud_client_id](http://soundcloud.com/you/apps/new)
soundcloud_name			| If your label has a soundcloud, enter it here. The most recent favorite will be embedded on your front page.
typekit					| If your theme uses [Typekit](https://typekit.com/) for custom fonts, enter your kit ID here.
stripe_secret_key		| to sell merch and collect money, you'll need a [Stripe](http://stripe.com) account. You'll get a secret and publishable key from them.
stripe_publishable_key	| 

### Texts

This is where you edit the blurb that shows up on your site's front page, and the text that goes into your site's footer.

### Themes

A theme is some custom CSS and/or Javascript that gets added to every page of your site. 

### Artists

Artists can be either people, or bands (which can have multiple artists in them).

### Albums

Album info (title, about, credits, ...) is all pulled from Bandcamp, so you only need to enter an album's Bandcamp url to add it.

### Blogs

This is for stuff like events, press, news, or what have you. They can be affiliated with a particular artist, so they show up on that artist's page, or not, so they show up on just the home page.

### Accounts

If you'd like, you can give all your artists their own accounts. Or you can share. Whatever. Once someone has an account, they can edit stuff and add willy-nilly, so if you're worried the password might get out it might make sense to use multiple accounts so you can delete them easily if the need ever arrises.

### Videos

Videos can be pulled from Youtube or Vimeo.

### Merches

Add merch here. If you add sign up for a [Square](http://square.com) account and set the `square_publishable_key` and `square_private_key` settings, you can take credit cards right from your website.

## Help

If you have any issues with Wafelijzer, either [send me an email](mailto:a@monks.co) or create an issue [on github](https://github.com/belgianman/wafelijzer/issues).