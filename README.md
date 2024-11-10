How to Set Up and Run the Application

Prerequisites

Ruby version 3.2.2 (you've confirmed it's installed)
Node.js version 21.7.3 (also confirmed)
SQLite version 3.8.0 or higher (see the setup steps below for installation)


1. Install Dependencies
Make sure you have the necessary gems and dependencies installed.

a. Install SQLite3
You mentioned SQLite3 is required, so we’ll need to ensure it's installed.

Install SQLite3:

To install the sqlite3 gem, run:

gem install sqlite3
b. Install Bundler

If you don’t have Bundler installed yet, install it:


gem install bundler


c. Install the Gem Dependencies
Navigate to the root directory of your application (if you're not already there):


bundle install
This will install the necessary Ruby gems, including Rails and SQLite3 (if they’re in your Gemfile).


Create and Migrate the Database
rake db:create


After the database is created, apply any pending migrations:
rake db:migrate



Start the Rails Server
rails server
