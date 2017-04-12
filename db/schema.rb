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

ActiveRecord::Schema.define(version: 20170412060719) do

  create_table "pump_photos", force: :cascade do |t|
    t.integer  "pump_id",            null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["pump_id"], name: "index_pump_photos_on_pump_id"
  end

  create_table "pumps", force: :cascade do |t|
    t.integer  "pumps_category_id",                null: false
    t.string   "mark"
    t.decimal  "supply"
    t.integer  "push"
    t.decimal  "engine"
    t.decimal  "max_temp_material"
    t.boolean  "show",              default: true
    t.text     "description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["pumps_category_id"], name: "index_pumps_on_pumps_category_id"
  end

  create_table "pumps_categories", force: :cascade do |t|
    t.string   "title"
    t.text     "appointment"
    t.text     "manufacturing_options"
    t.text     "operating_conditions"
    t.integer  "type_material_id",      null: false
    t.decimal  "max_temp_material"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["type_material_id"], name: "index_pumps_categories_on_type_material_id"
  end

  create_table "search_caches", force: :cascade do |t|
    t.string   "query"
    t.text     "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_materials", force: :cascade do |t|
    t.integer  "code",       null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_type_materials_on_code"
    t.index ["name"], name: "index_type_materials_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "login",           null: false
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["login"], name: "index_users_on_login"
  end

end
