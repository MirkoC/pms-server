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

ActiveRecord::Schema.define(version: 20150710132456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "name_of_campaign"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "region"
    t.string   "country"
    t.string   "postal_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "poster_workers", force: :cascade do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal_code"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "rents", force: :cascade do |t|
    t.string   "rent_number"
    t.string   "rent_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "campaign_id"
    t.integer  "surface_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rents", ["campaign_id"], name: "index_rents_on_campaign_id", using: :btree
  add_index "rents", ["surface_id"], name: "index_rents_on_surface_id", using: :btree

  create_table "surface_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surfaces", force: :cascade do |t|
    t.string   "surface_number"
    t.decimal  "price"
    t.integer  "location_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "surface_type_id"
  end

  add_index "surfaces", ["location_id"], name: "index_surfaces_on_location_id", using: :btree
  add_index "surfaces", ["surface_type_id"], name: "index_surfaces_on_surface_type_id", using: :btree

  add_foreign_key "rents", "campaigns"
  add_foreign_key "rents", "surfaces"
  add_foreign_key "surfaces", "locations"
  add_foreign_key "surfaces", "surface_types"
end
