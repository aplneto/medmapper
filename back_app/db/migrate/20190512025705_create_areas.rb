class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas, id: false do |t|
      t.string :area, :limit => 30, null: false
      t.references :user, foreign_key: true
      t.string :register
      t.timestamps
    end
   add_foreign_key :users, :register
   add_index :areas, [:area, :register], unique: true
  end
end
