class ChangeGameOwnersTableNameToGameUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :game_owners, :game_users
  end
end
