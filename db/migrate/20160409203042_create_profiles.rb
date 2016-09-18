class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
  
      t.references :user, index: true, foreign_key: true
      t.string :bio
      t.string :occupation
      t.string :ethnicity
     
      
      t.text :interests
      t.text :hobbies
      t.integer :credits


      t.timestamps null: false
    end
  end
end
