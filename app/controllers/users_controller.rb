class UsersController < ApplicationController


  
    def show
      @user =   User.friendly.find(params[:id])
      @venture = Venture.new
      @posts = @user.profile.posts
    
    end 
    
    def update 
        
    end 
    
    def index 
       @users = User.where(nil) 
       
       @users = @users.gender(params[:gender]) if params[:gender].present?
       
       
       respond_to do |format|
        format.html
        format.json
        format.js   {}
      end
      # @users = @users.gender('male')
      # raise @users.inspect
      # @users = @users.name(params[:name]) if params[:name].present?
      # @users = @users.dob(params[:dob]) if params[:dob].present?
       
      # redirect_to users_path
       
    end 
    
    def home
       
    end 
    
    def promote
      # current_user.find_for_oauth(env["omniauth.auth"])
      # @identity = Identity.find_by(user_id:current_user.id)
      @identity = current_user.identities.where(provider:"twitter").first
      # raise @identity.inspect 
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = 'eZG402S9yDURoXrHWwJf6K56Y' 
        config.consumer_secret     = 	'UDBB0yvHILfcMSgMXOnbGSdbOFwQbq47qYTlM9FY7vgXMKaYmM'
        config.access_token        =  @identity.oauth_token
        config.access_token_secret =  @identity.oauth_secret
      end
      # client.current_user("testoauthsocial")
      # # client.user("gem")
      # client.followers("gem")
      @twitter_user = client.user('gem')
      client.update("I'm tweeting with @gem!")
    end
   
   private 
#   def user_params
#       params.require(:user).permit( :name , :image , :dob )
#   end
 
end
