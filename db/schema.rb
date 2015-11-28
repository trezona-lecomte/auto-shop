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

ActiveRecord::Schema.define(version: 20151128084902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.integer  "product_request_id"
    t.integer  "price_cents",         default: 0,     null: false
    t.string   "price_currency",      default: "USD", null: false
    t.string   "url",                                 null: false
    t.string   "product_name",                        null: false
    t.string   "source_name",                         null: false
    t.string   "source_location"
    t.text     "product_description"
    t.string   "image_url"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "offers", ["product_request_id"], name: "index_offers_on_product_request_id", using: :btree

  create_table "product_requests", force: :cascade do |t|
    t.string   "product_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",                          null: false
    t.string   "uid",                               null: false
    t.string   "name",                              null: false
    t.string   "email"
    t.string   "location"
    t.string   "image_url"
    t.string   "url"
    t.string   "token"
    t.string   "preferred_language", default: "en"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  add_foreign_key "offers", "product_requests"
end
