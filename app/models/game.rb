class Game < ActiveRecord::Base 
  
  validates :name, presence: true
  validates :release_date, presence: true
  validates :platform, presence: true
  
  belongs_to :user
  has_many :game_genres 
  has_many :genres, through: :game_genres
end