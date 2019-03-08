class UserController < ApplicationController 
  
  get '/users/new' do 
    
    flash[:notice] = "You are already logged in, can't sign up" if logged_in?
    redirect "/users/#{current_user.id}" if logged_in?
    erb :'/users/new'
  end 
  
  post '/users' do 
    @user = User.create(params[:user])
    if @user.errors 
      flash[:notice] = "Make sure your username only consists of numbers, letters and underscore"
      erb :'/users/new'
    else 
    log_in(@user)
    flash[:notice] = "You have successfully created an account, Welcome" 
    redirect "/users/#{@user.id}"
    end 

  end 
  
  get '/login' do 
    flash[:notice] = "You are already logged in" if logged_in?
    redirect "/users/#{@user.id}" if logged_in?
    erb :'/users/login'
  end 
  
  ##############################################
  # Refector this before submitting
  post '/login' do 
    @user = User.find_by(username: params[:username])
    if !@user.nil?
      authentic = @user.authenticate(params[:password]) # helper method which authenticates and logs in 
      if authentic 
        log_in(@user)
        redirect "/users/#{@user.id}"
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
  
  get '/users/:id' do 
    @user = current_user 
    flash[:notice] = "You are not logged in" if !logged_in?
    logged_in? ? erb(:'/games/index') : redirect('/login')
  end
  
  post '/logout' do 
    flash[:notice] = "The cake is a lie. You are not logged in for you to log out..." 
    logged_in? ? logout : redirect('/login')
  end 

end 