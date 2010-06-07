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
    <style type="text/css" media="screen">
      body {
        margin: 100px auto;
        background-color: lightgrey;
        text-align: center;
        color: white;
        font-size: 24px;
      }
      
      input[type=text] {
        font-size: 24px;
        text-align: center;
        margin: 20px auto;
        margin-top: 5px;
        margin-bottom: 20px;
        display: block;
      }
      
      input[type=submit] {
        border: black 1px solid;
        font-size: 16px;
        background: #ffffff;
        margin-bottom: 10px;
      }
      
      a, a:visited, a:hover, a:active {
        text-decoration: none;
        color: white;
      }
    </style>
  
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
