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

ActiveRecord::Schema.define(version: 2022_11_15_100810) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.string "title", null: false
    t.text "text", null: false
    t.integer "user_send_id"
    t.integer "admin_send_id"
    t.integer "user_receive_id"
    t.integer "admin_receive_id"
    t.boolean "release_status", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_notice_send_id"
    t.integer "admin_notice_send_id"
    t.integer "user_notice_receive_id"
    t.integer "admin_notice_receive_id"
    t.integer "notice_type"
    t.boolean "read", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "type", null: false
    t.integer "right", null: false
    t.string "prefecture", null: false
    t.string "municipality", null: false
    t.string "city_block", null: false
    t.string "address", null: false
    t.string "line", null: false
    t.string "station", null: false
    t.integer "walking_minute", null: false
    t.integer "land_area", null: false
    t.integer "building_area", null: false
    t.integer "price", null: false
    t.integer "sell_category", null: false
    t.string "age", null: false
    t.string "structure", null: false
    t.integer "location_floor"
    t.integer "building_coverage_ratio", null: false
    t.integer "floor_area_ratio", null: false
    t.string "city_planning"
    t.string "use_area"
    t.string "legal_restriction"
    t.string "road_contact"
    t.boolean "release_status", default: false, null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "location", null: false
    t.string "licensing_entity", null: false
    t.string "licensing_region", null: false
    t.integer "update_number", null: false
    t.string "representatives_name", null: false
    t.string "telephone_number", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "view_applications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.boolean "apply_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
