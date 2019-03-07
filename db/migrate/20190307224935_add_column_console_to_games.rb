class AddColumnConsoleToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :console, :string
  end
end
