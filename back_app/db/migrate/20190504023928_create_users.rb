class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :login, :limit => 15, null: false
      t.string	:encrypted_password, null: false
      t.string  :name,   :limit => 50, null: false
      t.string  :sex,  :limit => 1, null: false
      t.string  :telephone,  :limit => 11
      t.string  :address,    :limit => 50
      t.string  :neighborhood,  :limit => 30
      t.datetime :birthday, null: false
      t.timestamps
    end
  end
end