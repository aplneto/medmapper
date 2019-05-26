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

ActiveRecord::Schema.define(version: 2019_05_26_150607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "basic_health_units", force: :cascade do |t|
    t.bigint "health_unit_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id"], name: "index_basic_health_units_on_health_unit_id"
  end

  create_table "collaborators", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collaborators_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.text "body", null: false
    t.integer "page_id"
    t.string "page_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "health_units", force: :cascade do |t|
    t.bigint "cnes", null: false
    t.string "name", limit: 80, null: false
    t.string "address", limit: 50, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "specialties", array: true
    t.text "treatments", array: true
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

  create_table "professionals", force: :cascade do |t|
    t.bigint "user_id"
    t.string "registry", limit: 30, null: false
    t.string "ocupation", limit: 30, null: false
    t.boolean "validation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "places", array: true
    t.text "contacts", array: true
    t.text "services", array: true
    t.index ["registry"], name: "index_professionals_on_registry", unique: true
    t.index ["user_id"], name: "index_professionals_on_user_id"
  end

  create_table "service_providers", force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.string "address", limit: 50, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25, null: false
    t.bigint "user_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "services", array: true
    t.index ["name"], name: "index_service_providers_on_name", unique: true
    t.index ["user_id"], name: "index_service_providers_on_user_id"
  end

  create_table "specialized_units", force: :cascade do |t|
    t.bigint "health_unit_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id"], name: "index_specialized_units_on_health_unit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", limit: 20, null: false
    t.string "email", null: false
    t.string "sex", limit: 1
    t.date "birthday"
    t.string "encrypted_password", null: false
    t.string "name", limit: 100, null: false
    t.string "phone", limit: 25
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "administrators", "users"
  add_foreign_key "basic_health_units", "health_units"
  add_foreign_key "collaborators", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "hospitals", "health_units"
  add_foreign_key "pharmacies", "health_units"
  add_foreign_key "professionals", "users"
  add_foreign_key "service_providers", "users"
  add_foreign_key "specialized_units", "health_units"
end
