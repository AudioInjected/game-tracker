require_relative '../../lib/slug'
class Game < ActiveRecord::Base 
  has_many :game_users
  has_many :users, through: :game_users
  has_many :game_genres 
  has_many :genres, through: :game_genres
  
  include Slug::InstanceMethods 
  extend Slug::ClassMethods
end