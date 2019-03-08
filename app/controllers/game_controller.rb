class GameController < ApplicationController 
  get '/games/:slug' do 
    erb :'/games/index' if logged_in?
  end
end 