class CreateVentures < ActiveRecord::Migration
  def change
    create_table :ventures do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :title
      t.string :tags
      t.string :goal
      t.attachment :image

      t.timestamps null: false
    end
  end
  
end
