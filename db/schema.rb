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

ActiveRecord::Schema.define(version: 2022_12_14_095036) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "management_notices", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_id"
    t.string "title", null: false
    t.text "content", null: false
    t.boolean "release_status", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "view_application_id"
    t.integer "property_id"
    t.integer "message_id"
    t.integer "reply_id"
    t.integer "management_notice_id"
    t.integer "visitor_id"
    t.integer "visited_id"
    t.integer "admin_send_id"
    t.integer "admin_receive_id"
    t.integer "notice_type"
    t.boolean "read", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "kind", null: false
    t.integer "right", null: false
    t.integer "prefecture", null: false
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
    t.integer "condition", null: false
    t.boolean "release_status", default: false, null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_id"
    t.integer "message_id"
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "company_name", default: "", null: false
    t.string "location", default: "", null: false
    t.string "licensing_entity", default: "", null: false
    t.string "licensing_region", default: ""
    t.integer "update_number", null: false
    t.integer "license_number", null: false
    t.string "representatives_name", default: "", null: false
    t.string "telephone_number", default: "", null: false
    t.string "manager_name", default: ""
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
    t.integer "user_id", null: false
    t.integer "property_id"
    t.integer "apply_status", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_view_applications_on_property_id"
    t.index ["user_id", "property_id"], name: "index_view_applications_on_user_id_and_property_id", unique: true
    t.index ["user_id"], name: "index_view_applications_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "view_applications", "properties"
  add_foreign_key "view_applications", "users"
end
