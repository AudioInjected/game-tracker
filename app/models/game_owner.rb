class GameOwner < ActiveRecord::Base
  belongs_to :game 
  belongs_to :owner
end 