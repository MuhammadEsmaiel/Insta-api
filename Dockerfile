
FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs --force-yes

RUN mkdir /instaa
WORKDIR /instaa

ADD Gemfile /instaa/Gemfile
ADD Gemfile.lock /instaa/Gemfile.lock

RUN bundle install

ADD . /instaa