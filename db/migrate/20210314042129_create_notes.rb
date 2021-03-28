class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.references :parent, index: true, foreign_key: { to_table: 'notes' }
      t.timestamps
    end
  end
end
