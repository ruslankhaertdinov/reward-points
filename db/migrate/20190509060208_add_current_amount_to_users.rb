class AddCurrentAmountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_amount, :integer, null: false, default: 0
  end
end
