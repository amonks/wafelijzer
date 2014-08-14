wafelijzer
==========

wafelijzer makes running a record label website (relatively) easy.

Brought to you by [Belgian Man Records](http://belgianman.com)

## setup:

	git clone https://github.com/belgianman/wafelijzer.git
	heroku create
	git push heroku master
	heroku run rake sq:migrate:up
	heroku restart
	heroku open

visit /bootstrap in your browser