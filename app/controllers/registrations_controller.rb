class RegistrationsController < Devise::RegistrationsController
   
  

    # def create
    # # add custom create logic here
    # end

     
   private 
   
    def sign_up_params
        params.require(:user).permit(:username, :email, :name , :gender, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:username, :email, :name, :image, :gender, :password, :password_confirmation, :current_password)
    end
    
    
    def update_resource(resource, params)
      if params[:password].blank? && params[:password_confirmation].blank? && resource.email === params[:email]
         resource.update_without_password(params)
      else
         super
      end
    end
  
end