class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :nostalgia_point
      t.string :console
      t.string :developer
      t.date :release_date
      t.string :game_mode
      t.string :genre
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
