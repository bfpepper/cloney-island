# Vicarious.li

Vicarious.li is a delightful little web-app designed to do one thing and one thing only: make your dreams a reality via the magic of crowdsourcing.

![An image of the homepage](https://github.com/bermannoah/repo-images/blob/master/ci_homepage.jpg)

## How to use:

The easiest way to go about it is to just go to [https://vicarious.li](https://vicarious.li) and check it out for yourself. You could also clone it down and install it on your own machine, but be aware that you'll need a range of Amazon (AWS) and Twilio keys to make it work.

## Technical details

A ruby on rails web app storing data in a PostgreSQL database. Hosted on AWS EC2 with HTTPS provided by the beautiful folks at [Let's Encrypt](https://letsencrypt.org). Some images come from unsplash, but custom ones are handled with a mix of Paperclip + AWS S3. The site is styled via heavily modified bootstrap and some custom jQuery/Ajax magic. 
