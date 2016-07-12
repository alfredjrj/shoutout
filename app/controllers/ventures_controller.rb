class VenturesController < ApplicationController
   before_action :authenticate_user!, only: [:create, :destroy ]

   
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
         redirect_to current_user
        else 
          redirect_to current_user    
        end 
            
   end 
   
   def destroy
       @venture =  Venture.find(params[:id])
       @venture.destroy
       flash[:success] = "byte deleted"
       redirect_to current_user
   end  
   
    private

    def venture_params
      params.require(:venture).permit( :goal , :image , :tags , :title )
    end
    
end
