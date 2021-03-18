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

ActiveRecord::Schema.define(version: 2021_03_18_031357) do

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "publisher_id"
    t.index ["parent_id"], name: "index_notes_on_parent_id"
    t.index ["publisher_id"], name: "index_notes_on_publisher_id"
  end

  create_table "user_comments", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "note_id"
    t.index ["note_id"], name: "index_user_comments_on_note_id"
    t.index ["user_id"], name: "index_user_comments_on_user_id"
  end

  create_table "user_reactions", force: :cascade do |t|
    t.integer "like"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "note_id"
    t.index ["note_id"], name: "index_user_reactions_on_note_id"
    t.index ["user_id", "note_id"], name: "index_user_reactions_on_user_id_and_note_id"
    t.index ["user_id"], name: "index_user_reactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "affiliation"
    t.string "organization"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "notes", "notes", column: "parent_id"
  add_foreign_key "notes", "users", column: "publisher_id"
  add_foreign_key "user_comments", "notes"
  add_foreign_key "user_comments", "users"
  add_foreign_key "user_reactions", "notes"
  add_foreign_key "user_reactions", "users"
end
