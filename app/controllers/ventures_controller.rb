class VenturesController < ApplicationController
   
   def create
      
        @get_fame = current_user.get_fame
      
        @venture = @get_fame.ventures.build(get_fame_params)
       
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
