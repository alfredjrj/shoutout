class OmniauthCallbacksController < Devise::OmniauthCallbacksController
   
  
   
  # def instagram
  #   # generic_callback( 'instagram' )
  # end

  def facebook
  # raise env["omniauth.auth"].extra.raw_info.likes.data[1].name.inspect 
  @identity = Identity.find_for_oauth(env["omniauth.auth"])
  @user = @identity.user
  
  if @user.nil?
    @user = User.from_facebook(env["omniauth.auth"])
    @identity.update_attribute( :user_id, @user.id )
    @user.create_profile
    # raise @user.inspect
  end 
   
  env["omniauth.auth"].extra.raw_info.likes.data.each do |data|
    like = @user.profile.likes.build(name: data.name)
    like.save!
    
  end 

   sign_in_and_redirect @user

  end

  def twitter
     @identity = Identity.find_for_oauth(env["omniauth.auth"])
     @user = @identity.user
      if @user.nil?
       @identity.update_attribute( :user_id, current_user.id )
      end 
    
    redirect_to @user
   
  end



  # def generic_callback( provider )
  #   @identity = Identity.find_for_oauth env["omniauth.auth"]

  #   @user = @identity.user || current_user
  #   if @user.nil?
  #     @user = User.create( email: @identity.email || "" )
  #     @identity.update_attribute( :user_id, @user.id )
  #   end

  #   if @user.email.blank? && @identity.email
  #     @user.update_attribute( :email, @identity.email)
  #   end

  #   if @user.persisted?
  #     @identity.update_attribute( :user_id, @user.id )
  #     # This is because we've created the user manually, and Device expects a
  #     # FormUser class (with the validations)
  #     @user = FormUser.find @user.id
  #     sign_in_and_redirect @user, event: :authentication
  #     set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
  #   else
  #     session["devise.#{provider}_data"] = env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end
end
