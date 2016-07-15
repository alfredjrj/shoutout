require 'test_helper'

class RegistrationsControllerTest <  ActionDispatch::IntegrationTest
   
   def setup  
       @user =  User.create( name: "alfred jay" , email: "alfredj@gmail.com"  , password: "alfred123" ,password_confirmation: "alfred123")
   end 
   
   test "can create user " do 
       assert_difference('User.count', 1) do
         post user_registration_path,
         params: { user: { name: "alfred jay" , email: "alfredj@gmail.com"  , password: "alfred123" ,password_confirmation: "alfred123"}}
      end
      assert_response :success
   end 
   
   # test "can update user" do 
      
   # end 
   
   
end 