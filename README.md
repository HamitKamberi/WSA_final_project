# How to Set Up and Run the Application

## Prerequisites

Make sure you have the following installed:

- **Ruby** version 3.2.2 (You’ve confirmed it's installed)
- **Node.js** version 21.7.3 (Also confirmed)
- **SQLite** version 3.8.0 or higher (Follow the setup steps below for installation)

## Install Dependencies

Make sure you have the necessary gems and dependencies installed.

### a. Install SQLite3

SQLite3 is required, so you’ll need to install it.

Run the following command to install the `sqlite3` gem:

```bash
gem install sqlite3
```

### b. Install Bundler

If you don’t have Bundler installed yet, install it:
```bash
gem install bundler
```


### c. Install the Gem Dependencies
Navigate to the root directory of your application (if you're not already there):
```bash
bundle install
```
This will install the necessary Ruby gems, including Rails and SQLite3 (if they’re in your Gemfile).


### Create and Migrate the Database
```bash
rake db:create
```

###After the database is created, apply any pending migrations:
```bash
rake db:migrate
```

### Start the Rails Server
```bash
rails server
```
