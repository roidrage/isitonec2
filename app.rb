require 'rubygems'
require 'sinatra'
require 'whois'
require 'resolv'

enable :inline_templates
get '/' do
  erb :index
end

post '/' do
  @isonec2 = (Whois.whois(Resolv.new.getaddress(params[:host])).content.grep(/ec2/).any? ? "on EC2" : "not on EC2")
  erb :show
end


__END__

@@layout

<html>
  <head><title>Is it on EC2?</title></head>
  <body>
    <%= yield %>
  </body>
</html>

@@index

<form action="/" method="post">
  Hostname: <input name="host" type="text"/>
</form>

@@show

Host <%= params[:host] %> is <%= @isonec2 %>.
