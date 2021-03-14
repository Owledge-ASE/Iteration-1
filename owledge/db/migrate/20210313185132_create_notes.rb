class CreateSubNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :description
      t.string :title
      t.timestamps

      add_belongs_to :notes, :parent, foreign_key:true
    end
  end
end
