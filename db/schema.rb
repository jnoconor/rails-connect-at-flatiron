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

ActiveRecord::Schema.define(version: 20150412175312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "url"
  end

  create_table "friends", force: :cascade do |t|
    t.string   "provider"
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "full_name"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "github"
    t.integer  "cohort_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "work_title"
    t.string   "personal_project"
    t.string   "profile_image"
    t.string   "quote"
    t.text     "bio"
    t.string   "education"
  end

  add_index "students", ["cohort_id"], name: "index_students_on_cohort_id", using: :btree

  create_table "user_friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_friends", ["friend_id"], name: "index_user_friends_on_friend_id", using: :btree
  add_index "user_friends", ["user_id"], name: "index_user_friends_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.text     "img_url"
    t.string   "username"
  end

  add_foreign_key "students", "cohorts"
  add_foreign_key "user_friends", "friends"
  add_foreign_key "user_friends", "users"
end
