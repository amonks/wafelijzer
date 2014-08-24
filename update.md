---
layout: page
title: Updates
---

Updating a Wafelijzer app only takes a couple minutes.

If you haven't yet done so, first install the [Heroku toolbelt](https://toolbelt.heroku.com/).

You'll need to use the Terminal, but I promise it isn't all that scary. I'll take you right through it. On a Mac, you'll find the Terminal within the Utilities folder inside your Applications folder. You'll also want to make a new folder on your computer to keep Wafelijzer in.

Ready?

OK. First, in the Terminal, type `cd`, space. Then drag your new folder right onto the Terminal window, and press enter.

Now, type `heroku git:clone -a appname`, substituting your heroku app name (whatever comes before `.herokuapp.com`) for `appname` and press enter again.

Type `cd` space `appname` (again using your actual app name) and press enter again.

That was the hard part.

Now paste the following lines directly into the terminal, one-by-one. Press enter after each, wait for stuff to stop happening, and then paste the next one.

    git remote add origin https://github.com/belgianman/wafelijzer.git
    git pull origin master
    git push heroku master

### You're done!

Visit `yourapp.heroku.com/flush` to clear your app's cache and then you're good to go!
