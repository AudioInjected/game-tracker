class OwnerController < ApplicationController 
  get '/new' do 
    redirect '/games' if logged_in?
    erb :'/owners/new'
  end 
  
  post '/owners' do 
    owner = Owner.create(params[:owner])
    log_in(owner)
    
    redirect '/games'
  end 
  
  get '/login' do 
    redirect '/games' if logged_in?
    erb :'/owners/login'
  end 
  
  post '/login' do 
    owner = Owner.find_by(username: params[:username])
    if !owner.nil?
      authentic = owner.authenticate(params[:password]) # helper method which authenticates and logs in 
      if authentic 
        log_in(owner)
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