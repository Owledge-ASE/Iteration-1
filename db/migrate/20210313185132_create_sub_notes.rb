class CreateSubNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_notes do |t|
      t.string :subnote_id
      t.text :description
      t.string :title
      t.datetime :created_timestamp
      t.datetime :update_timestamp
      t.string :parent_id
      t.string :like
      t.string :dislikes

      t.timestamps
    end
  end
end
