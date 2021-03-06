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

ActiveRecord::Schema.define(version: 20140318093904) do

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "purchased_at"
  end

  create_table "line_items", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"

  create_table "orders", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_notifications", force: true do |t|
    t.text     "params"
    t.integer  "cart_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "price",       precision: 8, scale: 2
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
