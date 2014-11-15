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

ActiveRecord::Schema.define(version: 20141115111524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "user"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "areas", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.boolean  "show_on_home_page", default: false
    t.integer  "position"
    t.boolean  "rental",            default: true
    t.boolean  "sale",              default: false
    t.string   "top"
    t.string   "left"
    t.string   "left_tail"
    t.string   "slug"
  end

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
  end

  create_table "contents", force: true do |t|
    t.string   "kind"
    t.text     "value"
    t.text     "value_ru"
    t.string   "description"
    t.string   "description_ru"
    t.string   "keywords"
    t.string   "keywords_ru"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_lists", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: true do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "home_photos", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "rentals",    default: false
    t.boolean  "sales",      default: false
  end

  create_table "images", force: true do |t|
    t.string   "image"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "villa_id"
    t.integer  "position"
  end

  create_table "requests", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.date     "check_in"
    t.date     "check_out"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "villa_id"
    t.integer  "budget_per_night"
    t.string   "phone"
  end

  create_table "subscribes", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "villa_features", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "villa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "villas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price_from"
    t.decimal  "price_to"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "services"
    t.text     "facilities"
    t.integer  "bedrooms"
    t.integer  "sleeps_up_to"
    t.string   "location"
    t.boolean  "rental",              default: true
    t.boolean  "sale",                default: false
    t.integer  "bathrooms"
    t.decimal  "sale_price"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "zoom"
    t.decimal  "low_month"
    t.decimal  "low_week"
    t.decimal  "low_night"
    t.decimal  "high_month"
    t.decimal  "high_week"
    t.decimal  "high_night"
    t.decimal  "peak_month"
    t.decimal  "peak_week"
    t.decimal  "peak_night"
    t.string   "domain"
    t.text     "price_guide"
    t.boolean  "house_rentals"
    t.boolean  "house_sales"
    t.boolean  "yacht_rentals"
    t.boolean  "car_rentals"
    t.boolean  "real_estate"
    t.text     "price_guide_ru"
    t.text     "description_ru"
    t.text     "price_guide_sale"
    t.text     "price_guide_sale_ru"
    t.text     "description_sale"
    t.text     "description_sale_ru"
    t.decimal  "yacht_price"
    t.decimal  "car_price"
    t.string   "owner_email"
  end

end
