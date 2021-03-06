class Venture < ActiveRecord::Base
  belongs_to :profile
  has_many :posts , dependent: :destroy
  
 
  
  has_attached_file :image, styles: { small: "64x64#", med: "100x100#", large: "300x300#"  },
  :default_url => "/assets/paper.png"
    
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
     
  validates :title, presence: true ,length: { maximum: 50 , minimum: 3}
  validates :goal,  presence: true , length: {maximum: 250 , minimum: 10} 
  validates :profile_id, presence: true   
end




