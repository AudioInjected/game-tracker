class ChangeOwnersTableNameToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :owners, :users
  end
end
