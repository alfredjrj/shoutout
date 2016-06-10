class AddGetFameToPosts < ActiveRecord::Migration
  def change
    
    add_reference :posts , :get_fame, index: true, foreign_key: true

    add_index :posts, [:get_fame_id, :created_at]
  end
end
