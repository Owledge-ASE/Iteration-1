class CreateUserComments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_comments do |t|
      t.text :comment

      t.timestamps
    end
  end
end
