class CreateNotebooks < ActiveRecord::Migration[6.1]
  def change
    create_table :notebooks do |t|
      t.string :notebook_id
      t.text :description
      t.string :title
      t.datetime :created_timestamp
      t.datetime :update_timestamp

      t.timestamps
    end
  end
end
