class ChangeColumnNameFromNameToUsernameInOwners < ActiveRecord::Migration[5.2]
  def change
    rename_column :owners, :name, :username
  end
end
