class GameController < ApplicationController 
  get '/users/games' do 
    erb :'/games/index' if logged_in?
  end
end 