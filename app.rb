require 'rubygems'
require 'sinatra'
require 'whois'
require 'resolv'

def is_it_on_ec2
  @isonec2 = (Whois.whois(Resolv.new.getaddress(params[:host])).content.grep(/ec2/).any? ? "on EC2" : "not on EC2")
end

get '/' do
  erb :index
end

post '/' do
  is_it_on_ec2
  erb :show
end

get '/:host' do
  is_it_on_ec2
  erb :show
end
