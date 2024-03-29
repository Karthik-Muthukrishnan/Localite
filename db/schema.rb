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

ActiveRecord::Schema.define(version: 20131124081432) do

  create_table "bubbles", force: true do |t|
    t.string   "pincode",    limit: 10
    t.string   "name"
    t.string   "zone"
    t.string   "district"
    t.string   "state"
    t.string   "active_ind", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["comment_id"], name: "index_comments_on_comment_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "district_lookup", id: false, force: true do |t|
    t.string "pin",      limit: 10
    t.string "district"
    t.string "state"
  end

  create_table "pincode_lookup", id: false, force: true do |t|
    t.string "area_name"
    t.string "pincode",           limit: 10
    t.string "state",             limit: 50
    t.string "original_district", limit: 100
  end

  create_table "post_likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_likes", ["post_id"], name: "index_post_likes_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "bubble_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "comment_ind"
  end

  add_index "posts", ["user_id", "bubble_id", "created_at"], name: "index_posts_on_user_id_and_bubble_id_and_created_at", using: :btree

  create_table "user_bubble_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "bubble_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "email_verification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
