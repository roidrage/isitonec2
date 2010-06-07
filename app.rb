require 'rubygems'
require 'sinatra'
require 'whois'
require 'resolv'

get '/' do
  erb :index
end

post '/' do
  @isonec2 = (Whois.whois(Resolv.new.getaddress(params[:host])).content.grep(/ec2/).any? ? "on EC2" : "not on EC2")
  erb :show
end

