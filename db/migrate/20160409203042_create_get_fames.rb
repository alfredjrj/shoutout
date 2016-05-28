class CreateGetFames < ActiveRecord::Migration
  def change
    create_table :get_fames do |t|
  
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
