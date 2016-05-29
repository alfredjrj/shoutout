class Venture < ActiveRecord::Base
  belongs_to :get_fame
  has_many :posts , dependent: :destroy
  
  validates :name, presence: true 
  
   has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" , background: "1100x500!" },
     :default_url => "/assets/profile-pic.png"
    
     validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
