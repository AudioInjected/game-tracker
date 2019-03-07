class ApplicationController < Sinatra::Base

  configure do
  	enable :sessions
  	set :session_secret, "secret"
  end
  
  configure do
  	set :views, "app/views"
  	set :public_dir, "public"
  end

  get '/' do 
    erb :'/homepage'
  end 
  
end