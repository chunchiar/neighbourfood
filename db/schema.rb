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

ActiveRecord::Schema.define(version: 20161005040554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "iso"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "keeper_id"
    t.integer  "fav_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "phone"
    t.text     "address"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "email"
    t.integer  "quantity"
    t.string   "payment_id"
    t.integer  "order_status", default: 0
    t.float    "total_cost"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "collect"
    t.datetime "expire"
    t.integer  "pax_total"
    t.integer  "pax_left"
    t.string   "location"
    t.float    "price"
    t.boolean  "has_pork"
    t.boolean  "has_beef"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name"
    t.text     "description"
    t.string   "image1"
    t.string   "slug"
    t.index ["slug"], name: "index_products_on_slug", unique: true, using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.string   "type"
    t.integer  "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string   "provider"
    t.string   "uid"
    t.string   "profile_image"
    t.string   "phone"
    t.string   "name"
    t.integer  "country_id"
    t.string   "state"
    t.string   "location"
    t.string   "address"
    t.text     "about"
    t.integer  "role",                   default: 0
    t.string   "store_name"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "bank"
    t.string   "acc_no"
    t.string   "acc_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
