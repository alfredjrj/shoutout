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
   
   def edit
       @venture = Venture.find(params[:id])
   end 
    
   def create
        #  @user =   User.friendly.find(params[:id])
        #  @get_fame = @user.get_fame
        @profile = current_user.profile
        @venture = @profile.ventures.build(venture_params)
        if @venture.save!
         flash[:success] = "created!"
         redirect_to @current_user
        else 
          redirect_to @current_user
          flash[:danger] = "somthing went wrong try again"
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
