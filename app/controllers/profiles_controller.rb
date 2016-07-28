class ProfilesController < ApplicationController
   
   
   # def new     
   #  @profile =  Profile.new
   # end
   
   def update
   
      if current_user.profile.update_attributes(profile_params)
         flash.now[:success] = 'update successful'
      else 
          flash.now[:danger] = 'somthing went wrong'
      end
      
   end 
   
    private
  
  def profile_params
    params.require(:profile).permit(:bio, :interests , :youtube,  :twitter, :facebook, :instagram )  
  end 
end
