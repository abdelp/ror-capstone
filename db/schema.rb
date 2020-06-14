# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_14_151117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "time_entries", force: :cascade do |t|
    t.bigint "author_id"
    t.string "name"
    t.interval "amount"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.index ["group_id"], name: "index_time_entries_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "gravatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_amount", default: 0
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "password_confirmation"
  end

  add_foreign_key "groups", "users"
  add_foreign_key "time_entries", "groups"
end
