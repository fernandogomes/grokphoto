# Grokphoto

Grokphoto is a professional photographer's client and booking management solution, as well as a gallery / portfolio where they can showcase for their work.

This version is work in progress / port to rails 3.1.

For the stable rails 2 version please see the version 2 branch:
[Version 2](https://github.com/rapind/grokphoto/tree/v2.0)


## Software Requirements

* ImageMagick
* SQLite3 or MySQL or PostgreSQL


## Installation

    git clone git://github.com/rapind/grokphoto.git
    cd grokphoto
    rake grokphoto:init
    bundle

Then edit these files with your own settings. Everything you need to change is marked with TODO along with instructions if necessary:

*  config/database.yml
*  config/heroku.yml
*  config/initializers/devise.rb
*  config/initializers/secret_token.rb
*  config/initializers/session_store.rb

Then initialize the database and start the server:

    rake db:create
    rake db:migrate
    rake db:seed
    rails s

At this point you should have a working site with some basic seed data that you can start to customize.


## Initial Configuration

1. Login to the administration area (/admin) using photographer@grokphoto.org / password
2. Click on the Settings tab.
3. Enter your own information and update the settings.


## Themes

Themes are currently implemented using rails engines.

* [Default Theme](https://github.com/rapind/grokphoto-theme-default)
* More coming soon...


## Heroku Deployment

    heroku create --stack cedar
    
Setup your own values in the next command, using your own email address, the name of your application for the session key and "rake secret" to generate a new secret key.
    
    heroku config:add SENDER_EMAIL=change_to_to_your_email@address.com SESSION_KEY=_change_me_to_your_app_name SECRET_KEY=result_of_rake_secret_goes_here
    git push heroku master
    heroku run rake db:migrate
    
Before you seed the database you'll need to setup an amazon s3 account and bucket to have somewhere to store the files. Heroku has a temporary filesystem which is not an appropriate place to store images.

* Go to: https://console.aws.amazon.com/s3/home
* Create a bucket
* Go to: https://aws-portal.amazon.com/gp/aws/developer/account/index.html
* Click on the Security Credentials in the left nav, then the Access Credentials in the body.
* Copy your S3 key and your S3 secret key

Use your S3 information to fill in the config vars for heroku, then seed the database.

    heroku config:add S3_KEY=change_to_your_amazon_s3_key S3_SECRET=change_to_your_amazon_s3_secret S3_BUCKET=change_to_your_amazon_s3_bucket
    heroku run rake db:seed
    heroku open
    
You can check to make sure all of your heroku environment variables have been properly set using:

    heroko config
    


## Features

* Personalize your site via the configuration / settings page.
* Manage your portfolios and showcase your work.
* Manage your own pages with markdown.
* Manage and share private galleries with clients easily via secure URL.
* One-click photo uploads.
* Automatically apply a watermark to all of your gallery photos.
* Photo commenting system for both you and your clients.
* SEO Friendly URLs.
* Google compliant sitemap.
* Google analytics integration.
* Basic view statistics / history for your client galleries.


## TODO

* Finish the default theme.
* Internationalization.
* Client order assembly / package selection / shopping cart / payment, etc.


## Tests

To run the tests:

    rspec spec


## Credits

Sample photos were provided by and are copyright of Jaime Coyle Photography [http://jaimecoyle.com](http://jaimecoyle.com)


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/2.5/ca/88x31.png" /></a><br /><span xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dc:title" rel="dc:type">Grokphoto</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://github.com/rapind/grokphoto" property="cc:attributionName" rel="cc:attributionURL">http://github.com/rapind/grokphoto</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/">Creative Commons Attribution-Share Alike 2.5 Canada License</a>.<br />Based on a work at <a xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://github.com/rapind/grokphoto" rel="dc:source">github.com</a>.
