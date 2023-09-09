# Use an official Ruby runtime as the base image
FROM ruby:3.2

# Set environment variables
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Create and set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code into the image
COPY . .

# Expose port 3000 for the Rails application
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
