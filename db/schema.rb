
ActiveRecord::Schema.define(version: 20160417174459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "thoughts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "picture_id"
  end

  add_index "comments", ["picture_id"], name: "index_comments_on_picture_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
  end

  add_foreign_key "comments", "pictures"
end
