class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas, id: false do |t|
      t.string :area, :limit => 30, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
   add_index :areas, :area, unique: true
  end
end
