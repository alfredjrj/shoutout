class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_many :ventures 
  has_many :posts
  has_many :likes
  

  
  validates :user_id, presence: true

end


