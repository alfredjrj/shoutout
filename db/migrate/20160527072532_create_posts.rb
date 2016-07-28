class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.string :tags
      t.attachment :image
      t.references :venture, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
     
      t.timestamps null: false
    end
      add_index :posts, [:profile_id, :created_at]
  end
end
