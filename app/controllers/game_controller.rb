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
  
  get '/games/:id/edit' do 
    @game = Game.find(params[:id])
    flash[:notice] = "All your base belong to us"
    @game.user == current_user ? erb(:'/games/edit') : redirect('/games')
  end 
  
  patch '/games/:id' do 
    @game = Game.find(params[:id])
    @game.name = params[:name] if !params[:name].empty?
    @game.release_date = params[:release_date] if !params[:release_date].empty?
    @game.platform = params[:platform] if !params[:platform].empty?
    @game.save
    flash[:notice] = "You have successfully edited your game!"
    
    redirect "/games/#{@game.id}"
  end 
  
  delete '/games/:id' do 
    @game = Game.find(params[:id])
    if @game.user == current_user
      @game.delete
      flash[:notice] = "Game sent into the ether"
      redirect '/games'
    else 
      flash[:notice] = "What a horrible night to have a curse"
      redirect '/games'
    end 
  end 
end 