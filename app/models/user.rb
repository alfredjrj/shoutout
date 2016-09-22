class User < ActiveRecord::Base
    
  has_one :profile ,dependent: :destroy
  after_create :setup_profile
  has_many :identities
  attr_accessor :current_password
  
  extend FriendlyId
  friendly_id :username, use: :slugged
  
 
  
  has_attached_file :image, styles: { med: "100x100#", large: "200x200#" , background: "1100x500!" },
  :default_url => "/assets/profile-pic.png"
    
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauth_providers => [:facebook , :twitter]
         
  validates :name, presence: true ,length: { maximum: 50 , minimum: 3}
  validates :gender  , presence: true 
  
        
    # scope :location, -> (location_id) { where location_id: location_id }
    scope :gender, -> (gender) { where gender: gender }
    # scope :dob, -> (dob) { where dob: dob } 
    # scope :name, -> (name) { where name: name } 

  def setup_profile
    if self.profile.nil?
     self.create_profile # or Profile.create(user_id: self.id)
    end 
  end
  
  
  def self.from_facebook(auth)
      user = User.new
      user.email =  "alfred@gmail.com"
      user.password = "alfred1992"
      user.password_confirmation = "alfred1992"
      user.username = "alfred" 
      user.name = auth.info.name 
      user.image =URI.parse(auth.info.image)
      user.image_file_name= auth.info.name + ".jpg"
      # user.dob = Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y')
      user.gender = auth.extra.raw_info.gender 
      user.save!
      user.image.reprocess!
     
      user
  end 
  
 
end
