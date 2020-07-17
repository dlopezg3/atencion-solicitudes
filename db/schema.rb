# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_16_001207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atentions", force: :cascade do |t|
    t.integer "channel"
    t.bigint "technologist_id", null: false
    t.string "cause"
    t.string "subcause"
    t.string "detail"
    t.string "solution"
    t.boolean "escalation"
    t.string "escalation_responsable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "business_id", null: false
    t.index ["business_id"], name: "index_atentions_on_business_id"
    t.index ["technologist_id"], name: "index_atentions_on_technologist_id"
    t.index ["user_id"], name: "index_atentions_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_offices_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requirement_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.bigint "requirement_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_type_id"], name: "index_requirements_on_requirement_type_id"
  end

  create_table "technologists", force: :cascade do |t|
    t.string "name"
    t.bigint "office_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["office_id"], name: "index_technologists_on_office_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "full_name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "atentions", "businesses"
  add_foreign_key "atentions", "technologists"
  add_foreign_key "atentions", "users"
  add_foreign_key "offices", "regions"
  add_foreign_key "requirements", "requirement_types"
  add_foreign_key "technologists", "offices"
end
