class CreateVentures < ActiveRecord::Migration
  def change
    create_table :ventures do |t|
      t.references :get_fame, index: true, foreign_key: true
      t.string :title
      t.string :tags
      t.string :goal
      t.attachment :image

      t.timestamps null: false
    end
  end
  
end
