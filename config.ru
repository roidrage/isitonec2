require 'rubygems'
require 'sinatra'
require 'app'

set :environment, :production
set :port, 4567

run Sinatra::Application
