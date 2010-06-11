require 'rubygems'
require 'sinatra'
require 'whois'
require 'resolv'

def is_it_on_ec2
  begin
    uri = URI.parse(params[:host])
    params[:host] = uri.host || params[:host]
    @isonec2 = (Whois.whois(Resolv.new.getaddress(params[:host])).content.grep(/ec2/).any? ? "is on EC2" : "is not on EC2")
  rescue
    @isonec2 = "probably doesn't exist"
  end
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
