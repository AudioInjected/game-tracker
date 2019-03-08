class AddColumnEmailToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :email, :string
  end
end
