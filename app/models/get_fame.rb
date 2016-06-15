class GetFame < ActiveRecord::Base
  belongs_to :user
  
  has_many :ventures 
  has_many :posts
  
  validates :user, presence: true

end


