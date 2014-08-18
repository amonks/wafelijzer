---
layout: page
title: One-Click Install
---

## One-Click Install

To install Wafelijzer on a free [Heroku](https://www.heroku.com/) server, click the button below. You'll be prompted to create a Heroku account, and then you'll be up and running in seconds.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/belgianman/wafelijzer)

When it finishes building, click the 'View it' link to set up your admin account.

### One more thing...

Heroku automatically puts apps to sleep that don't get any traffic for a few minutes.

Fortunately, they make it easy to set up a service to visit your website every minute to keep it awake.

Go to your Heroku dashboard, click on the app's name, and click New Relic. This takes you to the New Relic dashboard, where you can monitor your website's performance.

Now go to settings > availability monitoring, and enter your website's url (that opened up when you ran 'heroku open') and save.
