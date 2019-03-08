class UserController < ApplicationController 
  
  get '/users/new' do 
    
    flash[:notice] = "You are already logged in, can't sign up" if logged_in?
    redirect "/users/#{current_user.id}" if logged_in?
    erb :'/users/new'
  end 
  
  post '/users' do 
    @user = User.create(params[:user])
    if @user.errors.any? 
      flash[:notice] = "Make sure your username only consists of numbers, letters and underscore"
      erb :'/users/new'
    else 
    log_in(@user)
    flash[:notice] = "You have successfully created an account, Welcome" 
    redirect "/games"
    end 
  end 
end 