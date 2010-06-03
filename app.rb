require 'rubygems'
require 'sinatra'

get '/' do
  params[:host] + ": " + `( host -t A #{params[:host]} | awk "{print $4}" | xargs whois | grep ec2 > /dev/null && echo "Runs on EC2") || echo "Not on EC2"`
end
