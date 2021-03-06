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

ActiveRecord::Schema.define(version: 20160320180238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "sitter_id",                    null: false
    t.integer  "requester_id",                 null: false
    t.date     "start_date",                   null: false
    t.date     "end_date",                     null: false
    t.boolean  "approved",     default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string   "name",       null: false
    t.date     "birthday",   null: false
    t.string   "breed",      null: false
    t.string   "size",       null: false
    t.text     "bio"
    t.integer  "owner_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.string   "picture"
    t.boolean  "sitter",         default: true,  null: false
    t.string   "housing_type"
    t.integer  "xp_years",       default: 0
    t.decimal  "price"
    t.text     "bio"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "country",        default: "USA", null: false
    t.string   "zip_code"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.date     "birthday",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
