class GetFame < ActiveRecord::Base
  belongs_to :user
  
  has_many :ventures 
  has_many :posts
  
  validates :user_id, presence: true

end


