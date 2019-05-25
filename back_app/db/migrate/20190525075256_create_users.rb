class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false, limit: 20
      t.string :email, null: false
      t.string :sex, limit: 1
      t.date :birthday
      t.string :encrypted_password, null: false
      t.string :name, null: false, limit: 100
      t.string :phone, limit: 25
      t.text :description

      t.timestamps
    end
    add_index :users, :email, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
