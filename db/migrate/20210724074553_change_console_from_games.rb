class ChangeConsoleFromGames < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :console, :platform
  end
end
