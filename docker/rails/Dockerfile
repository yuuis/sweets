FROM ruby:2.5.1
# MAINTAINER {YOUR NAME}

ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs
WORKDIR /tmp
COPY Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler && bundle install --clean
WORKDIR /rails
ADD ./ /rails
CMD ["bundle", "exec", "rails", "s"]