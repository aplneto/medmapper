class CreateCommentaries < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaries do |t|
      t.string :commentary, :limit => 140, null: false
      t.references :user, foreign_key: true
      t.references :hospital, foreign_key: true
      t.timestamps
    end
  end
end
