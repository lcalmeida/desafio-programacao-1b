FROM ruby:2.1.8

RUN mkdir /app

WORKDIR /app

RUN apt-get update && apt-get install -y \
    nodejs

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

EXPOSE 3000

ENTRYPOINT ["/bin/bash",  "startup.sh"]

