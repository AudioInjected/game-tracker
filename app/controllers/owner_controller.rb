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
  

end 