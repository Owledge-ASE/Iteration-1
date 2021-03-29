class CreateUserReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_reactions do |t|
      t.boolean :like

      t.timestamps
    end
  end
end
