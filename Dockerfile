FROM ruby:3.2-alpine3.18 as build-image

# Install container dependencies
RUN apk add build-base postgresql15-client libpq-dev

WORKDIR /app
COPY Gemfile* ./
COPY .ruby-version .
RUN bundle install --with production --quiet

FROM build-image as default-image

COPY app/ ./app/
COPY bin/ ./bin/
COPY config/ ./config/
COPY db/ ./db/
COPY lib/ ./lib/
COPY public/ ./public/
RUN mkdir -p ./tmp/pids

COPY config.ru .
COPY Rakefile .

ENV LANG=en_US.UTF-8
ENV RACK_ENV=production
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=enabled

EXPOSE 3000
CMD bundle exec puma --config config/puma.rb
