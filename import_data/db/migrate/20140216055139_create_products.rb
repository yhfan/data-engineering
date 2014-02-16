class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :merchant_id, null: false
      t.string :description, null: false
      t.decimal :unit_price, precision: 10, scale: 2, null: false
    end

    add_index :products, :merchant_id
    add_index :products, :description
  end
end
