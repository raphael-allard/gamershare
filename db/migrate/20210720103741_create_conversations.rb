class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.references :first_participant, null: false, foreign_key: { to_table: :users }
      t.references :second_participant, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
