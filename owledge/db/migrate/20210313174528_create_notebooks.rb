class CreateNotebooks < ActiveRecord::Migration[6.1]
  def up
    create_table :notebooks do |t|

        t.string   "notebook_id"
        t.string   "title"
        t.text     "description"
        t.datetime "created_at"
        t.datetime "updated_at"
    end
  end
  def down
    drop_table :notebooks
  end
end
