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

ActiveRecord::Schema.define(version: 2020_05_23_122313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "families", force: :cascade do |t|
    t.integer "family_code"
    t.string "family_description"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_families_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "group_code"
    t.string "group_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string "line_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "product_code"
    t.string "product_description"
    t.string "product_ean"
    t.string "product_dun"
    t.bigint "tax_classification_id"
    t.bigint "group_id"
    t.bigint "family_id"
    t.boolean "status"
    t.boolean "releases"
    t.integer "generic_id"
    t.integer "display_ean"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "line_id"
    t.string "slug"
    t.index ["family_id"], name: "index_products_on_family_id"
    t.index ["group_id"], name: "index_products_on_group_id"
    t.index ["line_id"], name: "index_products_on_line_id"
    t.index ["tax_classification_id"], name: "index_products_on_tax_classification_id"
  end

  create_table "tax_classifications", force: :cascade do |t|
    t.string "tax_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "families", "groups"
  add_foreign_key "products", "families"
  add_foreign_key "products", "groups"
  add_foreign_key "products", "lines"
  add_foreign_key "products", "tax_classifications"
end
