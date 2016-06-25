class VenturesController < ApplicationController
   # before_action :logged_in_user, only: [:create]

   
   def index
        @user = current_user
   end 
   
   def show
       @user =   User.friendly.find(params[:user_id])
       @venture = Venture.find(params[:id])
       @post = Post.new
       @posts = @venture.posts
      
   end 
    
   def create
        @get_fame = current_user.get_fame
        @venture = @get_fame.ventures.build(venture_params)
       
        if   @venture.save
         flash[:success] = "created!"
         redirect_to home_path
        end
   end 
   
   
    private

    def venture_params
      params.require(:venture).permit( :goal , :image , :tags , :title )
    end
    
end
