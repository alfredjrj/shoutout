class UsersController < ApplicationController

    

  
    def show
      @user =   User.friendly.find(params[:id])
      @venture = Venture.new
      @posts = @user.get_fame.posts
    #   debugger
  
    end 
   
   private 
 
  
end
