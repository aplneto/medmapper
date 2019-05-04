class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :login, :limit => 10, null: false
      t.string	:encrypted_password, null: false
      t.string  :name,   :limit => 30, null: false
      t.string  :sex,  :limit => 1, null: false
      t.string  :telephone,  :limit => 11
      t.string  :street,    :limit => 20
      t.integer :number,    :limit => 5
      t.string  :neighborhood,  :limit => 10
      t.integer :day,   :limit => 2, null: false
      t.integer :month, :limit => 2, null: false
      t.integer :year,  :limit => 4, null: false
      t.timestamps
    end
  end
end