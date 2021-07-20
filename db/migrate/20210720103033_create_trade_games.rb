class CreateTradeGames < ActiveRecord::Migration[6.0]
  def change
    create_table :trade_games do |t|
      t.references :trade, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
