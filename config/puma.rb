# # This file configures `puma`, our app server.

# We want to be able to set the number of threads from ENV so we can tune the app quickly. Default to 1-16.
threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 16)

preload_app!

# set the environment
environment ENV['RACK_ENV'] || 'development'
