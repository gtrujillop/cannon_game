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

ActiveRecord::Schema.define(version: 20160317001234) do

  create_table "packages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "session_resources", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.integer  "session_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "session_resources", ["session_id"], name: "index_session_resources_on_session_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "package_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "subject_id", limit: 4
  end

  add_index "sessions", ["package_id"], name: "index_sessions_on_package_id", using: :btree
  add_index "sessions", ["subject_id"], name: "index_sessions_on_subject_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_packages", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "package_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_packages", ["package_id"], name: "index_user_packages_on_package_id", using: :btree
  add_index "user_packages", ["user_id"], name: "index_user_packages_on_user_id", using: :btree

  create_table "user_session_tokens", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "user_session_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "user_session_tokens", ["user_session_id"], name: "index_user_session_tokens_on_user_session_id", using: :btree

  create_table "user_sessions", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "session_id",   limit: 4
    t.decimal  "grade",                  precision: 10
    t.datetime "session_date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "user_sessions", ["session_id"], name: "index_user_sessions_on_session_id", using: :btree
  add_index "user_sessions", ["user_id"], name: "index_user_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "is_admin",   limit: 1
  end

  add_foreign_key "session_resources", "sessions"
  add_foreign_key "sessions", "packages"
  add_foreign_key "sessions", "subjects"
  add_foreign_key "user_packages", "packages"
  add_foreign_key "user_packages", "users"
  add_foreign_key "user_session_tokens", "user_sessions"
  add_foreign_key "user_sessions", "sessions"
  add_foreign_key "user_sessions", "users"
end
