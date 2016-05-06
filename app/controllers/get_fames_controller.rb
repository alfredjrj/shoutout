class GetFamesController < ApplicationController
   
   def profile
      @user =   User.friendly.find(params[:id])
      @get_fame = GetFame.new()
  
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
   
   
   def view
      @user =   User.friendly.find(params[:id])
       @get_fame = @user.get_fame
    #  @get_fame  = GetFame.find(1)
    
    #   @user.get_fame
   end 
   
   
   private

    def get_fame_params
      params.require(:get_fame).permit( :goal , :image )
    end
end



