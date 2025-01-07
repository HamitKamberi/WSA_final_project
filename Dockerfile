FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  sqlite3 \
  libsqlite3-dev \
  postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# RUN RAILS_ENV=production bundle exec rake assets:precompile

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
