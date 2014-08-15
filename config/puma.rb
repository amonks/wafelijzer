threads Integer(ENV['MIN_THREADS']  || 4), Integer(ENV['MAX_THREADS'] || 4)

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'
