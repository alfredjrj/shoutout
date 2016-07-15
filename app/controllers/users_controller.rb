class UsersController < ApplicationController


  
    def show
      @user =   User.friendly.find(params[:id])
      @venture = Venture.new
      @posts = @user.get_fame.posts
    
    end 
    
    def update 
        
    end 
    
    def home
       
    end 
    
    def promote
    
    end
   
   private 
#   def user_params
#       params.require(:user).permit( :name , :image , :dob )
#   end
 
end
