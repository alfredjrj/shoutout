class User < ActiveRecord::Base
    
   has_one :get_fame
  extend FriendlyId
  friendly_id :name, use: :slugged
  
    has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" , background: "1100x500!" },
     :default_url => "/assets/profile-pic.png"
    
     validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
 
end
