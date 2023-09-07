# Put the ruby ​​version you are using
FROM ruby:3.2.2

# Install the necessary libraries
RUN apt-get update -qq && apt-get install -y postgresql-client

# BUNDLE_FROZEN setting
RUN bundle config --global frozen 1

# Set working directory
WORKDIR /vehicle_mgt

# Copy and install the project gems
COPY Gemfile /vehicle_mgt/Gemfile
COPY Gemfile.lock /vehicle_mgt/Gemfile.lock
RUN bundle install

# Run entrypoint.sh to delete server.pid
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Listen on this specified network port
EXPOSE 3000

# Run rails server
CMD ["rails", "server", "-b", "0.0.0.0"]