# syntax=docker/dockerfile:1

# This Dockerfile is designed for production, not development.
# Use this command to build and run the Docker image:
# docker build -t my-app .
# docker run -d -p 80:80 -p 443:443 --name my-app -e RAILS_MASTER_KEY=<value from config/master.key> my-app

# Ensure RUBY_VERSION matches the Ruby version specified in .ruby-version file
ARG RUBY_VERSION=3.2.0
FROM ruby:$RUBY_VERSION-slim AS base

# Set environment variables
ENV RAILS_ENV=staging \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development

# Set the working directory for the Rails app
WORKDIR /rails

# Installing base packages and cleaning up in a single layer to reduce image size
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Start a new build stage to build gems
FROM base AS builder

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev pkg-config && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems, clean up cache and precompile bootsnap for faster boot times
RUN bundle install --without development test && \
    bundle exec bootsnap precompile --gemfile && \
    rm -rf ~/.bundle /usr/local/bundle/cache

# Copy the application code into the image
COPY . .

# Precompile assets for production using a dummy secret key base
RUN SECRET_KEY_BASE=placeholder ./bin/rails assets:precompile

# Final stage to prepare app image
FROM base AS final

# Copy artifacts from the builder stage
COPY --from=builder /rails /rails
COPY --from=builder /usr/local/bundle /usr/local/bundle

# Create a non-root user to run the application
RUN groupadd --system --gid 1000 rails && \
    useradd --uid 1000 --gid rails --create-home --shell /bin/bash rails && \
    chown -R rails:rails /rails

# Use the non-root user to run the app
USER rails

# Expose port 300 for the Rails server
EXPOSE 3002

# Set the entrypoint script
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3002"]