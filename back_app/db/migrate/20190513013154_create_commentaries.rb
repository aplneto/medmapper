class CreateCommentaries < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaries do |t|
      t.string :commentary, :limit => 140, null: false
      t.references :hospital, foreign_key: true
      t.timestamps
    end
   add_index :commentaries, :commentary, unique: true
  end
end
