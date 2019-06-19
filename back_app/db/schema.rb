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

ActiveRecord::Schema.define(version: 2019_06_05_044753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.text "body", null: false
    t.integer "page_id", null: false
    t.string "page_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_profile_id"], name: "index_comments_on_user_profile_id"
  end

  create_table "family_health_support_centers", force: :cascade do |t|
    t.string "team", limit: 10, null: false
    t.string "support_point", limit: 50, null: false
    t.string "name", limit: 80, null: false
    t.string "area", limit: 50, null: false
    t.string "phone", limit: 25
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.integer "district", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "health_units", force: :cascade do |t|
    t.bigint "cnes", null: false
    t.string "name", limit: 100, null: false
    t.string "address", limit: 100, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "specialties", array: true
    t.text "treatments", array: true
    t.string "state", limit: 50
    t.string "city", limit: 50
    t.string "type"
    t.string "category"
    t.index ["category"], name: "index_health_units_on_category"
    t.index ["type"], name: "index_health_units_on_type"
  end

  create_table "professional_profiles", force: :cascade do |t|
    t.string "registry", limit: 25, null: false
    t.string "ocupation", limit: 50, null: false
    t.boolean "validation", default: false, null: false
    t.text "contacts", array: true
    t.text "places", array: true
    t.text "services", array: true
    t.string "cpf", limit: 11, null: false
    t.bigint "user_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_professional_profiles_on_cpf", unique: true
    t.index ["registry"], name: "index_professional_profiles_on_registry", unique: true
    t.index ["user_profile_id"], name: "index_professional_profiles_on_user_profile_id"
  end

  create_table "service_providers", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "address", limit: 100, null: false
    t.string "neighborhood", limit: 30, null: false
    t.string "phone", limit: 25
    t.bigint "user_profile_id"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_service_providers_on_name", unique: true
    t.index ["user_profile_id"], name: "index_service_providers_on_user_profile_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "sex", limit: 1, default: "f", null: false
    t.date "birthday"
    t.string "phone", limit: 20
    t.text "description"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "picture"
    t.index ["account_id"], name: "index_user_profiles_on_account_id"
    t.index ["picture"], name: "index_user_profiles_on_picture"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "user_profiles"
  add_foreign_key "professional_profiles", "user_profiles"
  add_foreign_key "service_providers", "user_profiles"
  add_foreign_key "user_profiles", "accounts"
end
