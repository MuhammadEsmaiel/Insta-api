FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ADD . /Insta
WORKDIR /Insta
RUN bundle install
ENTRYPOINT ["bundle", "exec"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
