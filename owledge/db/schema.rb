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

ActiveRecord::Schema.define(version: 2021_03_13_185216) do

  create_table "notebook_to_sub_notes", force: :cascade do |t|
    t.string "notebook_id"
    t.string "subnote_id"
    t.datetime "created_timestamp"
    t.datetime "update_timestamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notebooks", force: :cascade do |t|
    t.string "notebook_id"
    t.text "description"
    t.string "title"
    t.datetime "created_timestamp"
    t.datetime "update_timestamp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_notes", force: :cascade do |t|
    t.string "subnote_id"
    t.text "description"
    t.string "title"
    t.datetime "created_timestamp"
    t.datetime "update_timestamp"
    t.string "parent_id"
    t.string "like"
    t.string "dislikes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
