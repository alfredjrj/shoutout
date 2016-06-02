class Post < ActiveRecord::Base
  belongs_to :venture
  
 has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "300x300" , xlarge: "550x550" },
 :default_url => "/assets/profile-pic.png"

 validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
