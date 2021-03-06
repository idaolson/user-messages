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

ActiveRecord::Schema.define(version: 2022_01_15_212932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "message"
    t.integer "role"
    t.boolean "active", default: false, null: false
    t.datetime "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "user_announcements", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "announcement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_user_announcements_on_announcement_id"
    t.index ["user_id"], name: "index_user_announcements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "email"
  end

  add_foreign_key "user_announcements", "announcements"
  add_foreign_key "user_announcements", "users"
end
