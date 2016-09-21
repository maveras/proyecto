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

ActiveRecord::Schema.define(version: 20160920003628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comentaries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "request_apply_id"
    t.text     "comentary"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comentaries", ["request_apply_id"], name: "index_comentaries_on_request_apply_id", using: :btree
  add_index "comentaries", ["user_id"], name: "index_comentaries_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
  end

  add_index "comments", ["request_id"], name: "index_comments_on_request_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_applies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "request_id"
  end

  add_index "request_applies", ["request_id"], name: "index_request_applies_on_request_id", using: :btree
  add_index "request_applies", ["user_id"], name: "index_request_applies_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.text     "description"
    t.integer  "state_request"
    t.string   "location"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "title"
    t.datetime "date_activity"
    t.datetime "date_activity_end"
  end

  add_index "requests", ["interest_id"], name: "index_requests_on_interest_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "user_interests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_interests", ["interest_id"], name: "index_user_interests_on_interest_id", using: :btree
  add_index "user_interests", ["user_id"], name: "index_user_interests_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comentaries", "request_applies"
  add_foreign_key "comentaries", "users"
  add_foreign_key "comments", "requests"
  add_foreign_key "comments", "users"
  add_foreign_key "request_applies", "requests"
  add_foreign_key "request_applies", "users"
  add_foreign_key "requests", "interests"
  add_foreign_key "requests", "users"
  add_foreign_key "user_interests", "interests"
  add_foreign_key "user_interests", "users"
end
