class GameController < ApplicationController 
  
  get '/games' do 
    @user = current_user 
    flash[:notice] = "You are not logged in" if !logged_in?
    logged_in? ? erb(:'/games/index') : redirect('/login')
  end

  get '/games/new' do 
    flash[:notice] = "You are not logged in" if !logged_in?
    redirect '/login' if !logged_in?
    erb :"/games/new"
  end 
  
  get '/games/:id' do 
    if @game = Game.where(id: params[:id]).first
      erb :'/games/show'
    else
      flash[:notice] = "Game not found"
      redirect '/games'
    end
  end 
  
  post '/games' do 
    @game = Game.create(params[:game])
    params[:genres].each {|genre_id| @game.genres << Genre.find(genre_id)} if params[:genres]
    @game.user = current_user
    @game.save
    redirect "/games/#{@game.id}"
  end 
  
  get '/games/:id/edit' do 
    @game = Game.where(id: params[:id]).first
    flash[:notice] = "An Error has occured. All your base belong to us"
    redirect '/games' if @game.nil?
    @game.user == current_user ? erb(:'/games/edit') : redirect('/games')
  end 
  ##############################
  patch '/games/:id' do 
    @game = Game.find(params[:id])
    if @game.update(params[:game])
      flash[:notice] = "You have successfully edited your game!"
      redirect "/games/#{@game.id}"
    else 
      flash[:notice] = "Something went wrong"
      redirect "/game/#{@game.id}/edit"
    end
  end 
  #############################
  
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