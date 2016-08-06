class User < ActiveRecord::Base
    
  has_one :profile ,dependent: :destroy
  after_create :setup_profile
  has_many :identities
  attr_accessor :current_password
  
  extend FriendlyId
  friendly_id :username, use: :slugged
  
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" , background: "1100x500!" },
  :default_url => "/assets/profile-pic.png"
    
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, presence: true ,length: { maximum: 50 , minimum: 3}
  validates :gender  , inclusion: [true, false]
  
        
 
  

  def setup_profile
     self.create_profile # or Profile.create(user_id: self.id)
  end
  
  def find_for_oauth(auth)
    # Get the identity and user if they exist
    # Identity.find_for_oauth(auth)
    identity = Identity.find_by(provider: auth.provider, uid: auth.uid)
    identity = identities.create(uid: auth.uid, provider: auth.provider) if identity.nil?
    identity.oauth_token = auth.credentials.token
    identity.oauth_secret =auth.credentials.secret
    identity.save
    identity
  end 
  
  # def tweet(tweet)
  #   client = Twitter::REST::Client.new do |config|
  #     config.consumer_key        = Rails.application.config.twitter_key
  #     config.consumer_secret     = Rails.application.config.twitter_secret
  #     config.access_token        = oauth_token
  #     config.access_token_secret = oauth_secret
  #   end
    
  #   client.update(tweet)
  # end
 
end
