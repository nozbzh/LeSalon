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

ActiveRecord::Schema.define(version: 20150707120010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_ref_id"
    t.integer  "basket_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "price_cents",    default: 0, null: false
  end

  add_index "basket_items", ["basket_id"], name: "index_basket_items_on_basket_id", using: :btree
  add_index "basket_items", ["product_ref_id"], name: "index_basket_items_on_product_ref_id", using: :btree

  create_table "baskets", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "baskets", ["user_id"], name: "index_baskets_on_user_id", using: :btree

  create_table "bill_clients", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "status"
    t.integer  "amount_cents", default: 0, null: false
  end

  add_index "bill_clients", ["user_id"], name: "index_bill_clients_on_user_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "product_ref_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "price_cents",    default: 0, null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_ref_id"], name: "index_order_items_on_product_ref_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "status_order"
    t.integer  "seller_id"
    t.integer  "bill_client_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "orders", ["bill_client_id"], name: "index_orders_on_bill_client_id", using: :btree
  add_index "orders", ["seller_id"], name: "index_orders_on_seller_id", using: :btree

  create_table "picture_products", force: :cascade do |t|
    t.integer  "product_group_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "picture_refs", force: :cascade do |t|
    t.integer  "product_ref_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "picture_sellers", force: :cascade do |t|
    t.string   "name"
    t.integer  "seller_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "picture_sellers", ["seller_id"], name: "index_picture_sellers_on_seller_id", using: :btree

  create_table "product_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "category_type"
    t.string   "category_style"
    t.string   "material"
    t.integer  "dimensions_length_cm"
    t.integer  "dimensions_width_cm"
    t.string   "dimensions_height_cm"
    t.text     "description"
    t.text     "characteristics"
    t.integer  "seller_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "product_refs", force: :cascade do |t|
    t.integer  "product_group_id"
    t.string   "color_name"
    t.decimal  "promotion_percentage"
    t.string   "availability"
    t.string   "delivery_time"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "reference"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "price_cents",          default: 0, null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.text     "description_short"
    t.text     "description"
    t.string   "phone"
    t.string   "address_street"
    t.string   "address_zip"
    t.string   "address_city"
    t.string   "address_country"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "sellers", ["email"], name: "index_sellers_on_email", unique: true, using: :btree
  add_index "sellers", ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address_street"
    t.string   "address_zip"
    t.string   "address_city"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "basket_items", "baskets"
  add_foreign_key "basket_items", "product_refs"
  add_foreign_key "baskets", "users"
  add_foreign_key "bill_clients", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "product_refs"
  add_foreign_key "orders", "bill_clients"
  add_foreign_key "orders", "sellers"
  add_foreign_key "picture_sellers", "sellers"
end
