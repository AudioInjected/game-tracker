class User < ActiveRecord::Base 
  
  validates :username, format: { without: /\W/ }
  validates :username, presence: true
  validates_uniqueness_of :username, :case_sensitive => false
  validates_uniqueness_of :email, :case_sensitive => false
  
  has_secure_password
   
  has_many :games
end