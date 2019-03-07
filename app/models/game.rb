class Game < ActiveRecord::Base 
  belongs_to :owner
  has_many :game_genres 
  has_many :genres, through: :game_genres
end