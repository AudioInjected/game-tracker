class UserController < ApplicationController 
  
  get '/users/new' do 
    flash[:notice] = "You are already logged in, can't sign up" if logged_in?
    redirect '/games' if logged_in?
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
    redirect "/users/#{@user.slug}"
    end 

  end 
  
  get '/login' do 
    flash[:notice] = "You are already logged in" if logged_in?
    redirect '/games' if logged_in?
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
        redirect "/users/#{@user.slug}"
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
  
  get '/users/:slug' do 
    @user = User.find_by_slug(params[:slug]) 
    erb :'/games/index' if logged_in?
  end
  
  post '/logout' do 
    flash[:notice] = "The cake is a lie. You are not logged in for you to log out..." 
    logged_in? ? logout : redirect('/login')
  end 

end 