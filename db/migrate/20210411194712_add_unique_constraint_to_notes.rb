class AddUniqueConstraintToNotes < ActiveRecord::Migration[6.1]
  def change

    add_index :notes, [:publisher_id, :title, :parent_id], unique: true
  end
end
