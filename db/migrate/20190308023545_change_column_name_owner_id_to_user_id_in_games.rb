class ChangeColumnNameOwnerIdToUserIdInGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :owner_id, :user_id
  end
end
