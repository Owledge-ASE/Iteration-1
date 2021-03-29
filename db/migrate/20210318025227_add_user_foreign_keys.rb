class AddUserForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :user_comments, :user, { index: true, foreign_key: { to_table: 'users' } }
    add_belongs_to :user_comments, :note, { index: true, foreign_key: { to_table: 'notes' } }
    add_belongs_to :user_reactions, :user, { index: true, foreign_key: { to_table: 'users' } }
    add_belongs_to :user_reactions, :note, { index: true, foreign_key: { to_table: 'notes' } }

    add_index :user_reactions, [:user_id, :note_id]
  end
end
