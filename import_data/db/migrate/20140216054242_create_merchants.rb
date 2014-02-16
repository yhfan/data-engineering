class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :business_name, null: false
      t.string :street_address, null: false
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
    end

    add_index :merchants, :business_name
  end
end
