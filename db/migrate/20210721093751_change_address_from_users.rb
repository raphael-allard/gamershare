class ChangeAddressFromUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :address, :city
  end
end
