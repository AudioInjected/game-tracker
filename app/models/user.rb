require_relative '../../lib/slug'
 class User < ActiveRecord::Base 
  validates :username, format: { without: /\W/ }
  validates_uniqueness_of :username, :case_sensitive => false
  validates_uniqueness_of :email, :case_sensitive => false
  
  has_secure_password
  
  include Slug::InstanceMethods
  extend Slug::ClassMethods
   
  has_many :games
  has_many :game_users
  has_many :games, through: :game_users
end