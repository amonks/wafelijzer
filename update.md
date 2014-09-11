---
layout: page
title: Updates
---

<p class="lead">
Updating a Wafelijzer app only takes a couple minutes.
</p>

If you haven't yet done so, first install the [Heroku toolbelt](https://toolbelt.heroku.com/).

You'll need to use the Terminal, but I promise it isn't all that scary. I'll take you right through it. On a Mac, you'll find the Terminal within the Utilities folder inside your Applications folder.

Ready?

If you haven't yet, type `heroku login`, press enter, and type your Heroku username and password when they ask. You'll only ever have to do that once.

That was the hard part.

Now paste the following lines directly into the terminal, one-by-one. Press enter after each, wait for stuff to stop happening, and then paste the next one.

Where it says APPNAME, in the third line, substitute your Heroku app name: whatever comes before `.herokuapp.com`.

    mkdir ~/Desktop/wafelijzer && cd ~/Desktop/wafelijzer
    git init
    git remote add heroku git@heroku.com:APPNAME.git
    git remote add github git@github.com:belgianman/wafelijzer.git
    git pull github master
    git push heroku master -f


### You're done!

Visit `APPNAME.herokuapp.com/flush` to clear your app's cache and then you're good to go!
