class GameController < ApplicationController 

  get '/games/new' do 
    redirect '/login' if !logged_in
    erb "/games/new"
  end 
  
  get '/games/:id' do 
    @game = Game.find(params[:id])
    erb :'/games/show'
  end 
  

end 