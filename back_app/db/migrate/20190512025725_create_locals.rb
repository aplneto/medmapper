class CreateLocals < ActiveRecord::Migration[5.2]
  def change
    create_table :locals, id: false do |t|
      t.string :local, :limit => 30, null: false
      t.references :user, foreign_key: true
      t.string :register
      t.timestamps
    end
   add_index :locals, [:local, :register], unique: true
  end
end
