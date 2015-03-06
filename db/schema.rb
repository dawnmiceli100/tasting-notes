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

ActiveRecord::Schema.define(version: 20150303160425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aromas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flavors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasting_note_aromas", force: :cascade do |t|
    t.integer  "tasting_note_id"
    t.integer  "aroma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasting_note_flavors", force: :cascade do |t|
    t.integer  "tasting_note_id"
    t.integer  "flavor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasting_notes", force: :cascade do |t|
    t.datetime "tasting_date"
    t.string   "color"
    t.string   "color_intensity"
    t.string   "clarity"
    t.string   "aroma_intensity"
    t.string   "sweetness"
    t.string   "acidity"
    t.string   "tannin"
    t.string   "body"
    t.string   "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "quality"
    t.text     "comments"
    t.integer  "user_id"
    t.integer  "wine_id"
    t.integer  "wine_type_id"
    t.string   "flavor_intensity"
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "wine_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wines", force: :cascade do |t|
    t.string   "description"
    t.integer  "vintage"
    t.integer  "wine_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
