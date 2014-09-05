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

ActiveRecord::Schema.define(version: 20140905025446) do

  create_table "accounts", force: true do |t|
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.string   "sex",           null: false
    t.string   "post_first",    null: false
    t.string   "post_last",     null: false
    t.integer  "prefecture_id", null: false
    t.string   "email",         null: false
    t.string   "hobby"
    t.text     "other_hobby"
    t.text     "opinion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prefectures", force: true do |t|
    t.integer  "pref_id"
    t.string   "pref_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
