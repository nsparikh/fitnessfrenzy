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

ActiveRecord::Schema.define(version: 20140125184038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "units"
    t.string   "category"
  end

  create_table "challenges_users", id: false, force: true do |t|
    t.integer "challenge_id"
    t.integer "user_id"
  end

  add_index "challenges_users", ["challenge_id", "user_id"], name: "index_challenges_users_on_challenge_id_and_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["challenge_id"], name: "index_messages_on_challenge_id", using: :btree

  create_table "points", force: true do |t|
    t.float    "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tracker_id"
    t.float    "aux_data"
  end

  add_index "points", ["created_at"], name: "index_points_on_created_at", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "challenge_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["challenge_id", "member_id"], name: "index_relationships_on_challenge_id_and_member_id", unique: true, using: :btree
  add_index "relationships", ["challenge_id"], name: "index_relationships_on_challenge_id", using: :btree
  add_index "relationships", ["member_id"], name: "index_relationships_on_member_id", using: :btree

  create_table "trackers", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "units"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "goal"
    t.integer  "challenge_id"
    t.float    "aux_goal"
    t.string   "aux_units"
    t.string   "category"
  end

  add_index "trackers", ["updated_at"], name: "index_trackers_on_updated_at", using: :btree
  add_index "trackers", ["user_id", "start_date"], name: "index_trackers_on_user_id_and_start_date", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
