class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
    end

    add_index :purchasers, [:last_name, :first_name]
  end
end
