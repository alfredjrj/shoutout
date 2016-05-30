class VenturesController < ApplicationController
   
   def new
        @venture = Venture.new
   end 
   
   def index
        @user = current_user
   end 
   
   def show
    #   @user = User.find(params[:id])
       @venture = Venture.find(params[:id])
       @post = Post.new
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
