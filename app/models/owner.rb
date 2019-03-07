class Owner < ActiveRecord::Base 
  has_many :games
  has_many :game_owners
  has_many :games, through: :game_owners
end