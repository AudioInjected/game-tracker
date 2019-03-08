class DropGameUsersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :game_users
  end
end
