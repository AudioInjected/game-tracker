 class User < ActiveRecord::Base 
  has_secure_password
   
  has_many :games
  has_many :game_users
  has_many :games, through: :game_users
end