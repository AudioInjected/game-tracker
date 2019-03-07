class GameOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :game_owners do |t|
      t.integer :game_id 
      t.integer :owner_id
    end 
  end
end
