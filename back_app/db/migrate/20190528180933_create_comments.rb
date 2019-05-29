class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user_profile, foreign_key: true
      t.text :body, limit: 300, null: false
      t.integer :page_id, null: false
      t.string :page_type, null: false

      t.timestamps
    end
  end
end
