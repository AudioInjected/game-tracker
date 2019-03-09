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
  
  post '/login' do 
    @user = User.find_by(username: params[:username])
    if @user.nil? 
      flash[:notice] = "You have entered an invalid username. Sign up or check to make sure the username you entered is correct"
      redirect '/login'
    elsif !@user.authenticate(params[:password])
      flash[:notice] = "The password you entered is incorrect"
      redirect '/login'
    elsif @user.authenticate(params[:password])
      flash[:notice] = "Log in successful"
      log_in(@user)
      redirect "/games"
    else 
      flash[:notice] = "An Error has occured"
      redirect '/'
    end
  end  
  
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
      redirect '/'
    end 
  end 
end