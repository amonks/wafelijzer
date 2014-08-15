threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 16)

preload_app!

environment ENV['RACK_ENV'] || 'development'
