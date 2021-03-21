class AddForeignKeysToNotebookTags < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :notebook_tags, :notebook, { index: true, foreign_key: { to_table: 'notes' } }
    add_belongs_to :notebook_tags, :tag, { index: true, foreign_key: { to_table: 'tags' } }
  end
end
