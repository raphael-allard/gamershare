class ChangeColumnsFromGames < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :title, :name
    remove_column :games, :developer
    remove_column :games, :game_mode
    remove_column :games, :genre

    add_column :games, :developers, :string, array: true, default: []
    add_column :games, :game_modes, :string, array: true, default: []
    add_column :games, :genres, :string, array: true, default: []
  end
end
