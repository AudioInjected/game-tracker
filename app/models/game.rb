require_relative '../../lib/slug'
class Game < ActiveRecord::Base 
 # has_many :game_users
 # has_many :users, through: :game_users
  validates :name, presence: true
  validates :release_date, presence: true
  validates :platform, presence: true
  
  belongs_to :user
  has_many :game_genres 
  has_many :genres, through: :game_genres
  
end