class RegistrationsController < Devise::RegistrationsController
   
   
     
   private 
   
    def sign_up_params
        params.require(:user).permit(:email, :name , :gender, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:email, :name, :image, :gender, :password, :password_confirmation, :current_password)
    end
    
    
    def update_resource(resource, params)
      if params[:password].blank? && params[:password_confirmation].blank? && resource.email === params[:email]
         resource.update_without_password(params)
      else
         super
      end
    end
  
end