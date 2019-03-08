class GameController < ApplicationController 

  get '/games' do 
    @user = current_user 
    flash[:notice] = "You are not logged in" if !logged_in?
    logged_in? ? erb(:'/games/index') : redirect('/login')
  end

  get '/games/new' do 
    redirect '/login' if !logged_in?
    erb :"/games/new"
  end 
  
  get '/games/:id' do 
    @game = Game.find(params[:id])
    erb :'/games/show'
  end 
  
  post '/games' do 
    @game = Game.create(params[:game])
    redirect "/games/#{@game.id}"
  end 
end 