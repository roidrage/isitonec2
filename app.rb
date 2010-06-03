require 'rubygems'
require 'sinatra'
require 'whois'
require 'resolv'

get '/' do
  params[:host] + ": " + Whois.whois(Resolv.new.getaddress(params[:host])).content.grep(/ec2/)
end
