class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.text :body, null:false, limit: 180
      t.integer :page_id
      t.string :page_type

      t.timestamps
    end
  end
end
