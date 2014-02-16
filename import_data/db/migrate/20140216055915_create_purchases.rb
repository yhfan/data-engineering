class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :purchaser_id, null: false
      t.integer :merchant_id, null: false
      t.integer :product_id, null: false
      t.integer :item_count, null: false
      t.decimal :total_price, precision: 10, scale: 2
      t.timestamps
    end

    add_index :purchases, :purchaser_id
    add_index :purchases, :merchant_id
    add_index :purchases, :product_id
  end
end
