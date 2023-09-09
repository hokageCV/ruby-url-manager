FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install

COPY . .
COPY .env .env

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
