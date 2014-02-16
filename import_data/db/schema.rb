# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140216055915) do

  create_table "merchants", force: true do |t|
    t.string "business_name",  null: false
    t.string "street_address", null: false
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
  end

  add_index "merchants", ["business_name"], name: "index_merchants_on_business_name"

  create_table "products", force: true do |t|
    t.integer "merchant_id",                          null: false
    t.string  "description",                          null: false
    t.decimal "unit_price",  precision: 10, scale: 2, null: false
  end

  add_index "products", ["description"], name: "index_products_on_description"
  add_index "products", ["merchant_id"], name: "index_products_on_merchant_id"

  create_table "purchasers", force: true do |t|
    t.string "last_name",  null: false
    t.string "first_name", null: false
  end

  add_index "purchasers", ["last_name", "first_name"], name: "index_purchasers_on_last_name_and_first_name"

  create_table "purchases", force: true do |t|
    t.integer  "purchaser_id",                          null: false
    t.integer  "merchant_id",                           null: false
    t.integer  "product_id",                            null: false
    t.integer  "item_count",                            null: false
    t.decimal  "total_price",  precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["merchant_id"], name: "index_purchases_on_merchant_id"
  add_index "purchases", ["product_id"], name: "index_purchases_on_product_id"
  add_index "purchases", ["purchaser_id"], name: "index_purchases_on_purchaser_id"

end
