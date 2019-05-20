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

ActiveRecord::Schema.define(version: 2019_05_19_025551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basic_health_units", id: :bigint, default: -> { "nextval('pharmacies_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "cnes", null: false
    t.string "name", limit: 80, null: false
    t.string "address", limit: 50, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25, null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnes"], name: "basic_health_units_cnes_idx", unique: true
    t.index ["type"], name: "basic_health_units_type_idx"
  end

  create_table "hospitals", id: :bigint, default: -> { "nextval('pharmacies_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "cnes", null: false
    t.string "name", limit: 80, null: false
    t.string "address", limit: 50, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25, null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnes"], name: "hospitals_cnes_idx", unique: true
    t.index ["type"], name: "hospitals_type_idx"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.bigint "cnes", null: false
    t.string "name", limit: 80, null: false
    t.string "address", limit: 50, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25, null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnes"], name: "index_pharmacies_on_cnes", unique: true
    t.index ["type"], name: "index_pharmacies_on_type"
  end

  create_table "specialized_units", id: :bigint, default: -> { "nextval('pharmacies_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "cnes", null: false
    t.string "name", limit: 80, null: false
    t.string "address", limit: 50, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25, null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnes"], name: "specialized_units_cnes_idx", unique: true
    t.index ["type"], name: "specialized_units_type_idx"
  end

  create_table "specialties", id: false, force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit_id", null: false
    t.string "unit_type", null: false
  end

end
