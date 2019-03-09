class ApplicationController < Sinatra::Base
  
  configure do
  	enable :sessions
  	set :session_secret, "secret"
  	set :views, "app/views"
  end

  use Rack::Flash

  get '/' do 
    erb :'/homepage'
  end 
  
  get '/login' do 
    flash[:notice] = "You are already logged in" if logged_in?
    redirect "/games" if logged_in?
    erb :'/login'
  end 
  
  ##############################################
  # Refector this before submitting
  post '/login' do 
    @user = User.find_by(username: params[:username])
    if !@user.nil?
      authentic = @user.authenticate(params[:password]) # helper method which authenticates and logs in 
      if authentic 
        log_in(@user)
        redirect "/games"
      else 
        flash[:notice] = "The password you entered is incorrect"
        redirect '/login'
      end 
    else 
      flash[:notice] = "You have entered an invalid username. Sign up or check to make sure the username you entered is correct"
      redirect '/login'
    end 
  end 
  #############################################
  
  post '/logout' do 
    flash[:notice] = "The cake is a lie. You are not logged in for you to log out..." 
    logged_in? ? logout : redirect('/login')
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