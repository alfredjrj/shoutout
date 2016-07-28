class Post < ActiveRecord::Base
   

  belongs_to :venture
  belongs_to :profile
  
 default_scope -> { order(created_at: :desc) }
  
 has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "300x300" , xlarge: "550x550" },
 :default_url => "/assets/profile-pic.png"

 validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
 validates :venture_id, presence: true 
 
 def get_fame_id_for_post
   self.get_fame_id = current_user.get_fame.id 
   self.save
 end 
 
end
