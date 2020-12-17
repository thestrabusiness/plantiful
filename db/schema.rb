# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_17_025826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_ins", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.boolean "fertilized", default: false, null: false
    t.boolean "watered", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "performed_by_id", null: false
    t.index ["performed_by_id"], name: "index_check_ins_on_performed_by_id"
    t.index ["plant_id"], name: "index_check_ins_on_plant_id"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "owner_id", null: false
    t.index ["name"], name: "index_gardens_on_name"
    t.index ["owner_id"], name: "index_gardens_on_owner_id"
  end

  create_table "gardens_users", force: :cascade do |t|
    t.bigint "garden_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["garden_id"], name: "index_gardens_users_on_garden_id"
    t.index ["user_id"], name: "index_gardens_users_on_user_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name", null: false
    t.string "check_frequency_unit", null: false
    t.integer "check_frequency_scalar", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "garden_id", null: false
    t.bigint "added_by_id", null: false
    t.index ["added_by_id"], name: "index_plants_on_added_by_id"
    t.index ["garden_id"], name: "index_plants_on_garden_id"
    t.index ["name"], name: "index_plants_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "check_ins", "plants"
  add_foreign_key "check_ins", "users", column: "performed_by_id"
  add_foreign_key "gardens", "users", column: "owner_id"
  add_foreign_key "gardens_users", "gardens"
  add_foreign_key "gardens_users", "users"
  add_foreign_key "plants", "gardens"
  add_foreign_key "plants", "users", column: "added_by_id"
end
