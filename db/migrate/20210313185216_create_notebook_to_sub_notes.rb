class CreateNotebookToSubNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notebook_to_sub_notes do |t|
      t.string :notebook_id
      t.string :subnote_id
      t.datetime :created_timestamp
      t.datetime :update_timestamp

      t.timestamps
    end
  end
end
