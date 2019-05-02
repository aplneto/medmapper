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

ActiveRecord::Schema.define(version: 2019_05_02_005259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hospitals", id: false, force: :cascade do |t|
    t.bigint "register", null: false
    t.string "name", limit: 30, null: false
    t.string "sex", limit: 1, null: false
    t.string "telephone", limit: 11, null: false
    t.string "street", limit: 20, null: false
    t.bigint "number", null: false
    t.string "neighborhood", limit: 10, null: false
    t.string "latitude", limit: 20, null: false
    t.string "longitude", limit: 20, null: false
    t.string "region", limit: 5, null: false
    t.string "micro_region", limit: 10, null: false
    t.string "nature", limit: 10, null: false
    t.string "type", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["register"], name: "index_hospitals_on_register", unique: true
  end

end
