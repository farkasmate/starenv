# BUILDER
ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-slim-bullseye as BUILDER

WORKDIR /code

ADD Gemfile Gemfile.lock ./

RUN bundle config set --local without 'development' \
  && bundle install

# CLI
FROM ruby:${RUBY_VERSION}-slim-bullseye as CLI

COPY --from=BUILDER /usr/local/bundle /usr/local/bundle

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

ADD entrypoint.rb /entrypoint.rb
ADD install.sh /install.sh
ADD toys/ /toys/

ENTRYPOINT ["/entrypoint.rb"]
