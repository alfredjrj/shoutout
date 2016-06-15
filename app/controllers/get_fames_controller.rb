class GetFamesController < ApplicationController
   
   def show
      @user =   User.friendly.find(params[:id])
      @venture = Venture.new
      @posts = @user.get_fame.posts
  
   end 
 
   
 
   
   private

    def get_fame_params
      params.require(:get_fame).permit( )
    end
end



