class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.belongs_to :user, null: false, index: true
      t.integer :amount, null: false
      t.timestamps null: false
    end
  end
end
