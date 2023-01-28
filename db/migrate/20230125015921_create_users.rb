class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :username
    add_index :users, :email
  end
end
