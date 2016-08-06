class Identity < ApplicationRecord
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

 

  


  # def self.find_for_oauth(auth)
  #   identity = find_by(provider: auth.provider, uid: auth.uid)
  #   identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
  #   identity.oauth_token = auth.credentials.token
  #   identity.oauth_secret =auth.credentials.secret
  #   identity.save
  #   identity
  # end
  
  # def twee(tweet)
  #   client = Twitter::REST::Client.new do |config|
  #     config.consumer_key        = Rails.application.config.twitter_key
  #     config.consumer_secret     = Rails.application.config.twitter_secret
  #     config.access_token        = oauth_token
  #     config.access_token_secret = oauth_secret
  #   end
    
  #   client.update(tweet)
  # end
  
end
