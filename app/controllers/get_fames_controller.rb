class GetFamesController < ApplicationController
   
   def profile
      @user =   User.friendly.find(params[:id])
    #   @get_fame = GetFame.new
      @venture = Venture.new
      @posts = @user.get_fame.posts
  
   end 
   
   def create
       
      @get_fame = current_user.build_get_fame(get_fame_params)
       
        if   @get_fame.save
            
      flash[:success] = "created!"
        redirect_to home_path
        else
          render 'get_fames/profile'
        end
       
     
      
   end
   
  
   
   
   private

    def get_fame_params
      params.require(:get_fame).permit( )
    end
end



