# Use the official Heroku Ruby image as a base
FROM heroku/heroku:22

# Set the working directory
WORKDIR /app

# Copy the contents of your app (except for the Dockerfile and docker-compose files)
COPY . /app

# Install any dependencies (if needed)
RUN bundle install

# Expose the port your Rails app will run on
EXPOSE 3000

# Start your Rails application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
