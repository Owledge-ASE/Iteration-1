class NoteHasUserReference < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :publisher, { index: true, foreign_key: { to_table: 'users' }}
  end
end
