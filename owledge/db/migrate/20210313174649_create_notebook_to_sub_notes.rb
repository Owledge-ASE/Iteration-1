class CreateNotebookToSubNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notebook_to_sub_notes do |t|

      t.string   "notebook_id"
      t.string   "subnote_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
  def down
    drop_table :notebook_to_sub_notes
  end
end
