class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :total_nostalgia, :integer, default: 0
    add_column :users, :address, :string
  end
end
