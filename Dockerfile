FROM ruby:3.1.2
WORKDIR /app
COPY . .
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
#CMD ruby -e "require 'faraday'; p Faraday::VERSION; Faraday.get('http://localhost:9200')"
CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000