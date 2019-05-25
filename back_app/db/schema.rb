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

ActiveRecord::Schema.define(version: 2019_05_25_063254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basic_health_units", force: :cascade do |t|
    t.bigint "health_unit_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id"], name: "index_basic_health_units_on_health_unit_id"
  end

  create_table "health_units", force: :cascade do |t|
    t.bigint "cnes", null: false
    t.string "name", limit: 80, null: false
    t.string "address", limit: 50, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25, null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnes"], name: "index_health_units_on_cnes", unique: true
  end

  create_table "hospitals", force: :cascade do |t|
    t.bigint "health_unit_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id"], name: "index_hospitals_on_health_unit_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.bigint "health_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id"], name: "index_pharmacies_on_health_unit_id"
  end

  create_table "specialized_units", force: :cascade do |t|
    t.bigint "health_unit_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id"], name: "index_specialized_units_on_health_unit_id"
  end

  create_table "specialties", primary_key: ["health_unit_id", "specialty"], force: :cascade do |t|
    t.bigint "health_unit_id", null: false
    t.string "specialty", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id", "specialty"], name: "index_specialties_on_health_unit_id_and_specialty", unique: true
    t.index ["health_unit_id"], name: "index_specialties_on_health_unit_id"
  end

  create_table "treatments", primary_key: ["health_unit_id", "treatment"], force: :cascade do |t|
    t.bigint "health_unit_id", null: false
    t.string "treatment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id", "treatment"], name: "index_treatments_on_health_unit_id_and_treatment", unique: true
    t.index ["health_unit_id"], name: "index_treatments_on_health_unit_id"
  end

  add_foreign_key "basic_health_units", "health_units"
  add_foreign_key "hospitals", "health_units"
  add_foreign_key "pharmacies", "health_units"
  add_foreign_key "specialized_units", "health_units"
  add_foreign_key "specialties", "health_units"
  add_foreign_key "treatments", "health_units"
end
