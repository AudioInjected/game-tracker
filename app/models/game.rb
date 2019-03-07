class Game < ActiveRecord::Base 
  has_many :game_owners
  has_many :owners, through: :game_owners
  has_many :game_genres 
  has_many :genres, through: :game_genres
end