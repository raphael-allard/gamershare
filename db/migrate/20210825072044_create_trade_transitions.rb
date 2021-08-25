class CreateTradeTransitions < ActiveRecord::Migration[6.0]
  def change
    create_table :trade_transitions do |t|
      t.string :to_state, null: false
      t.text :metadata, default: "{}"
      t.integer :sort_key, null: false
      t.integer :trade_id, null: false
      t.boolean :most_recent, null: false

      # If you decide not to include an updated timestamp column in your transition
      # table, you'll need to configure the `updated_timestamp_column` setting in your
      # migration class.
      t.timestamps null: false
    end

    # Foreign keys are optional, but highly recommended
    add_foreign_key :trade_transitions, :trades

    add_index(:trade_transitions,
              %i(trade_id sort_key),
              unique: true,
              name: "index_trade_transitions_parent_sort")
    add_index(:trade_transitions,
              %i(trade_id most_recent),
              unique: true,
              where: "most_recent",
              name: "index_trade_transitions_parent_most_recent")
  end
end
