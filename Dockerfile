FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ADD . /Insta
WORKDIR /Insta
RUN bundle install
EXPOSE 3000
CMD ["bash"]
