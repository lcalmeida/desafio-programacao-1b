class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :customer
      t.string :description
      t.string :address
      t.string :provider

      t.float :unit_price
      t.integer :amount

      t.timestamps null: false
    end
  end
end
