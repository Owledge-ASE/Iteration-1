class CreateSubNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_notes do |t|

      t.string   "subnote_id"
      t.string   "title"
      t.text     "description"
      t.string   "likes"
      t.string   "dislikes"
      t.string   "parent_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
  def down
    drop_table :sub_notes
  end
end
