class CreateProfessionals < ActiveRecord::Migration[5.2]
  def change
    create_table :professionals do |t|
      t.references :user, foreign_key: true
      t.string :registry, limit: 30, null: false
      t.string :ocupation, limit: 30, null: false
      t.boolean :validation

      t.timestamps
    end
    add_index :professionals, :registry, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
