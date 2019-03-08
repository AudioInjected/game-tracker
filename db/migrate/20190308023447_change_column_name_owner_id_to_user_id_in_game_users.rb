class ChangeColumnNameOwnerIdToUserIdInGameUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_users, :owner_id, :user_id
  end
end
