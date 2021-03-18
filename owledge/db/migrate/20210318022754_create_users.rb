class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, uniqueness: true, null: false
      t.string :password_digest, null: false
      t.string :first_name
      t.string :last_name
      t.string :affiliation
      t.string :organization
      t.timestamps
    end
  end
end
