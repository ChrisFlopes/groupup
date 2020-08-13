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

ActiveRecord::Schema.define(version: 2020_05_05_131459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groupmeetups", force: :cascade do |t|
    t.bigint "host_id"
    t.bigint "group_id"
    t.date "date"
    t.time "time"
    t.text "additional_info"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groupmeetups_on_group_id"
    t.index ["host_id"], name: "index_groupmeetups_on_host_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "host_id"
    t.text "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_groups_on_host_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.bigint "host_id"
    t.date "date"
    t.time "time"
    t.text "additional_info"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false, null: false
    t.index ["host_id"], name: "index_meetups_on_host_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "meetup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_participations_on_meetup_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.text "profile_img"
    t.integer "skill_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "groupmeetups", "groups"
  add_foreign_key "groupmeetups", "users", column: "host_id"
  add_foreign_key "groups", "users", column: "host_id"
  add_foreign_key "meetups", "users", column: "host_id"
  add_foreign_key "members", "groups"
  add_foreign_key "members", "users"
  add_foreign_key "participations", "meetups"
  add_foreign_key "participations", "users"
end
