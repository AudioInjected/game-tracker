class GameController < ApplicationController 
  get '/games/:slug' do 
    @user = User.find_by_slug 
    erb :'/games/index' if logged_in?
  end
end 