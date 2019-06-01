class CreateProfessionalProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_profiles do |t|
      t.string :registry, limit: 25, null: false
      t.string :ocupation, limit: 50, null: false
      t.boolean :validation, null: false, default: false
      t.text :contacts, array: true
      t.text :places, array: true
      t.text :services, array: true
      t.string :cpf, limit: 11, null: false
      t.references :user_profile, foreign_key: true

      t.timestamps
    end
    add_index :professional_profiles, :cpf, unique: true
    add_index :professional_profiles, :registry, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
