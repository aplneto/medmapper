class AddDeviseToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      # Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      # Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end
  add_index :users, :reset_password_token, unique: true
  #Ex:- add_index("admin_users", "username")
  end
end
