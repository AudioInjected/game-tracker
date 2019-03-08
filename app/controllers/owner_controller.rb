class OwnerController < ApplicationController 
  get '/signup' do 
    erb :'/owners/new'
  end 
end 