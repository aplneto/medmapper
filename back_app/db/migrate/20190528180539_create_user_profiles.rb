class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :name, limit: 100, null: false
      t.string :sex, limit: 1, null: false, default: 'f'
      t.datetime :birthday
      t.string :phone, limit: 20
      t.text :description, limit: 280
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
