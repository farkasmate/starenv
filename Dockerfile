# BUILDER
ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-slim-bullseye as BUILDER

WORKDIR /code

ADD Gemfile Gemfile.lock ./

RUN bundle config set --local without 'development' \
  && bundle install

# CLI
FROM ruby:${RUBY_VERSION}-slim-bullseye as CLI

ARG ENV_DIRECTORY
ENV ENV_DIRECTORY=${ENV_DIRECTORY}

ARG ENV_NAME
ENV ENV_NAME=${ENV_NAME}

ARG ENV_VERSION_FILE
ENV ENV_VERSION_FILE=${ENV_VERSION_FILE}

COPY --from=BUILDER /usr/local/bundle /usr/local/bundle

ADD entrypoint.rb /entrypoint.rb
ADD toys/ /toys/

ENTRYPOINT ["/entrypoint.rb"]
