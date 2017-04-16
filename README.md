# Blocmarks [![Code Climate](https://codeclimate.com/github/silvio-galli/blocmarks/badges/gpa.svg)](https://codeclimate.com/github/silvio-galli/blocmarks)

Social bookmarking app that allows users to email, manage and share bookmarked URLs. Made with the help of my mentor [Charlie Gaines](https://github.com/beaugaines) at [Bloc](http://www.bloc.io).

[Demo available here](https://obscure-retreat-49704.herokuapp.com/) on Heroku platform.

The source code is on [GitHub](https://github.com) at: [https://github.com/silvio-galli/blocmarks](https://github.com/silvio-galli/blocmarks)


## Tech specs
The project is based on **Ruby on Rails**, uses **Bootstrap** for the layout and other elements on the page.

**Database seeding** is obtained using the [Faker](https://github.com/stympy/faker) gem.

**Environment variables and keys** are managed with the help of [Figaro](https://github.com/laserlemon/figaro) gem.

**Authentication** is managed through the [Devise](https://github.com/plataformatec/devise) gem.
Every new user is required to confirm his/her subscription via email confirmation notification that is sent using `ActionMailer` through a Google account, in [development](https://github.com/silvio-galli/blocmarks/blob/master/config/environments/development.rb) and [production](https://github.com/silvio-galli/blocmarks/blob/master/config/environments/production.rb) environment.
Google keys are managed using [Figaro](https://github.com/laserlemon/figaro) gem.

**Authorization** is handled through the [Pundit](https://github.com/elabs/pundit) gem.

**Emailing bookmarks** is handled through [mailgun](https://mailgun.com) and the [`incoming controller`](https://github.com/silvio-galli/blocmarks/blob/master/app/controllers/incoming_controller.rb) (still incomplete).


## Features

- As a user, I can sign up for a free account by providing a user name, password and email.
- As a user, I can sign in and out of Blocmarks.
- As a user, I can email a URL to Blocmarks and have it saved in the Blocmarks database.
- As a user, I can see an index of all topics and their bookmarks.
- As a user, I can create, read, update, and delete bookmarks.
- As a user, I am the only one allowed to delete and update my bookmarks.
- As a user, I can "like and unlike" bookmarks created by other users.
- As a user, I can see a list of bookmarks on my personal profile that I've added or liked.


---

###### mentioned gems
![](https://img.shields.io/badge/rails-4.2.5-green.svg?style=flat)
![](https://img.shields.io/badge/bootstrap_sass-3.3.5.1-green.svg?style=flat)
![](https://img.shields.io/badge/faker-1.6.3-green.svg?style=flat)
![](https://img.shields.io/badge/figaro-1.1.1-green.svg?style=flat)
![](https://img.shields.io/badge/devise-3.5.6-green.svg?style=flat)
![](https://img.shields.io/badge/pundit-1.1.0-green.svg?style=flat)
