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

ActiveRecord::Schema.define(version: 20140313030201) do

  create_table "card_types", force: true do |t|
    t.string   "name",       null: false
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: true do |t|
    t.integer  "card_type_id"
    t.string   "title",        null: false
    t.string   "desc"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["card_type_id"], name: "index_cards_on_card_type_id"

  create_table "shows", force: true do |t|
    t.string   "name",       null: false
    t.string   "desc"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name",         limit: 15,             null: false
    t.integer  "count",                   default: 1, null: false
    t.integer  "tagable_id"
    t.string   "tagable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name"
  add_index "tags", ["tagable_id", "tagable_type"], name: "index_tags_on_tagable_id_and_tagable_type"

  create_table "thumb_images", force: true do |t|
    t.string   "asset"
    t.integer  "thumb_imageable_id",   null: false
    t.string   "thumb_imageable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "thumb_images", ["thumb_imageable_id", "thumb_imageable_type"], name: "by_imageable"

  create_table "timelines", force: true do |t|
    t.integer  "volume_id",  null: false
    t.integer  "card_id",    null: false
    t.integer  "at_time",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timelines", ["card_id"], name: "index_timelines_on_card_id"
  add_index "timelines", ["volume_id"], name: "index_timelines_on_volume_id"

  create_table "volumes", force: true do |t|
    t.integer  "show_id",    null: false
    t.integer  "no"
    t.string   "resource"
    t.string   "title",      null: false
    t.string   "desc"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volumes", ["no"], name: "index_volumes_on_no"
  add_index "volumes", ["show_id"], name: "index_volumes_on_show_id"

end
