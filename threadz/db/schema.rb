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

ActiveRecord::Schema.define(version: 20171120150657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clothings", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "outfit_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["outfit_id"], name: "index_clothings_on_outfit_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "outfit_id"
    t.bigint "clothing_id"
    t.bigint "user_id"
    t.index ["clothing_id"], name: "index_comments_on_clothing_id"
    t.index ["outfit_id"], name: "index_comments_on_outfit_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "outfits", force: :cascade do |t|
    t.string "name"
    t.string "occasion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_outfits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clothings", "outfits"
  add_foreign_key "comments", "clothings"
  add_foreign_key "comments", "outfits"
  add_foreign_key "comments", "users"
  add_foreign_key "outfits", "users"
end
