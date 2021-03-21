class CreateNotebookTags < ActiveRecord::Migration[6.1]
  def change
    create_table :notebook_tags do |t|
      t.timestamps
    end
  end
end
