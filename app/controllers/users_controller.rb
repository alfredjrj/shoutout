class UsersController < ApplicationController


  
    def show
      @user =   User.friendly.find(params[:id])
      @venture = Venture.new
      @posts = @user.get_fame.posts
    
    end 
    
    def home
       
    end 
    
    def promote
    
    end
   
   private 
 
 
end
