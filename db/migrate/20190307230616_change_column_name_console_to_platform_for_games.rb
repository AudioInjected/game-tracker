class ChangeColumnNameConsoleToPlatformForGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :console, :platform
  end
end
