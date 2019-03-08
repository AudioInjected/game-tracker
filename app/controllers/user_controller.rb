class UserController < ApplicationController 
  get '/users/new' do 
    redirect '/games' if logged_in?
    erb :'/users/new'
  end 
  
  post '/users' do 
    @user = User.create(params[:user])
    if @user.errors 
      erb :'/users/login'
    else 
    log_in(@user)
    
    redirect '/games'
    end 

  end 
  
  get '/login' do 
    redirect '/games' if logged_in?
    erb :'/users/login'
  end 
  
  post '/login' do 
    user = User.find_by(username: params[:username])
    if !user.nil?
      authentic = user.authenticate(params[:password]) # helper method which authenticates and logs in 
      if authentic 
        log_in(user)
        redirect '/games'
      else 
        redirect '/login'
      end 
    else 
      redirect '/login'
    end 
  end 
  
  post '/logout' do 
    logged_in? ? logout : redirect('/login')
  end 

end 