require 'rubygems'
require 'sinatra'

get '/' do
  `whois scalarium.com`
end
