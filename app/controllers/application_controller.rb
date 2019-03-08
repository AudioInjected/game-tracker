class ApplicationController < Sinatra::Base

  configure do
  	enable :sessions
  	set :session_secret, "secret"
  end
  
  configure do
  	set :views, "app/views"
  	set :public_dir, "public"
  end
  
  use Rack::Flash

  get '/' do 
    erb :'/homepage'
  end 
  
  get '/games' do 
    flash[:notice] = "You are not logged_in" if !logged_in?
    logged_in? ? erb(:'/games') : redirect('/login')
  end 
  
   helpers do 
    def current_user 
      User.find(session[:user_id])
    end 
    
    def log_in(user) 
      session[:user_id] = user.id
    end 
    
    def logged_in? 
      !!session[:user_id]
    end 
    
    def logout 
      session.clear
      flash[:notice] = "You have successfully logged out"
      redirect '/login'
    end 
  end 
end