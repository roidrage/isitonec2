require 'rubygems'
require 'sinatra'
require 'app'

set :environment, :production
set :port, 4567
configure :production do
  enable :inline_templates
end
run Sinatra::Application
